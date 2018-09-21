# Generated by Django 2.1 on 2018-09-21 01:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pemex_app', '0006_filemap'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='evidences',
            name='criteria',
        ),
        migrations.RemoveField(
            model_name='evidences',
            name='installation',
        ),
        migrations.RemoveField(
            model_name='evidences',
            name='recommendation',
        ),
        migrations.AddField(
            model_name='evidences',
            name='item_id',
            field=models.ForeignKey(blank=True, db_column='item_id', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='pemex_app.Items'),
        ),
    ]
