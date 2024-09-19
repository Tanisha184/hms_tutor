from django.shortcuts import render, redirect
from django.urls import reverse
from hostel.models import Hostel, Booking, ActivityLog, StaffOnDuty, Room, RoomType
from django.http import HttpResponseRedirect
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def check_room_availability(request):
    if request.method == "POST":
        id = request.POST.get("hostel-id")
        checkin = request.POST.get("checkin")
        checkout= request.POST.get("checkout")
        room_type= request.POST.get("room-type")

        hostel = Hostel.objects.get(id=id)
        room_type = RoomType.objects.get(hostel=hostel,slug=room_type)


# Verify room types exist
        
        print(room_type)
        print("id===",id)
        print("id===",checkin)
        print("id===",room_type)
        print("id===",hostel)
        print("id===",room_type)

        url = reverse("hostel:room_type_detail", args=[hostel.slug, room_type.slug])
        url_with_params = f"{url}?hostel-id={id}&checkin={checkin}&checkout={checkout}&room_type={room_type}"
        return HttpResponseRedirect(url_with_params)


# from django.shortcuts import render, redirect
# from django.urls import reverse
# from hostel.models import Hostel, Booking, ActivityLog, StaffOnDuty, Room, RoomType
# from django.http import HttpResponseRedirect
# from django.views.decorators.csrf import csrf_exempt

# @csrf_exempt
# def check_room_availability(request):
#     if request.method == "POST":
#         id = request.POST.get("hostel-id")
#         checkin = request.POST.get("checkin")
#         checkout = request.POST.get("checkout")
#         room_type_slug = request.POST.get("room_type")  # Renamed for clarity

#         # Get the hostel and room type
#         hostel = Hostel.objects.get(id=id)
#         room_type = RoomType.objects.get(hostel=hostel, slug=room_type_slug)

#         # Print statements for debugging
#         print("Hostel:", hostel)
#         print("Check-in:", checkin)
#         print("Check-out:", checkout)
#         print("Room Type:", room_type)

#         # Generate the URL for room_type_detail view
#         url = reverse("hostel:room_type_detail", args=[hostel.slug, room_type_slug])

#         # Append query parameters
#         url_with_params = f"{url}?hostel-id={id}&checkin={checkin}&checkout={checkout}&room_type={room_type_slug}"
#         return HttpResponseRedirect(url_with_params)
