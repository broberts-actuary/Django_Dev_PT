import django_tables2 as tables
from django_tables2.utils import A

from .models import ItemEng


class ItemEngTable(tables.Table):
    update_compliance = tables.LinkColumn(
        'compliance_update',
        args=[A('pk')],
        verbose_name='',
        accessor='pk',
        text='update',
        attrs={'class': 'edit_link'})
    item_id = tables.Column(verbose_name='ID')

    class Meta:
        model = ItemEng
        template_name = 'django_tables2/bootstrap.html'
        exclude = ('language', )
