# Generated by Django 2.1 on 2018-09-21 19:28

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pemex_app', '0005_auto_20180921_1922'),
    ]

    operations = [
        migrations.AlterField(
            model_name='items',
            name='next_responsible',
            field=models.ForeignKey(blank=True, db_column='next_responsible', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL),
        ),
    ]
