# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-10-30 19:36
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecom_webapp', '0011_auto_20171030_1921'),
    ]

    operations = [
        migrations.AlterField(
            model_name='books',
            name='summary',
            field=models.TextField(blank=True, null=True),
        ),
    ]
