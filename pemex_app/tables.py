import django_tables2 as tables
from django_tables2.utils import A
from django_filters.views import FilterView
from django_tables2.views import SingleTableMixin

from .models import ItemEng, Documents


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


class DocumentsTable(tables.Table):
    class Meta:
        model = Documents
        template_name = 'django_tables2/bootstrap.html'
        exclude = []

