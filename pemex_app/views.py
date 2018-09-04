from django.shortcuts import render
from pemex_app.models import ItemEng
from django_tables2 import RequestConfig
from pemex_app.tables import ItemEngTable

# Create your views here.
def upload(request):
    return render(request, 'UploadEvidence.html')


def assign(request):
    return render(request, 'AssignToItems.html')


def inputs(request):
    itemstable = ItemEngTable(ItemEng.objects.all())
    RequestConfig(request).configure(itemstable)
    return render(request, 'FieldInputs.html',
            {'itemstable': itemstable})
