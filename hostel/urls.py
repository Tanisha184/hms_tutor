from django.urls import path
from hostel import views
from . import views

app_name = "hostel"

urlpatterns = [
    path("", views.index, name="index"),
    path('dashboard/', views.dashboard, name='dashboard'),
    path("detail/<slug:slug>/", views.hostel_detail, name="hostel_detail"),
    path("detail/<slug:slug>/room-type/<slug:rt_slug>/", views.room_type_detail, name="room_type_detail"),
    path("selected_rooms/", views.selected_rooms, name="selected_rooms"),
    path("checkout/<booking_id>/", views.checkout, name='checkout'),
    path('complete-booking/<int:booking_id>/', views.complete_booking, name='complete_booking'), 
    path('booking-confirmation/<int:booking_id>/', views.booking_confirmation, name='booking_confirmation'), # corrected this line
]
