# Generated by Django 5.0.6 on 2024-06-09 20:31

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0006_remove_inicio_body'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='gallerycarousel',
            name='caption',
        ),
    ]
