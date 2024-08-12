from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import user_passes_test
from django.contrib import messages
from .forms import UserForm, FoundationForm
from .models import Foundation

User = get_user_model()

def is_admin(user):
    return user.is_authenticated and user.role == 'ADMIN'

@user_passes_test(is_admin)
def admin_dashboard(request):
    return render(request, 'dashboard.html')

@user_passes_test(is_admin)
def user_list(request):
    users = User.objects.all()
    return render(request, 'user_list.html', {'users': users})

@user_passes_test(is_admin)
def user_edit(request, user_id):
    user = get_object_or_404(User, id=user_id)
    if request.method == 'POST':
        form = UserForm(request.POST, instance=user)
        if form.is_valid():
            form.save()
            messages.success(request, 'Usuario actualizado correctamente.')
            return redirect('user_list')
    else:
        form = UserForm(instance=user)
    return render(request, 'user_edit.html', {'form': form, 'user': user})

@user_passes_test(is_admin)
def user_create(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Usuario creado correctamente.')
            return redirect('user_list')
    else:
        form = UserForm()
    return render(request, 'user_form.html', {'form': form})

@user_passes_test(is_admin)
def foundation_list(request):
    foundations = Foundation.objects.all()
    return render(request, 'foundation_list.html', {'foundations': foundations})

@user_passes_test(is_admin)
def foundation_create(request):
    if request.method == 'POST':
        form = FoundationForm(request.POST)
        if form.is_valid():
            foundation = form.save(commit=False)
            admin_email = form.cleaned_data['admin_email']
            admin_user, created = User.objects.get_or_create(
                email=admin_email,
                defaults={'role': 'ADMIN', 'is_staff': True}
            )
            if created:
                admin_user.set_password(User.objects.make_random_password())
                admin_user.save()
            foundation.admin = admin_user
            foundation.save()
            messages.success(request, 'Fundación creada correctamente.')
            return redirect('foundation_list.html')
    else:
        form = FoundationForm()
    return render(request, 'foundation_form.html', {'form': form})

@user_passes_test(is_admin)
def foundation_edit(request, foundation_id):
    foundation = get_object_or_404(Foundation, id=foundation_id)
    if request.method == 'POST':
        form = FoundationForm(request.POST, instance=foundation)
        if form.is_valid():
            form.save()
            messages.success(request, 'Fundación actualizada correctamente.')
            return redirect('admin:foundation_list')
    else:
        form = FoundationForm(instance=foundation)
    return render(request, 'admin/foundation_form.html', {'form': form, 'foundation': foundation})
