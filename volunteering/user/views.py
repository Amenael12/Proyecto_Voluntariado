from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .forms import UserProfileForm
from admin_app.models import Foundation
import json

@login_required
def update_profile(request):
    if request.method == 'POST':
        form = UserProfileForm(request.POST, request.FILES, instance=request.user)
        if form.is_valid():
            form.save()
            messages.success(request, 'Tu perfil ha sido actualizado.')
            return redirect('profile')
    else:
        form = UserProfileForm(instance=request.user)
    return render(request, 'profiles/profile_form.html', {'form': form})

@login_required
def profile(request):
    return render(request, 'profiles/profile.html', {'user': request.user})

def mapa_view(request):
    foundations = Foundation.objects.all()
    foundation_data = []
    for foundation in foundations:
        if foundation.latitude and foundation.longitude:
            foundation_data.append({
                'name': foundation.name,
                'latitude': foundation.latitude,
                'longitude': foundation.longitude,
                'description': foundation.description
            })
    
  
    foundation_json = json.dumps(foundation_data)
    
    return render(request, 'mapa.html', {'foundation_data': foundation_json})