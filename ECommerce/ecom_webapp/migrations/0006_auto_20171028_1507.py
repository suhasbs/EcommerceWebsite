# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-10-28 15:07
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecom_webapp', '0005_auto_20171028_1504'),
    ]

    operations = [
        
        migrations.AlterField(
            model_name='mobiles',
            name='secondary_camera',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
    ]
