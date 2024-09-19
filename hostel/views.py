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




# def booking(request):
#     # Implement your booking logic here
#     # For now, we'll render a simple booking page
#     return render(request, 'hostel/booking.html')

# def services(request):
#     # Implement your services logic here
#     # For now, we'll render a simple services page
#     return render(request, 'hostel/services.html')