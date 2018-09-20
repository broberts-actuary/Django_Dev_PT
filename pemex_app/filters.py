import django_filters
from pemex_app.models import ItemEng

class ItemFilter(django_filters.FilterSet):
    class Meta:
        model = ItemEng
        exclude = ['language',]
