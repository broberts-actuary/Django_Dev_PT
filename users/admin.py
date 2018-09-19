from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin

from .forms import CustomUserChangeForm, CustomUserCreationForm
from .models import CustomUser


# Register your models here.
class CustomUserAdmin(UserAdmin):
    model = CustomUser
    list_display = [
        'username', 'first_name', 'last_name', 'next_responsible', 'language'
    ]
    fieldsets = UserAdmin.fieldsets + (('Additional information', {
        'fields': ('language', 'next_responsible')
    }), )


admin.site.register(CustomUser, CustomUserAdmin)
