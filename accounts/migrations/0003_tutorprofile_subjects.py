# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_regularuser_stripe_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='tutorprofile',
            name='subjects',
            field=models.CharField(max_length=100, null=True),
            preserve_default=True,
        ),
    ]
