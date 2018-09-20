import django_filters
from pemex_app.models import ItemEng


def view_vals(model, field):
    iquery = model.objects.values_list(
        field,
        flat=True,
    ).distinct()
    return [(id, id) for id in iquery]


class ItemFilter(django_filters.FilterSet):
    installation = django_filters.ChoiceFilter(
        choices=view_vals(
            ItemEng,
            'installation',
        ))
    recommendation = django_filters.ChoiceFilter(
        choices=view_vals(
            ItemEng,
            'recommendation',
        ))
    criteria = django_filters.ChoiceFilter(
        choices=view_vals(
            ItemEng,
            'criteria',
        ))

    class Meta:
        model = ItemEng
        exclude = [
            'language',
            'item_id',
            'next_responsible',
            'next_action',
        ]
