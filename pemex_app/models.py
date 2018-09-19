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


class Assets(models.Model):
    nam = models.TextField(blank=True, null=True)
    code = models.TextField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'assets'
        verbose_name_plural = "Assets"

    def __str__(self):
        return self.nam


class Installations(models.Model):
    nam = models.TextField(blank=True, null=True)
    asset = models.ForeignKey(
        Assets,
        models.DO_NOTHING,
        db_column='asset',
        blank=True,
        null=True,
    )
    processing_center = models.TextField(blank=True, null=True)
    platform_count = models.IntegerField(blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)
    longitude = models.FloatField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'installations'
        verbose_name_plural = "Installations"

    def __str__(self):
        return self.nam


class Recommendations(models.Model):
    nam = models.TextField(blank=True, null=True)
    prefix = models.TextField(blank=True, null=True)
    major = models.TextField(blank=True, null=True)
    minor = models.TextField(blank=True, null=True)
    part = models.TextField(blank=True, null=True)
    desc_eng = models.TextField(blank=True, null=True)
    desc_esp = models.TextField(blank=True, null=True)
    summary_eng = models.TextField(blank=True, null=True)
    summary_esp = models.TextField(blank=True, null=True)
    pep_responsible = models.TextField(blank=True, null=True)
    absg_responsible = models.TextField(blank=True, null=True)
    installation = models.TextField(blank=True, null=True)
    feild_verification = models.TextField(blank=True, null=True)
    interview = models.TextField(blank=True, null=True)
    sweetiening_plant = models.TextField(blank=True, null=True)
    drill = models.TextField(blank=True, null=True)
    crae = models.TextField(blank=True, null=True)
    cases = models.TextField(blank=True, null=True)
    abk_a2 = models.TextField(blank=True, null=True)
    trans_eng = models.BooleanField(blank=True, null=True)
    trans_esp = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'recommendations'
        verbose_name_plural = "Recommendations"

    def __str__(self):
        return self.nam


class Criteria(models.Model):
    desc_eng = models.TextField(blank=True, null=True)
    desc_esp = models.TextField(blank=True, null=True)
    trans_eng = models.BooleanField(blank=True, null=True)
    trans_esp = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'criteria'
        verbose_name_plural = "Criteria"

    def __str__(self):
        return self.desc_eng


class Applicability(models.Model):
    desc_eng = models.TextField(blank=True, null=True)
    desc_esp = models.TextField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'applicability'
        verbose_name_plural = "Applicabilities"

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
    next_responsible = models.IntegerField(blank=True, null=True)
    next_action = models.IntegerField(blank=True, null=True)
    applicability = models.ForeignKey(
        Applicability,
        models.DO_NOTHING,
        db_column='applicability',
        blank=True,
        null=True,
    )
    applicable = models.BooleanField(blank=True, null=True)
    next_action_temp = models.TextField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'items'
        verbose_name_plural = "Items"

    def __str__(self):
        return self.id


class Status(models.Model):
    desc_eng = models.TextField(blank=True, null=True)
    desc_esp = models.TextField(blank=True, null=True)
    type_user = models.BooleanField(blank=True, null=True)
    type_rev = models.BooleanField(blank=True, null=True)
    next_action = models.TextField(blank=True, null=True)
    trans_eng = models.BooleanField(blank=True, null=True)
    trans_esp = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'status'
        verbose_name_plural = "Status"

    def __str__(self):
        return self.desc_eng


class Evidence(models.Model):
    priority = models.IntegerField(blank=True, null=True)
    desc_eng = models.TextField(blank=True, null=True)
    desc_esp = models.TextField(blank=True, null=True)
    trans_eng = models.BooleanField(blank=True, null=True)
    trans_esp = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'evidence'
        verbose_name_plural = "Evidence"

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
    applicability = models.ForeignKey(
        Applicability,
        models.DO_NOTHING,
        db_column='applicability',
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
    input_user = models.IntegerField(blank=True, null=True)
    input_date = models.DateTimeField(blank=True, null=True)
    input_comment_eng = models.TextField(blank=True, null=True)
    seq_num = models.IntegerField(blank=True, null=True)
    trans_eng = models.BooleanField(blank=True, null=True)
    trans_esp = models.BooleanField(blank=True, null=True)
    input_comment_esp = models.TextField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'field_inputs'
        verbose_name_plural = "Field Inputs"

    def __str__(self):
        return self.item


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


class ItemEsp(models.Model):
    item_id = models.IntegerField(blank=True, null=True)
    installation = models.TextField(blank=True, null=True)
    recommendation = models.TextField(blank=True, null=True)
    criteria = models.TextField(blank=True, null=True)
    language = models.IntegerField(blank=True, null=True)
    next_responsible = models.IntegerField(blank=True, null=True)
    next_action = models.IntegerField(blank=True, null=True)
    applicability = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False  # Created from a view. Don't remove.
        db_table = 'item_esp'
        verbose_name_plural = "Items Spanish View"

    def __str__(self):
        return self.item_id


class Priority(models.Model):
    desc_eng = models.TextField(blank=True, null=True)
    desc_esp = models.TextField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'priority'
        verbose_name_plural = "Priority"

    def __str__(self):
        return self.desc_eng


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
