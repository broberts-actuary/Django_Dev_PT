from django import forms
from pemex_app.models import *


class FieldInputViewForm(forms.ModelForm):
    iquery = Status.objects.values_list(
        'desc_eng',
        flat=True,
    )
    iquery_choices = [(id, id) for id in iquery]
    item_status = forms.ChoiceField(choices=iquery_choices)

    class Meta:
        model = FieldInputsEng
        exclude = [
            'item', 'id', 'input_user', 'input_date', 'language', 'seq_num',
            'next_responsible'
        ]
        widgets = {
            'item': forms.TextInput,
            'item_status': forms.Select,
            'input_comment_eng': forms.Textarea,
            'input_comment_est': forms.Textarea
        }
