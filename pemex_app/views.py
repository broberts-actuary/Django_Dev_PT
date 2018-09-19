from django.shortcuts import render
from pemex_app.models import ItemEng, FieldInputsEng, Documents
from django_tables2 import RequestConfig
from pemex_app.tables import ItemEngTable, DocumentsTable
from pemex_app.forms import FieldInputViewForm, DocumentForm
from django.db import connection, transaction
from django.http import HttpResponseRedirect


# Create your views here.
def home(request):
    return render(request, 'home.html')


def upload(request):
    return render(request, 'UploadEvidence.html')


def assign(request):
    return render(request, 'AssignToItems.html')


def queue_all(request, prefilter):
    #prefilter is based on which queue is being selected: none, user, team, reviewer
    itemstable = ItemEngTable(ItemEng.objects.all())
    RequestConfig(request).configure(itemstable)
    return render(request, 'queue_all.html',
            {'itemstable': itemstable,
            'prefilter': prefilter})

def file_retrieve(request):
    filetable = DocumentsTable(Documents.objects.all())
    RequestConfig(request).configure(filetable)
    return render(request, 'FileRetrieve.html', {'filetable': filetable})



def update_db_view(table_name, pk_name, pk_val, field_val_dict):
    with connection.cursor() as cursor:
        for field in field_val_dict:
            sqlstring = "UPDATE {} SET {} = {} where {} = {}".format(
                table_name, field, "'" + str(field_val_dict[field]) + "'",
                pk_name, pk_val)
            cursor.execute(sqlstring)
        transaction.commit()


def compliance_update(request, pk):
    #low priority: wondering if we can pass the queue through so that we can send the user back to the queue after update.
    item = ItemEng.objects.get(pk=pk)
    inputs = FieldInputsEng.objects.get(item=pk)
    submitted = False
    if request.method == 'POST':
        updateform = FieldInputViewForm(request.POST)
        if updateform.is_valid():
            cd = updateform.cleaned_data
            cd.update({'input_user': request.user.id})
            #assert False
            update_db_view('field_inputs_eng', 'item', pk, cd)
            return HttpResponseRedirect('?submitted=True')
    else:
        updateform = FieldInputViewForm(instance=inputs)
        if 'submitted' in request.GET:
            submitted = True
    return render(
        request, 'ComplianceStatusUpdate.html', {
            'updateform': updateform,
            'itemid': item.item_id,
            'installation': item.installation,
            'recommendation': item.recommendation,
            'criteria': item.criteria,
            'submitted': submitted,
        })


def model_form_upload(request):
    if request.method == 'POST':
        form = DocumentForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            #return redirect('home')
    else:
        form = DocumentForm()
    return render(request, 'FileUpload.html', {'form': form})


def queue_translator(request):
    items = ItemEng.objects.all
    return render(request, 'queue_translator.html',
            {'items': items})


def evidence_form(request, pk):
    #low priority: wondering if we can pass the queue through so that we can send the user back to the queue after update.
    """item = ItemEng.objects.get(pk=pk)
    inputs = FieldInputsEng.objects.get(item=pk)"""
    submitted = False
    if request.method == 'POST':
        updateEviform = EvidenceForm(request.POST)
        if updateform.is_valid():
            cd = updateform.cleaned_data
            cd.update({'evidence_user':request.user.id})
            #assert False
            #update_db_view('field_inputs_eng', 'item', pk, cd)
            return HttpResponseRedirect('?submitted=True')
    else:
        updateform = FieldInputViewForm(instance=inputs)
        if 'submitted' in request.GET:
            submitted = True
    return render(
        request, 'ComplianceStatusUpdate.html', {
            'updateform': updateEviform,
            'submitted': submitted,
        })
