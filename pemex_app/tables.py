import django_tables2 as tables
from .models import ItemEng

class ItemEngTable(tables.Table):
    item_id = tables.Column(verbose_name='ID')
    class Meta:
        model = ItemEng
        template_name = 'django_tables2/bootstrap.html'
        exclude = ('language',)
