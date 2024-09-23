from django.shortcuts import render, redirect
from userauths.forms import SignUpForm
from hostel.models import Hostel, Booking, ActivityLog, StaffOnDuty, Room, RoomType
from django.contrib import messages
from datetime import datetime

def index(request):
    hostels = Hostel.objects.filter(status="Live")
    form = SignUpForm()  # Create an instance of the SignUpForm
    context = {
        "hostels": hostels,
        "form": form
    }
    return render(request, "hostel/hostel.html", context)
def checkout(request, booking_id):
    print(f"Checkout view reached with booking_id: {booking_id}")
    
    # Check if the booking_id is numeric or not
    if booking_id.isdigit():
        # If it's a number, search by the `id` field (primary key)
        booking = Booking.objects.get(id=int(booking_id))
    else:
        # If it's a string, search by the `booking_id` field
        booking = Booking.objects.get(booking_id=booking_id)

    context = {
        "booking": booking
    }
    return render(request, "hostel/checkout.html", context)


def dashboard(request):
    return render(request, 'hostel/dashboard.html')



def hostel_detail(request, slug):
    hostel = Hostel.objects.get(status="Live", slug=slug)
    context = {
        "hostel":hostel
    }
    return render(request, "hostel/hostel_detail.html", context)

def room_type_detail(request, slug, rt_slug):
    print("Reached room_type_detail view")
    hostel = Hostel.objects.get(status="Live", slug=slug)
    room_type = RoomType.objects.get(hostel=hostel,slug=rt_slug)
    rooms = Room.objects.filter(room_type=room_type, is_available=True)

    id = request.GET.get("hostel-id")
    checkin = request.GET.get("checkin")
    checkout = request.GET.get("checkout")

    print("Hostel ID:", hostel.id)
    print("Room Type Slug:", rt_slug)

    context = {
        "hostel":hostel,
        "room_type":room_type,
        "rooms": rooms,
        "checkin":checkin,
        "checkout":checkout,
        
    }
    return render(request, "hostel/room_type_detail.html", context)





def submit_booking(request, booking_id):
    if request.method == 'POST':
        # Assume booking data is being processed here
        booking = Booking.objects.get(id=booking_id)

        # Do necessary processing of the booking, for example, saving payment info, etc.

        # After successfully saving the booking, redirect to the homepage
        messages.success(request, 'Booking completed successfully!')
        return redirect('homepage')  # Replace 'homepage' with your homepage's URL name
from django.shortcuts import redirect, render
from django.contrib import messages
from .models import Booking

def complete_booking(request, booking_id):
    if request.method == "POST":
        # Retrieve the booking using the booking_id
        booking = Booking.objects.get(id=booking_id)

        # Save any additional form data if necessary
        booking.full_name = request.POST.get('full_name')
        booking.email = request.POST.get('email')
        booking.phone = request.POST.get('phone')
        booking.check_in_date = request.POST.get('check_in_date')
        booking.check_out_date = request.POST.get('check_out_date')

        # Mark booking as complete (custom logic)
        booking.is_active = False
        booking.save()

        # Success message and redirect to the booking confirmation page
        messages.success(request, 'Your booking has been completed successfully.')
        return redirect('hostel:booking_confirmation', booking_id=booking.id)  # Update this line

    return render(request, 'booking/checkout.html', {'booking': booking})
def booking_confirmation(request, booking_id):
    try:
        booking = Booking.objects.get(id=booking_id)
        return render(request, "booking/booking_confirmation.html", {"booking": booking})
    except Booking.DoesNotExist:
        messages.error(request, "Booking not found.")
        return redirect("hostel:index")
      # Redirect to the index or an error page
def selected_rooms(request):
    total = 0 
    room_count = 0
    total_days = 0
    checkin = ""
    checkout = ""
    context = {}  # Initialize context here

    if 'selection_data_obj' in request.session:
        hostel = None
        if request.method == "POST":
            for h_id, item in request.session['selection_data_obj'].items():
                id = int(item['hostel_id'])
                checkin = item.get('checkin')
                checkout = item.get('checkout')
                room_type_ = int(item['room_type'])
                room_id = int(item['room_id'])

                user = request.user
                try:
                    hostel = Hostel.objects.get(id=id)
                    room = Room.objects.get(id=room_id)
                    room_type = RoomType.objects.get(id=room_type_)
                except Hostel.DoesNotExist:
                    messages.error(request, "Hostel not found.")
                    return render(request, "hostel/selected_rooms.html", context)
                except Room.DoesNotExist:
                    messages.error(request, "Room not found.")
                    return render(request, "hostel/selected_rooms.html", context)
                except RoomType.DoesNotExist:
                    messages.error(request, "Room type not found.")
                    return render(request, "hostel/selected_rooms.html", context)

            date_format = "%Y-%m-%d"
            try:
                checkin_date = datetime.strptime(checkin, date_format)
                checkout_date = datetime.strptime(checkout, date_format)
                total_days = (checkout_date - checkin_date).days
                
                if total_days <= 0:
                    messages.error(request, "Check-out date must be after the check-in date.")
                    return render(request, "hostel/selected_rooms.html", context)
            except ValueError:
                messages.error(request, "Invalid date format.")
                return render(request, "hostel/selected_rooms.html", context)

            full_name = request.POST.get("full_name")
            email = request.POST.get("email")
            phone = request.POST.get("phone")

            if not full_name or not email or not phone:
                messages.error(request, "Please provide full name, email, and phone number.")
                return render(request, "hostel/selected_rooms.html", context)

            try:
                booking = Booking.objects.create(
                    hostel=hostel,
                    room_type=room_type,
                    check_in_date=checkin,
                    check_out_date=checkout,
                    total_days=total_days,
                    full_name=full_name,
                    email=email,
                    phone=phone,
                    user=request.user or None
                )

                for h_id, item in request.session['selection_data_obj'].items():
                    room_id = int(item["room_id"])
                    room = Room.objects.get(id=room_id)
                    booking.room.add(room)
                    room_count += 1
                    price = room_type.price

                    room_price = price * room_count
                    total += room_price * total_days
                
                booking.total += float(total)
                booking.before_discount += float(total)
                booking.save()
                print(f"Booking created: {booking.id}")
                return redirect("hostel:checkout", booking_id=booking.id)

            except Exception as e:
                messages.error(request, "Booking could not be created.")
                print(f"Error creating booking: {e}")
                return render(request, "hostel/selected_rooms.html", context)

        # Handle GET request or after processing POST
        for h_id, item in request.session['selection_data_obj'].items():
            id = int(item['hostel_id'])
            checkin = item.get('checkin', '')
            checkout = item.get('checkout', '')
            room_type_ = int(item['room_type'])
            room_id = int(item['room_id'])

            room_type = RoomType.objects.get(id=room_type_)

            if not checkin or not checkout:
                messages.warning(request, "Check-in and check-out dates are required.")
                return render(request, "hostel/selected_rooms.html", context)

            date_format = "%Y-%m-%d"
            try:
                checkin_date = datetime.strptime(checkin, date_format)
                checkout_date = datetime.strptime(checkout, date_format)
                total_days = (checkout_date - checkin_date).days
            except ValueError:
                messages.error(request, "Invalid date format.")
                return render(request, "hostel/selected_rooms.html", context)

            room_count += 1
            price = room_type.price
            total += price * total_days
            
            hostel = Hostel.objects.get(id=id)

        context = {
            "data": request.session['selection_data_obj'],
            "total_selected_items": len(request.session['selection_data_obj']),
            'total': total,
            'checkin': checkin,
            'checkout': checkout,
            'hostel': hostel,
        }
        return render(request, "hostel/selected_rooms.html", context)
    else:
        messages.warning(request, "No selected rooms.")
        return render(request, "hostel/selected_rooms.html", context)
