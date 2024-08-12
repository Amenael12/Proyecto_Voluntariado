from django import forms
from django.contrib.auth import get_user_model

User = get_user_model()

class UserProfileForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email', 'address', 'phone', 'photo')
    
    photo = forms.ImageField(required=False)