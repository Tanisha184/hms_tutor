from django.shortcuts import render
from userauths.forms import SignUpForm

def index(request):
    form = SignUpForm()  # Create an instance of the SignUpForm
    return render(request, "hostel/hostel.html", {"form": form})

def dashboard(request):
    return render(request, 'hostel/dashboard.html')
