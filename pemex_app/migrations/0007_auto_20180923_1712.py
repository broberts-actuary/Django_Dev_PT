# Generated by Django 2.1 on 2018-09-23 17:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pemex_app', '0006_auto_20180921_1928'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='evidences',
            name='item_id',
        ),
        migrations.AddField(
            model_name='filemap',
            name='archived',
            field=models.BooleanField(blank=True, null=True),
        ),
    ]
