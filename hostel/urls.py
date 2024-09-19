from django.urls import path
from hostel import views

app_name = "hostel"

urlpatterns = [
    path("", views.index, name="index"),
    path('dashboard/', views.dashboard, name='dashboard'),
    #  path('booking/', views.booking, name='booking'),
    # path('services/', views.services, name='services'),
]