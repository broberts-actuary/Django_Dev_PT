import django_tables2 as tables
from django_filters.views import FilterView
from django_tables2.utils import A
from django_tables2.views import SingleTableMixin

from .models import Documents, ItemView, Evidences


class ItemViewTable(tables.Table):
    update_compliance = tables.LinkColumn(
        'compliance_update',
        args=[A('pk')],
        verbose_name='',
        accessor='pk',
        text='update',
        attrs={'class': 'edit_link'})

    expand_evidence = tables.LinkColumn(
        'evidence_expand',
        args=[A('pk')],
        verbose_name='',
        accessor='pk',
        text='evidences',
        attrs={'class': 'edit_link'})
    item_id = tables.Column(verbose_name='Item ID')

    class Meta:
        model = ItemView
        template_name = 'django_tables2/bootstrap.html'
        #exclude english stuff
        exclude = ('rec_eng','crit_eng','applicability')
        #exclude spanish stuff

class DocumentsTable(tables.Table):
    class Meta:
        model = Documents
        template_name = 'django_tables2/bootstrap.html'
        exclude = []


class EvidenceTable(tables.Table):
    add_doc = tables.LinkColumn(
        'evidence_add_doc',
        args=[A('pk')],
        verbose_name='',
        accessor='pk',
        text='add file',
        attrs={'class': 'edit_link'})

    class Meta:
        model = Evidences
        template_name = 'django_tables2/bootstrap.html'
        fields = ('id', 'desc_eng' )
