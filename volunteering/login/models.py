from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.conf import settings

class CustomUserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('El Email es obligatorio')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('role', 'ADMIN')
        return self.create_user(email, password, **extra_fields)

class CustomUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(_('Email'), unique=True)
    first_name = models.CharField(_('Nombre'), max_length=30)
    last_name = models.CharField(_('Apellido'), max_length=30)
    address = models.CharField(_('Dirección'), max_length=255)
    phone = models.CharField(_('Teléfono'), max_length=15)
    photo = models.ImageField(upload_to='profile_photos/', null=True, blank=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    ROLES = [
        ('ADMIN', 'Administrador'),
        ('VOLUNTEER', 'Voluntario'),
        ('USER', 'Usuario Regular'),
    ]
    role = models.CharField(max_length=20, choices=ROLES, default='USER')

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name', 'last_name', 'address', 'phone']

    def __str__(self):
        return self.email

    def save(self, *args, **kwargs):
        if not self.pk:  
            self.role = 'USER'  
        super().save(*args, **kwargs)
        
    def get_photo_url(self):
        if self.photo and hasattr(self.photo, 'url'):
            return self.photo.url
        else:
            return f"{settings.STATIC_URL}images/perfil-2.jpg"