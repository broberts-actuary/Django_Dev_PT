from django.shortcuts import render
from pemex_app.models import ItemEng


# Create your views here.
def upload(request):
    return render(request, 'UploadEvidence.html')


def assign(request):
    return render(request, 'AssignToItems.html')


def inputs(request):
    items = ItemEng.objects.all
    return render(request, 'FieldInputs.html',
            {'items': items})
