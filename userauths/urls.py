from django.urls import path
from . import views

app_name = "userauths"

urlpatterns = [
    path('', views.home, name='home'),
    path('sign-up/', views.registration, name='sign-up'),
    path('registration/', views.registration, name='registration'), 
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    
]