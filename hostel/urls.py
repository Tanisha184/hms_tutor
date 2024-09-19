from django.urls import path
from hostel import views

app_name = "hostel"

urlpatterns = [
    path("", views.index, name="index"),
    path('dashboard/', views.dashboard, name='dashboard'),
    path("detail/<slug>/", views.hostel_detail, name="hostel_detail")
]