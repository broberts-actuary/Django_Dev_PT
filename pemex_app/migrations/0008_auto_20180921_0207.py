# Generated by Django 2.1 on 2018-09-21 02:07

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pemex_app', '0007_auto_20180921_0103'),
    ]

    operations = [
        migrations.AlterField(
            model_name='evidences',
            name='evidence_user',
            field=models.ForeignKey(blank=True, db_column='evidence_user', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL),
        ),
    ]
