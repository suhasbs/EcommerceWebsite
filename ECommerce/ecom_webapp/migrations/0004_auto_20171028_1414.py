# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-10-28 14:14
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecom_webapp', '0003_auto_20171028_1413'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='unit_weight',
            field=models.CharField(blank=True, max_length=10, null=True),
        ),
    ]
