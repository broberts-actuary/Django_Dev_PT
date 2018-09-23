# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create,
#     modify, and delete the table
# Feel free to rename the models,
# but don't rename db_table values or field names.
from django.db import models


#removed foreign key reference to asset table - unnecessary detail
#added foreign key reference to files table - to store image
class Installations(models.Model):
    name = models.TextField(blank=True, null=True)
    activo = models.TextField(blank=True, null=True)
    processing_center = models.TextField(blank=True, null=True)
    platform_count = models.IntegerField(blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)
    longitude = models.FloatField(blank=True, null=True)
    """TODO:
    image = models.ForeignKey(
        Documents,
        models.DO_NOTHING,
        db_column='image',
        blank=True,
        null=True,
    )
    internal_comments_eng = models.TextField(blank=True, null=True)
    internal_comments_esp = models.TextField(blank=True, null=True)
    external_comments_eng = models.TextField(blank=True, null=True)
    external_comments_esp = models.TextField(blank=True, null=True)
    deficiencies_eng = models.TextField(blank=True, null=True)
    deficiencies_esp = models.TextField(blank=True, null=True)
    future_actions_eng = models.TextField(blank=True, null=True)
    future_actions_esp = models.TextField(blank=True, null=True)
    trans_eng = models.BooleanField(blank=True, null=True)
    trans_esp = models.BooleanField(blank=True, null=True)"""


    class Meta:
        managed = True
        db_table = 'installations'
        verbose_name_plural = "Installations"

    def __str__(self):
        return self.nam


class Recommendations(models.Model):
    name = models.TextField(blank=True, null=True)
    part = models.TextField(blank=True, null=True)
    desc_eng = models.TextField(blank=True, null=True)
    desc_esp = models.TextField(blank=True, null=True)
    summary_eng = models.TextField(blank=True, null=True)
    summary_esp = models.TextField(blank=True, null=True)
    primary_reviewer = models.ForeignKey(
        'users.CustomUser',
        models.DO_NOTHING,
        db_column='primary_reviewer',
        blank=True,
        null=True,
    )
    """ TODO:  Kollin Requested
    internal_comments_eng = models.TextField(blank=True, null=True)
    internal_comments_esp = models.TextField(blank=True, null=True)
    external_comments_eng = models.TextField(blank=True, null=True)
    external_comments_esp = models.TextField(blank=True, null=True)
    deficiencies_eng = models.TextField(blank=True, null=True)
    deficiencies_esp = models.TextField(blank=True, null=True)
    future_actions_eng = models.TextField(blank=True, null=True)
    future_actions_esp = models.TextField(blank=True, null=True)
    trans_eng = models.BooleanField(blank=True, null=True)
    trans_esp = models.BooleanField(blank=True, null=True)"""

    class Meta:
        managed = True
        db_table = 'recommendations'
        verbose_name_plural = "Recommendations"

    def __str__(self):
        return self.name


class Criteria(models.Model):
    desc_eng = models.TextField(blank=True, null=True)
    desc_esp = models.TextField(blank=True, null=True)
    trans_eng = models.BooleanField(blank=True, null=True)
    trans_esp = models.BooleanField(blank=True, null=True)
    active = models.BooleanField(blank=True, null=True)
    criteria_user = models.ForeignKey(
        'users.CustomUser',
        models.DO_NOTHING,
        db_column='criteria_user',
        blank=True,
        null=True,
    )
    criteria_date = models.DateTimeField(blank=True, null=True)


    class Meta:
        managed = True
        db_table = 'criteria'
        verbose_name_plural = "Criteria"

    def __str__(self):
        return self.desc_eng



class Items(models.Model):
    installation = models.ForeignKey(
        Installations,
        models.DO_NOTHING,
        db_column='installation',
        blank=True,
        null=True,
    )
    recommendation = models.ForeignKey(
        'Recommendations',
        models.DO_NOTHING,
        db_column='recommendation',
        blank=True,
        null=True,
    )
    criteria = models.ForeignKey(
        Criteria,
        models.DO_NOTHING,
        db_column='criteria',
        blank=True,
        null=True,
    )
    next_responsible = models.ForeignKey(
        'users.CustomUser',
        models.DO_NOTHING,
        db_column='next_responsible',
        blank=True,
        null=True,
    )
    applicable = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'items'
        verbose_name_plural = "Items"

    def __str__(self):
        return self.id


class Status(models.Model):
    desc_eng = models.TextField(blank=True, null=True)
    desc_esp = models.TextField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'status'
        verbose_name_plural = "Status"

    def __str__(self):
        return self.desc_eng




class FieldInputs(models.Model):
    item = models.ForeignKey(
        'Items',
        models.DO_NOTHING,
        db_column='item',
        blank=True,
        null=True,
    )
    item_status = models.ForeignKey(
        'Status',
        models.DO_NOTHING,
        db_column='item_status',
        blank=True,
        null=True,
    )
    input_user = models.ForeignKey(
        'users.CustomUser',
        models.DO_NOTHING,
        db_column='input_user',
        blank=True,
        null=True,
    )
    input_date = models.DateTimeField(blank=True, null=True)
    seq_num = models.IntegerField(blank=True, null=True)
    internal_comments_eng = models.TextField(blank=True, null=True)
    internal_comments_esp = models.TextField(blank=True, null=True)
    external_comments_eng = models.TextField(blank=True, null=True)
    external_comments_esp = models.TextField(blank=True, null=True)
    deficiencies_eng = models.TextField(blank=True, null=True)
    deficiencies_esp = models.TextField(blank=True, null=True)
    future_actions_eng = models.TextField(blank=True, null=True)
    future_actions_esp = models.TextField(blank=True, null=True)
    trans_eng = models.BooleanField(blank=True, null=True)
    trans_esp = models.BooleanField(blank=True, null=True)


    class Meta:
        managed = True
        db_table = 'field_inputs'
        verbose_name_plural = "Field Inputs"

    def __str__(self):
        return self.item

#TODO: change to ItemView
class ItemEng(models.Model):
    item_id = models.IntegerField(blank=True, primary_key=True, null=False)
    installation = models.TextField(blank=True, null=True)
    recommendation = models.TextField(blank=True, null=True)
    criteria = models.TextField(blank=True, null=True)
    next_responsible = models.CharField(max_length=80, blank=True, null=True)
    next_action = models.TextField(blank=True, null=True)
    applicability = models.BooleanField(blank=True, null=True)
    language = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = 'item_eng'
        verbose_name_plural = "Items English View"

    def __str__(self):
        return self.item_id

# TODO: change to FIeldInputsView
class FieldInputsEng(models.Model):
    id = models.IntegerField(blank=True, primary_key=True, null=False)
    item = models.IntegerField(blank=True, null=True)
    item_status = models.TextField(blank=True, null=True)
    input_user = models.TextField(blank=True, null=True)
    input_date = models.DateTimeField(blank=True, null=True)
    input_comment_eng = models.TextField(blank=True, null=True)
    input_comment_esp = models.TextField(blank=True, null=True)
    language = models.IntegerField(blank=True, null=True)
    seq_num = models.IntegerField(blank=True, null=True)
    next_responsible = models.TextField(blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = 'field_inputs_eng'
        verbose_name_plural = 'Field Inputs View Eng'

    def __str__(self):
        return self.item


class Languages(models.Model):
    desc = models.TextField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'languages'
        verbose_name_plural = 'languages'

    def __str__(self):
        return self.desc



class Evidences(models.Model):
    priority = models.IntegerField(blank=True, null=True)
    desc_eng = models.TextField(blank=True, null=True)
    desc_esp = models.TextField(blank=True, null=True)
    evidence_user = models.ForeignKey(
        "users.CustomUser",
        models.DO_NOTHING,
        db_column='evidence_user',
        blank=True,
        null=True,
    )
    evidence_date = models.DateTimeField(blank=True, null=True)
    trans_eng = models.BooleanField(blank=True, null=True)
    trans_esp = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'evidences'
        verbose_name_plural = "Evidences"

    def __str__(self):
        return self.desc_eng or 'error: not found'

class FileStorage(models.Model):
    """Utility model. Do not modify"""
    bytes = models.TextField()
    filename = models.CharField(max_length=255)
    mimetype = models.CharField(max_length=50)

    class Meta:
        managed = True
        db_table = 'file_storage'




class Documents(models.Model):
    name = models.CharField(max_length=100)
    document = models.FileField(
        upload_to='pemex_app.FileStorage/bytes/filename/mimetype',
        blank=True,
        null=True,
    )

    class Meta:
        managed = True
        db_table = 'documents'

    class Meta:
        managed = True
        db_table = 'documents'


class Filemap(models.Model):
    item = models.ForeignKey(
        Items,
        models.DO_NOTHING,
        db_column='item',
        blank=True,
        null=True,
    )
    file = models.ForeignKey(
        Documents,
        models.DO_NOTHING,
        db_column='file',
        blank=True,
        null=True,
    )
    evidence = models.ForeignKey(
        Evidences,
        models.DO_NOTHING,
        db_column='evidence',
        blank=True,
        null=True,
    )
    map_user = models.ForeignKey(
        'users.CustomUser',
        models.DO_NOTHING,
        db_column='criteria_user',
        blank=True,
        null=True,
    )
    map_date = models.DateTimeField(blank=True, null=True)
    doc_comment_eng = models.TextField(blank=True, null=True)
    doc_comment_esp = models.TextField(blank=True, null=True)
    trans_eng = models.BooleanField(blank=True, null=True)
    trans_esp = models.BooleanField(blank=True, null=True)
    archived = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'filemap'
