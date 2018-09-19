from django.contrib.auth.models import AbstractUser
from django.db import models
from pemex_app.models import Languages

# Create your models here.


class CustomUser(AbstractUser):
    next_responsible = models.ForeignKey(
            "CustomUser",
            models.DO_NOTHING,
            blank=False,
            null=False,
            )
    language = models.ForeignKey(
            Languages,
            models.DO_NOTHING,
            blank=False,
            null=False,
            )

    def __str__(self):
        return self.username
