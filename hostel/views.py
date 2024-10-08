from django.shortcuts import render
from userauths.forms import SignUpForm
from hostel.models import Hostel, Booking, ActivityLog, StaffOnDuty, Room, RoomType


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
    hostel = Hostel.objects.get(status="Live", slug=slug)
    room_type = RoomType.objects.get(hostel=hostel,slug=rt_slug)
    rooms = Room.objects.filter(room_type=room_type, is_available=True)

    context = {
        "hostel":hostel,
        "room_type":room_type,
        "rooms": rooms,
    }
    return render(request, "hostel/room_type_detail.html", context)