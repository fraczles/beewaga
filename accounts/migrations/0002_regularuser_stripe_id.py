# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='regularuser',
            name='stripe_id',
            field=models.CharField(max_length=50, null=True),
            preserve_default=True,
        ),
    ]
