from django.db import connection, transaction
from django.http import HttpResponseRedirect
from django.shortcuts import render

from django_tables2 import RequestConfig
from pemex_app.filters import ItemFilter
from pemex_app.forms import DocumentForm, FieldInputViewForm, FilemapForm, EvidencesForm, KeepRemoveFile
from pemex_app.models import Documents, Filemap, FieldInputsView, ItemView, Items, Evidences
from pemex_app.tables import DocumentsTable, FilemapTable, ItemViewTable
from users.models import CustomUser


# Create your views here.
def home(request):
    return render(request, 'home.html')


def upload(request):
    return render(request, 'UploadEvidence.html')


def assign(request):
    return render(request, 'AssignToItems.html')


def queue_all(request, prefilter):
    items = ItemView.objects.all()
    data = request.GET
    itemsfilter = ItemFilter(data, queryset=items)
    itemstable = ItemViewTable(itemsfilter.qs)
    RequestConfig(request).configure(itemstable)
    return render(
        request,
        'queue_all.html',
        {
            'itemstable': itemstable,
            'itemsfilter': itemsfilter,
            'prefilter': prefilter,
        },
    )


def file_retrieve(request):
    filetable = DocumentsTable(Documents.objects.all())
    RequestConfig(request).configure(filetable)
    return render(request, 'FileRetrieve.html', {'filetable': filetable})


def update_db_view(table_name, pk_name, pk_val, field_val_dict):
    with connection.cursor() as cursor:
        listSets = ["{} = '{}'".format(field,str(field_val_dict[field])) for field in field_val_dict]
        sets = ', '.join(listSets)
        sqlstring = "UPDATE {} SET {} where {} = {}".format(
            table_name, sets, pk_name, pk_val)
        cursor.execute(sqlstring)
        transaction.commit()


def compliance_update(request, pk):
    #low priority: wondering if we can pass the queue through so that we can send the user back to the queue after update.
    item = ItemView.objects.get(pk=pk)
    inputs = FieldInputsView.objects.get(item=pk)
    submitted = False
    if request.method == 'POST':
        updateform = FieldInputViewForm(request.POST)
        if updateform.is_valid():
            cd = updateform.cleaned_data
            user = CustomUser.objects.get(id=request.user.id)
            cd.update({'input_user': user.id})
            cd.update({'next_responsible': user.next_responsible_id})
            #assert False
            update_db_view('field_inputs_view', 'item', pk, cd)
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
            'rec_id': item.rec_id,
            'recommendation': item.rec_esp,
            'crit_id': item.criteria_prefix,
            'criteria': item.crit_esp,
            'submitted': submitted,
        })


def evidence_expand(request, pk):
    item = ItemView.objects.get(pk=pk)
    maps = Filemap.objects.filter(item_id=pk)
    filemaptable = FilemapTable(maps)
    RequestConfig(request).configure(filemaptable)
    return render(
        request, 'EvidenceExpand.html', {
            'itemid': item.item_id,
            'installation': item.installation,
            'rec_id': item.rec_id,
            'recommendation': item.rec_esp,
            'crit_id': item.criteria_prefix,
            'criteria': item.crit_esp,
            'filemaptable': filemaptable,
        })


def evidence_add_doc(request, pk):
    filemap = Filemap.objects.get(id=pk)
    form = FilemapForm(prefix="mp")
    sub_form = DocumentForm(prefix="fl")
    if request.method == 'POST':
        form = FilemapForm(request.POST, prefix="mp")
        sub_form = DocumentForm(request.POST, request.FILES, prefix="fl")
        if form.is_valid() and sub_form.is_valid:
            formq = form.save(commit=False)
            formq.file = sub_form.save()
            formq.item = filemap.item
            formq.evidence = filemap.evidence
            formq.save()
    return render(request, 'FileUpload.html', {
        'form': form,
        'sub_form': sub_form,
    })


def evidence_add(request, itemid):
    class BlankFilemapForm(FilemapForm):
        class Meta:
            model = Filemap
            fields = []

    form = BlankFilemapForm(prefix="mp")
    sub_form = EvidencesForm(prefix="ev")
    if request.method == 'POST':
        form = BlankFilemapForm(request.POST, prefix="mp")
        sub_form = EvidencesForm(request.POST, prefix="ev")
        if form.is_valid() and sub_form.is_valid:
            formq = form.save(commit=False)
            formq.item = Items.objects.get(id=itemid)
            formq.map_user = request.user
            formq.evidence = sub_form.save()
            formq.save()
    return render(request, 'evidence_add_update.html', {
        'itemid': itemid,
        'form': form,
        'sub_form': sub_form,
    })


def evidence_update(request, pk):
    filemap = Filemap.objects.get(pk=pk)
    itemid = filemap.item.id
    evidence = filemap.evidence
    form = FilemapForm(prefix="mp", instance=filemap)
    sub_form = EvidencesForm(prefix="ev", instance=evidence)
    filechoiceform = KeepRemoveFile()
    if request.method == 'POST':
        form = FilemapForm(request.POST, prefix="mp")
        sub_form = EvidencesForm(request.POST, prefix="ev")
        filechoiceform = KeepRemoveFile(request.POST)
        if form.is_valid() and sub_form.is_valid:
            formq = form.save(commit=False)
            if not filechoiceform['choice']:
                formq.file = None
            formq.item = Items.objects.get(id=itemid)
            formq.map_user = request.user
            formq.evidence = sub_form.save()
            formq.save()
            #assert False
    return render(request, 'evidence_add_update.html', {
        'itemid': itemid,
        'form': form,
        'sub_form': sub_form,
        'filechoiceform': filechoiceform,
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
    items = ItemView.objects.all
    return render(request, 'queue_translator.html', {'items': items})


def evidence_form(request, pk):
    """item = ItemView.objects.get(pk=pk)
    inputs = FieldInputsEng.objects.get(item=pk)"""
    submitted = False
    if request.method == 'POST':
        updateEviform = EvidenceForm(request.POST)
        if updateform.is_valid():
            cd = updateform.cleaned_data
            cd.update({'evidence_user': request.user.id})
            #assert False
            #update_db_view('field_inputs_eng', 'item', pk, cd)
            return HttpResponseRedirect('?submitted=True')
    else:
        updateform = FieldInputViewForm(instance=inputs)
        if 'submitted' in request.GET:
            submitted = True
    return render(request, 'ComplianceStatusUpdate.html', {
        'updateform': updateEviform,
        'submitted': submitted,
    })
