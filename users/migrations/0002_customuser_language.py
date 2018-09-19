# Generated by Django 2.1 on 2018-09-18 15:56

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pemex_app', '0002_languages'),
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='customuser',
            name='language',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.DO_NOTHING, to='pemex_app.Languages'),
            preserve_default=False,
        ),
    ]
