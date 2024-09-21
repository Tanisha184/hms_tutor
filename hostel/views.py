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

def selected_rooms(request):
    total = 0 
    room_count = 0
    total_days = 0
    checkin = ""
    checkout = ""

    if 'selection_data_obj' in request.session:
        print(request.session.get('selection_data_obj'))

        if request.method == "POST":
          for h_id, item in request.session['selection_data_obj'].items():
            id = int(item['hostel_id'])
            checkin = item.get('checkin', '')  # Use .get() to avoid KeyError
            checkout = item.get('checkout', '')
            room_type_ = int(item['room_type'])
            room_id = int(item['room_id'])

            user = request.user
            hostel = Hostel.objects.get(id=id)
            room = Room.objects.get(id=room_id)
            room_type = RoomType.objects.get(id=room_type_)

          date_format = "%Y-%m-%d"
          checkin_date = datetime.strptime(checkin, date_format)
          checkout_date = datetime.strptime(checkout, date_format)
          time_difference = checkout_date - checkin_date
          total_days = time_difference.days
        
          full_name = request.POST.get("full_name")
          email = request.POST.get("email")
          phone = request.POST.get("phone")
          

          booking = Booking.objects.create(
              hostel = hostel,
              room_type=room_type,
              check_in_date = checkin,
              check_out_date = checkout,
              total_days=total_days,
              full_name = full_name,
              email=email,
              phone = phone,
              user=request.user or None
          )

          for h_id, item in request.session['selection_data_obj'].items():
              room_id = int(item["room_id"])
              room=Room.objects.get(id=room_id)
              booking.room.add(room)
              room_count += 1
              days = total_days
              price = room_type.price

              room_price = price * room_count
              total = room_price * days
              
          booking.total+=float(total)
          booking.before_discount += float(total)
          booking.save()
          return redirect("hostel:checkout", booking.booking_id)

        hostel = None
        for h_id, item in request.session['selection_data_obj'].items():
            id = int(item['hostel_id'])
            checkin = item.get('checkin', '')  # Use .get() to avoid KeyError
            checkout = item.get('checkout', '')
            room_type_ = int(item['room_type'])
            room_id = int(item['room_id'])

            room_type = RoomType.objects.get(id=room_type_)

            
            if not checkin or not checkout:
                messages.warning(request, "Check-in and check-out dates are required.")
                return render(request, "hostel/selected_rooms.html", context)
            
            date_format = "%Y-%m-%d"

            # Ensure the checkin and checkout values are valid before parsing
            try:
                checkin_date = datetime.strptime(checkin, date_format)
                checkout_date = datetime.strptime(checkout, date_format)
            except ValueError as e:
                messages.error(request, "Invalid date format.")
                return render(request, "hostel/selected_rooms.html")

            time_difference = checkout_date - checkin_date
            total_days = time_difference.days
            
            room_count += 1
            days = total_days
            price = room_type.price

            room_price = price * room_count
            total = room_price * days
            hostel = Hostel.objects.get(id=id)
        context = {
            "data": request.session['selection_data_obj'],
            "total_selected_items": len(request.session['selection_data_obj']),
            'total':total,
            'checkin':checkin,
            'checkout':checkout,
            'hostel':hostel,
        }
        print(context)
        return render(request, "hostel/selected_rooms.html",context)
    else:
        messages.warning(request, "No Selected room")




def checkout(request, booking_id):
    print(f"Checkout view reached with booking_id: {booking_id}")
    booking = Booking.objects.get(booking_id=booking_id)

    context = {
        "booking": booking
    }
    return render(request, "hostel/checkout.html", context)

# def selected_rooms(request):
#     total =0 
#     room_count = 0
#     total_days = 0
#     checkin = ""
#     checkout = ""
    
#     if 'selection_data_obj' in request.session:
#         for h_id, item in request.session['selection_data_obj'].items():
#             id = int(item['hostel_id'])
#             checkin = item['checkin']
#             checkout = item['checkout']
#             room_type_ = int(item['room_type'])
#             room_id = int(item['room_id'])

#             room_type = RoomType.objects.get(id=room_type_)
            
#             if not checkin or not checkout:
#                 messages.warning(request, "Check-in and check-out dates are required.")
#                 return redirect("/")
            
#             date_format = "%Y-%m-%d"

#             checkin_date = datetime.strptime(checkin, date_format)
#             checkout_date = datetime.strptime(checkout, date_format)
#             time_difference = checkout_date - checkin_date
#             total_days = time_difference.days
            
#             room_count += 1
#             days = total_days
#             price = room_type.price

#             room_price = price * room_count
#             total = room_price * days

#             print("total",total)
#     else:
#         messages.warning(request, "No Selected room")
#         return redirect("/")
#     return render(request, "hostel/selected_rooms.html")