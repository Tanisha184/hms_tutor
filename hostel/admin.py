from django.contrib import admin

from hostel.models import Hostel, Booking, ActivityLog, StaffOnDuty, Room, RoomType


class HostelAdmin(admin.ModelAdmin):
    list_display = ['thumbnail','name','user','status']
    prepopulated_fields =  {"slug": ("name",)}

admin.site.register(Hostel, HostelAdmin)
admin.site.register(Booking)
admin.site.register(ActivityLog)
admin.site.register(StaffOnDuty)
admin.site.register(Room)
admin.site.register(RoomType)


# def selected_rooms(request):
#     total = 0 
#     room_count = 0
#     total_days = 0
#     selected_rooms = {}

#     if request.method == "POST":
#         full_name = request.POST.get("full_name")
#         email = request.POST.get("email")
#         phone = request.POST.get("phone")

#         if 'selection_data_obj' in request.session:
#             for h_id, item in request.session['selection_data_obj'].items():
#                 checkin = item.get('checkin')
#                 checkout = item.get('checkout')

#                 if checkin and checkout:
#                     try:
#                         id = int(item['hostel_id'])
#                         room_type_ = int(item['room_type'])
#                         room_id = int(item['room_id'])

#                         room_type = RoomType.objects.get(id=room_type_)
#                         hostel = Hostel.objects.get(id=id)

#                         # Calculate total days
#                         checkin_date = datetime.strptime(checkin, "%Y-%m-%d")
#                         checkout_date = datetime.strptime(checkout, "%Y-%m-%d")
#                         total_days = (checkout_date - checkin_date).days

#                         if total_days > 0:
#                             price = room_type.price
#                             total += price * total_days
#                             room_count += 1

#                             # Create the booking
#                             booking = Booking.objects.create(
#                                 hostel=hostel,
#                                 room_type=room_type,
#                                 check_in_date=checkin_date,
#                                 check_out_date=checkout_date,
#                                 total_days=total_days,
#                                 full_name=full_name,
#                                 email=email,
#                                 phone=phone,
#                                 user=request.user or None
#                             )

#                             # Associate rooms with booking
#                             room = Room.objects.get(id=room_id)
#                             booking.room.add(room)
#                             booking.total += float(total)
#                             booking.before_discount += float(total)
#                             booking.save()

#                             # Redirect to checkout page
#                             return redirect("hostel:checkout", booking_id=booking.id)

#                     except ValueError as ve:
#                         messages.error(request, f"Invalid data for room ID {item['room_id']}: {ve}")
#                 else:
#                     messages.warning(request, f"Missing check-in or check-out date for room ID: {item['room_id']}")
#         else:
#             messages.warning(request, "No Selected room")
#             return redirect("/")

#     else:
#         if 'selection_data_obj' in request.session:
#             selected_rooms = request.session['selection_data_obj']

#             for h_id, item in selected_rooms.items():
#                 checkin = item.get('checkin')
#                 checkout = item.get('checkout')
#                 # (Continue with the existing logic to calculate total, room_count, etc.)

#     return render(request, "hostel/selected_rooms.html", {
#         'selected_rooms': selected_rooms,
#         'total_price': total,
#         'total_days': total_days,
#         'room_count': room_count,
#     })
def selected_rooms(request):
    total = 0 
    room_count = 0
    total_days = 0
    selected_rooms = {}

    print("Selected Rooms view called")

    if 'selection_data_obj' in request.session:
        print("Session data:", request.session['selection_data_obj'])
        selected_rooms = request.session['selection_data_obj']

        for h_id, item in selected_rooms.items():
            checkin = item.get('checkin')
            checkout = item.get('checkout')

            print(f"Processing room ID: {item['room_id']} with checkin: {checkin}, checkout: {checkout}")

            # Check if checkin and checkout are valid
            if checkin and checkout:  # Ensure both dates are not None
                try:
                    id = int(item['hostel_id'])
                    room_type_ = int(item['room_type'])
                    room_id = int(item['room_id'])

                    room_type = RoomType.objects.get(id=room_type_)

                    # Calculate total days using datetime
                    checkin_date = datetime.strptime(checkin, "%Y-%m-%d")
                    checkout_date = datetime.strptime(checkout, "%Y-%m-%d")
                    time_difference = (checkout_date - checkin_date).days
                    
                    # Ensure time_difference is valid
                    if time_difference > 0:
                        total_days += time_difference  # Accumulate total days
                        room_count += 1
                        price = room_type.price
                        total += price * time_difference

                        print("Checkin:", checkin)
                        print("Checkout:", checkout)
                    else:
                        messages.warning(request, f"Checkout date must be after check-in date for room ID: {item['room_id']}")
                except ValueError as ve:
                    messages.error(request, f"Invalid data for room ID {item['room_id']}: {ve}")
            else:
                messages.warning(request, f"Missing check-in or check-out date for room ID: {item['room_id']}")
    
    else:
        messages.warning(request, "No Selected room")
        return redirect("/")

    return render(request, "hostel/selected_rooms.html", {
        'selected_rooms': selected_rooms,
        'total_price': total,
        'total_days': total_days,
        'room_count': room_count,
    })