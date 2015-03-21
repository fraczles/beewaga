# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tutorprofile',
            name='supporters',
        ),
        migrations.AddField(
            model_name='userprofile',
            name='supports',
            field=models.ManyToManyField(related_name='supported_by', to='accounts.TutorProfile'),
            preserve_default=True,
        ),
    ]
