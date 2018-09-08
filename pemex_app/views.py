from django.shortcuts import render
from pemex_app.models import ItemEng
from django_tables2 import RequestConfig
from pemex_app.tables import ItemEngTable

# Create your views here.
def home(request):
    return render(request, 'home.html')

def upload(request):
    return render(request, 'UploadEvidence.html')

def assign(request):
    return render(request, 'AssignToItems.html')

def inputs(request):
    itemstable = ItemEngTable(ItemEng.objects.all())
    RequestConfig(request).configure(itemstable)
    return render(request, 'FieldInputs.html',
            {'itemstable': itemstable})

def compliance_update(request, pk):
    return render(request, 'ComplianceStatusUpdate.html',
            {'itemid': pk})

def queue_all(request):
    items = ItemEng.objects.all
    return render(request, 'queue_all.html',
            {'items': items})

def queue_user(request):
    items = ItemEng.objects.all
    return render(request, 'queue_user.html',
            {'items': items})

def queue_team(request):
    items = ItemEng.objects.all
    return render(request, 'queue_team.html',
            {'items': items})

def queue_reviewer(request):
    items = ItemEng.objects.all
    return render(request, 'queue_reviewer.html',
            {'items': items})

def queue_translator(request):
    items = ItemEng.objects.all
    return render(request, 'queue_translator.html',
            {'items': items})
