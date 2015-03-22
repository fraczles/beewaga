# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0005_auto_20150322_0609'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='pledge',
            name='amount',
        ),
        migrations.AddField(
            model_name='pledge',
            name='tutor',
            field=models.OneToOneField(null=True, to='accounts.TutorProfile'),
            preserve_default=True,
        ),
    ]
