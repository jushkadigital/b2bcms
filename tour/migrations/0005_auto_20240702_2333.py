# Generated by Django 5.0.6 on 2024-07-02 23:33

from django.db import migrations
from wagtail.models import BootstrapTranslatableModel


class Migration(migrations.Migration):

    dependencies = [
        ('tour', '0004_tour_locale_tour_translation_key'),
    ]

    operations = [
            BootstrapTranslatableModel('tour.Tour')
    ]
