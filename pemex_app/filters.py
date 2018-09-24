import django_filters
from pemex_app.models import ItemView


def view_vals(model, field):
    iquery = model.objects.values_list(
        field,
        flat=True,
    ).distinct().order_by(field)
    return [(id, id) for id in iquery]


class ItemFilter(django_filters.FilterSet):
    installation = django_filters.ChoiceFilter(
        choices=view_vals(
            ItemView,
            'installation'
        ))
    rec_id = django_filters.ChoiceFilter(
        choices=view_vals(
            ItemView,
            'rec_id'
        ))
    criteria_prefix = django_filters.ChoiceFilter(
        choices=view_vals(
            ItemView,
            'criteria_prefix'
        ))
    next_responsible = django_filters.ChoiceFilter(
        choices=view_vals(
            ItemView,
            'next_responsible'
        ))


    class Meta:
        model = ItemView
        exclude = [
            'item_id',
            'rec_eng',
            'rec_esp',
            'crit_eng',
            'crit_esp',
            'count_evidence',
            'pct_complete',
            'applicability',
        ]
