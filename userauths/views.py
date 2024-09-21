from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from userauths.models import User,Profile
from userauths.forms import UserRegisterForm
from django.contrib import messages
from .forms import LoginForm  # Make sure this matches the class defined in forms.py
from django.contrib.auth.decorators import login_required
import logging
from django.contrib.auth import logout
logger = logging.getLogger(__name__)
from .forms import SignUpForm


@login_required
def home(request):
    return render(request, 'userauths/home.html')

def registration(request):
    if request.user.is_authenticated:
        messages.warning(request, "You are already logged in.")
        return redirect("hostel:index")  # Redirect if already logged in

    # Initialize form for both GET and POST requests
    form = UserRegisterForm()

    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
     
        if form.is_valid():
           
            user = form.save()

            
            full_name = form.cleaned_data.get('full_name')
            phone = form.cleaned_data.get('phone')
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password1')

            # Authenticate the user
            user_auth = authenticate(email=email, password=password)
            
            if user_auth is not None:
                # Log the user in
                login(request, user_auth)

                # Success message
                messages.success(request, f"Hey {full_name}, your account has been created successfully.")

                # Update the Profile
                profile = Profile.objects.get(user=user)  # Use 'user' not request.user
                profile.full_name = full_name
                profile.phone = phone
                profile.save()

                return redirect("hostel:index")  # Redirect after registration

        else:
            # Form is not valid, render the form with errors
            messages.error(request, "There was an error with your submission.")

    # Context for rendering the form
    context = {
        "form": form
    }

    return render(request, "userauths/sign-up.html", context)







def logout_view(request):
    
        logout(request)
        messages.success(request, "You have been logged out successfully.")
        return redirect("userauths:login") 

def home(request):
    return render(request, 'home.html')

def login_view(request):
    if request.user.is_authenticated:
        messages.warning(request, "You're already logged in.")
        return redirect("hostel:index")

    if request.method == 'POST':
        email = request.POST.get("email")
        password = request.POST.get("password")
        
        user = User.objects.filter(email=email).first()
        if user:
            user_auth = authenticate(request, email=email, password=password)
            if user_auth:
                login(request, user_auth)
                messages.success(request, "You are logged in.")
                next_url = request.GET.get("next", "hostel:index")
                return redirect(next_url)
            else:
                messages.error(request, "Invalid email or password.")
        else:
            messages.error(request, "User does not exist.")
        
        return redirect("userauths:login")
        
    return render(request, 'userauths/login.html')

# def login_view(request):
#         if request.user.is_authenticated:
#             messages.warning(request,"you're already logged in")
#             return redirect("hostel:index")
#         if request.method == 'POST':
#             email = request.POST.get("email")
#             password = request.POST.get("password")

#             try:
#                 user_query = user_query.objects.get(email=email)
#                 user_auth = authenticate(request, email=email , password=password)

#                 if user_query is not None:
#                     login(request, user_auth)
#                     messages.success(request, "you are logged in")
#                     next_url = request.GET.get("next", "hotel:index")
#                     return redirect(next_url)
#                 else:
#                      messages.error(request, "Username or Password doesn't exists.")
#                      return redirect("userauths:login")   
#             except:

#                 messages.error(request, "User doesn't exists.")
#                 return redirect("userauths:login")
#         return render(request, 'userauths/login.html')





# def sign_up(request):
#         if request.user.is_authenticated:
#             messages.warning(request,"you're already logged in")
#             return redirect("hotel:index")
#         pass

