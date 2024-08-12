from django.urls import path
from . import views

app_name = 'custom_admin'

urlpatterns = [
    path('dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('users/', views.user_list, name='user_list'),
    path('users/<int:user_id>/edit/', views.user_edit, name='user_edit'),
    path('foundations/', views.foundation_list, name='foundation_list'),
    path('foundations/create/', views.foundation_create, name='foundation_create'),
    path('foundations/<int:foundation_id>/edit/', views.foundation_edit, name='foundation_edit'),
]

urlpatterns = urlpatterns