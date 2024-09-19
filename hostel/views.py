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

