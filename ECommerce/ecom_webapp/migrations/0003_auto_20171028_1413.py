# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-10-28 14:13
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecom_webapp', '0002_auto_20171028_1246'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='mobiles',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='product',
            options={'managed': True},
        ),
       
        migrations.AlterField(
            model_name='mobiledata',
            name='index',
            field=models.IntegerField(db_column='Index', primary_key=True, serialize=False),
        ),
    ]
