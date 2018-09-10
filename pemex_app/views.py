from django.shortcuts import render
from pemex_app.models import ItemEng
from django_tables2 import RequestConfig
from pemex_app.tables import ItemEngTable
from pemex_app.forms import FieldInputViewForm

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

def update_db_view(table_name, pk_name, pk_val, field_val_dict):                                                                                                                              
    with connection.cursor() as cursor:                                                                                                                                                       
        for field in field_val_dict.keys:                                                                                                                                                     
            sqlstring = 'UPDATE {} SET {} = {} where {} = {}'.format(                                                                                                                         
                table_name, field, field_val_dict[field], pk_name, pk_val)                                                                                                                    
            cursor.execute(sqlstring)                                                                                                                                                         
        transaction.commit()                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                                                   
def compliance_update(request, pk):                                                                                                                                                           
    item = ItemEng.objects.get(pk=pk)                                                                                                                                                         
    submitted = False                                                                                                                                                                         
    if request.method == 'POST':                                                                                                                                                              
        updateform = FieldInputViewForm(request.POST)                                                                                                                                         
        if updateform.is_valid():                                                                                                                                                             
            cd = updateform.cleaned_data                                                                                                                                                      
            assert False                                                                                                                                                                      
            #update_db_view('item_eng', )                                                                                                                                                     
            return HttpResponseRedirect('?submitted=True')                                                                                                                                    
    else:                                                                                                                                                                                     
        updateform = FieldInputViewForm(instance=item)                                                                                                                                        
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
