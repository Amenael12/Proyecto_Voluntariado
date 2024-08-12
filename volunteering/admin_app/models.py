from django.db import models
from django.conf import settings
from django.utils.translation import gettext_lazy as _

class Foundation(models.Model):
    name = models.CharField(_('Nombre'), max_length=255)
    creation_date = models.DateField(_('Fecha de creación'))
    description = models.TextField(_('Descripción'))
    focus_area = models.CharField(_('Área de enfoque'), max_length=255)
    address = models.CharField(_('Dirección'), max_length=255)
    latitude = models.FloatField(_('Latitud'), null=True, blank=True)
    longitude = models.FloatField(_('Longitud'), null=True, blank=True)
    admin = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='administered_foundation', verbose_name=_('Administrador'))

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = _('Fundación')
        verbose_name_plural = _('Fundaciones')