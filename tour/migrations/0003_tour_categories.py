# Generated by Django 5.0.6 on 2024-06-25 18:01

import modelcluster.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0004_tourcategory'),
        ('tour', '0002_alter_tour_tour'),
    ]

    operations = [
        migrations.AddField(
            model_name='tour',
            name='categories',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='home.tourcategory'),
        ),
    ]
