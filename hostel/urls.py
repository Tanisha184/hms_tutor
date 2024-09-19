from django.urls import path
from hostel import views

app_name = "hostel"

urlpatterns = [
    path("", views.index, name="index"),
    path('dashboard/', views.dashboard, name='dashboard'),
    path("detail/<slug:slug>/", views.hostel_detail, name="hostel_detail"),
    path("detail/<slug:slug>/room-type/<slug:rt_slug>/", views.room_type_detail,name="room_type_detail"),


    
]