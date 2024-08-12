from django import forms
from django.contrib.auth import get_user_model
from .models import Foundation

User = get_user_model()

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['email', 'first_name', 'last_name', 'address', 'phone', 'role', 'is_active']

class FoundationForm(forms.ModelForm):
    admin_email = forms.EmailField(label='Email del administrador')

    class Meta:
        model = Foundation
        fields = ['name', 'creation_date', 'description', 'focus_area', 'address', 'latitude', 'longitude']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance.pk:
            self.fields['admin_email'].initial = self.instance.admin.email