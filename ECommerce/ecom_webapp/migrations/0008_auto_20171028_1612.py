# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-10-28 16:12
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecom_webapp', '0007_auto_20171028_1512'),
    ]

    operations = [
        migrations.AlterField(
            model_name='mobiles',
            name='processor',
            field=models.CharField(max_length=255),
        ),
    ]
