from django import forms
from pemex_app.models import *
from db_file_storage.form_widgets import DBClearableFileInput


def view_vals(model, field):
    iquery = model.objects.values_list(
        field,
        flat=True,
    ).distinct().order_by(field)
    return [(id, id) for id in iquery]


class FieldInputViewForm(forms.ModelForm):
    status_eng = forms.ChoiceField(choices=view_vals(Status, 'desc_eng'))
    status_esp = forms.ChoiceField(choices=view_vals(Status, 'desc_esp'))

    class Meta:
        model = FieldInputsView
        exclude = [
            'item', 'id', 'input_user', 'input_date', 'seq_num',
            'next_responsible'
        ]
        widgets = {
            'item': forms.TextInput,
            'status_eng': forms.Select,
            'status_esp': forms.Select,
            'input_comment_eng': forms.Textarea,
            'input_comment_est': forms.Textarea
        }


class DocumentForm(forms.ModelForm):
    class Meta:
        model = Documents
        exclude = []
        widgets = {'document': DBClearableFileInput}


class FilemapForm(forms.ModelForm):
    class Meta:
        model = Filemap
        exclude = [
            'id',
            'map_date',
            'map_user',
            'archived',
            'item',
            'evidence',
        ]


class EvidencesForm(forms.ModelForm):
    class Meta:
        model = Evidences
        exclude = [
            'id',
            'evidence_date',
            'evidence_user',
        ]
