from django.contrib.auth.models import AbstractUser
from django.db import models

# Create your models here.


class CustomUser(AbstractUser):
    #language = models.IntegerField(blank=False, null=False, default=1)

    def __str__(self):
        return self.first_name
