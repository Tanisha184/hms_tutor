from django.shortcuts import render, redirect
from django.urls import reverse
from hostel.models import Hostel, Booking, ActivityLog, StaffOnDuty, Room, RoomType
from django.http import HttpResponseRedirect, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
from django.template.loader import render_to_string


# @csrf_exempt
# def check_room_availability(request):
#     if request.method == "POST":
#         id = request.POST.get("hostel-id")
#         checkin = request.POST.get("check_in_date")  # Ensure this matches the form field name
#         checkout = request.POST.get("check_out_date")  # Ensure this matches the form field name
#         room_type_slug = request.POST.get("room-type")  # Ensure this matches the form field name

#         # Fetch hostel and room type
#         try:
#             hostel = Hostel.objects.get(id=id)
#             room_type = RoomType.objects.get(hostel=hostel, slug=room_type_slug)
#         except Hostel.DoesNotExist:
#             return HttpResponseRedirect(reverse("hostel:error_page"))  # Adjust to your error handling
#         except RoomType.DoesNotExist:
#             return HttpResponseRedirect(reverse("hostel:error_page"))  # Adjust to your error handling

#         # Build URL for redirect
#         url = reverse("hostel:room_type_detail", args=[hostel.slug, room_type.slug])
#         url_with_params = f"{url}?hostel-id={id}&checkin={checkin}&checkout={checkout}&room_type={room_type_slug}"
        
#         return HttpResponseRedirect(url_with_params)


@csrf_exempt
def check_room_availability(request):

    try:
        print("check_room_availability view reached")
        if request.method == "POST":
            ...
    except Exception as e:
        print(f"Error occurred: {e}")

    if request.method == "POST":
        id = request.POST.get("hostel-id")
        checkin = request.POST.get("checkin")
        checkout= request.POST.get("checkout")
        room_type= request.POST.get("room-type")

        hostel = Hostel.objects.get(id=id)
        room_type = RoomType.objects.get(hostel=hostel,slug=room_type)

        
        print(room_type)
        print("id===",id)
        print("id===",checkin)
        print("id===",room_type)
        print("id===",hostel)
        print("id===",room_type)
        print(f"Room type: {room_type}")
        print(f"Check-in: {checkin}, Check-out: {checkout}")
        url = reverse("hostel:room_type_detail", args=[hostel.slug, room_type.slug])
        url_with_params = f"{url}?hostel-id={id}&checkin={checkin}&checkout={checkout}&room_type={room_type.slug}"
        return HttpResponseRedirect(url_with_params)

#session is a storage for the browser that is used to keep files temp.if a user logs out u can save the session in db
def add_to_selection(request):
    room_selection = {}


    room_selection[str(request.GET['id'])] = {
        'hostel_id' : request.GET['hostel_id'],
        'hostel_name' : request.GET['hostel_name'],
        'room_name' : request.GET['room_name'],
        'room_price' : request.GET['room_price'],
        'room_number' : request.GET['room_number'],
        'room_type' : request.GET['room_type'],
        'room_id' : request.GET['room_id'],
        'checkout' : request.GET['checkout'],
        'checkin' : request.GET['checkin'],
       
    }

    if 'selection_data_obj' in request.session:
        # selection_data = request.session['selection_data_obj']
        if str(request.GET['id']) in request.session['selection_data_obj']:
            selection_data = request.session['selection_data_obj']
            request.session['selection_data_obj'] = selection_data

        else:
            selection_data = request.session['selection_data_obj']
            selection_data.update(room_selection)
            request.session['selection_data_obj'] = selection_data

    else:
        request.session['selection_data_obj'] = room_selection

    data = {
        "data": request.session['selection_data_obj'], 
        "total_selected_items": len(request.session['selection_data_obj'])
    }

    return JsonResponse(data)
    
def delete_selection(request):
    hostel_id = str(request.GET['id'])
    if 'selection_data_obj' in request.session:
        if hostel_id in request.session['selection_data_obj']:
            selection_data = request.session['selection_data_obj']
            del request.session['selection_data_obj'][hostel_id]
            request.session['selection_data_obj']= selection_data
    total = 0 
    room_count = 0
    total_days = 0
    checkin = ""
    checkout = ""
    hostel = None

    if 'selection_data_obj' in request.session:
        for h_id, item in request.session['selection_data_obj'].items():
            id = int(item['hostel_id'])
            checkin = item.get('checkin', '')  # Use .get() to avoid KeyError
            checkout = item.get('checkout', '')
            room_type_ = int(item['room_type'])
            room_id = int(item['room_id'])

            
            room_type = RoomType.objects.get(id=room_type_)

            date_format = "%Y-%m-%d"
            checkin_date = datetime.strptime(checkin, date_format)
            checkout_date = datetime.strptime(checkout, date_format)
            time_difference = checkout_date - checkin_date
            total_days = time_difference.days
            room_count += 1
            days = total_days
            price = room_type.price

            room_price = price * room_count
            total = room_price * days

    context = render_to_string(
        "hostel/async/selected_room.html",
        {
            "data": request.session['selection_data_obj'],
            "total_selected_item": len(request.session['selection_data_obj']),
            "total":total,
            "total_days": total_days,
            "checkin":checkin,
            "checkout": checkout,
            "hostel": hostel,
        })
    print("context=====", context)
    return JsonResponse({"data": context,"total_selected_item": len(request.session['selection_data_obj'])})
