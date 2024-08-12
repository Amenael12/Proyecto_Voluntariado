from django.urls import path
from . import views

app_name = 'user'

urlpatterns = [
    path('profile/', views.profile, name='profile'),
    path('profile/edit/', views.update_profile, name='edit_profile'),
]

urlpatterns = urlpatterns