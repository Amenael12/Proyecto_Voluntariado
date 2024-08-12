from django.shortcuts import render, redirect, resolve_url
from django.contrib.auth import login, authenticate
from django.contrib import messages
from django.urls import reverse
from .forms import CustomUserCreationForm, CustomAuthenticationForm

def register_view(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            messages.success(request, 'Registro exitoso. Bienvenido!')
            return redirect('login')
    else:
        form = CustomUserCreationForm()
    return render(request, 'registro.html', {'form': form})

def login_view(request):
    if request.method == 'POST':
        form = CustomAuthenticationForm(request, data=request.POST)
        if form.is_valid():
            email = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(request, username=email, password=password)
            if user is not None:
                login(request, user)
                messages.success(request, 'Has iniciado sesión correctamente.')
                if user.role == 'ADMIN':
                    return redirect(reverse('custom_admin:admin_dashboard'))
                else:
                    return render(request, 'userdashboard.html')
    else:
        form = CustomAuthenticationForm()
    return render(request, 'index.html', {'form': form})