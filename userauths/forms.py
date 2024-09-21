from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from userauths.models import User

class UserRegisterForm(UserCreationForm):
    full_name = forms.CharField(widget=forms.TextInput(attrs={'placeholder': "Enter Full Name"}))
    username = forms.CharField(widget=forms.TextInput(attrs={'placeholder': "Enter User Name"}))
    email = forms.EmailField(widget=forms.EmailInput(attrs={'placeholder': "Enter Email", 'class':"custom-class"}))
    phone = forms.CharField(widget=forms.TextInput(attrs={'placeholder': "Enter Phone Number"}))

    class Meta:
        model = User
        fields = ['full_name', 'username', 'email', 'phone', 'password1', 'password2']

class SignUpForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': "Enter Password"}))
    class Meta:
        model = User
        fields = ['email', 'password']  # Only email and password
        widgets = {
            'password': forms.PasswordInput()
        }
class LoginForm(AuthenticationForm):
    # You can add additional fields or customizations here if needed
    pass

from django import forms
from hostel.models import Booking

class BookingForm(forms.ModelForm):
    class Meta:
        model = Booking
        fields = ['full_name', 'email', 'phone', 'check_in_date', 'check_out_date']
