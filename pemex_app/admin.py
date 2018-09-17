from django.contrib import admin
from pemex_app.models import Assets, Installations, Recommendations

# Register your models here.
admin.site.register(Installations)
admin.site.register(Assets)
admin.site.register(Recommendations)
