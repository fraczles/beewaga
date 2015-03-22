# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0004_auto_20150322_0607'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='regularuser',
            name='stripe_id',
        ),
        migrations.AddField(
            model_name='pledge',
            name='stripe_id',
            field=models.CharField(max_length=50, null=True),
            preserve_default=True,
        ),
    ]
