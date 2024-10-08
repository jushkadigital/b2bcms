# Generated by Django 5.0.6 on 2024-07-04 18:02

import django.db.models.deletion
import wagtail.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('paquete', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dias',
            name='item',
            field=wagtail.fields.RichTextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='excluidoitempaquete',
            name='item',
            field=models.CharField(blank=True, max_length=80, null=True, verbose_name='Item'),
        ),
        migrations.AlterField(
            model_name='gallerycarousel',
            name='caption',
            field=models.CharField(blank=True, max_length=250, null=True),
        ),
        migrations.AlterField(
            model_name='gallerycarousel',
            name='image',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='+', to='home.cloudinaryimage'),
        ),
        migrations.AlterField(
            model_name='incluidoitempaquete',
            name='item',
            field=models.CharField(blank=True, max_length=80, null=True, verbose_name='Item'),
        ),
        migrations.AlterField(
            model_name='paquete',
            name='duracion',
            field=models.CharField(blank=True, max_length=12, null=True, verbose_name='Duracion del Paquete'),
        ),
        migrations.AlterField(
            model_name='paquete',
            name='linkFlyer',
            field=models.CharField(blank=True, max_length=100, null=True, verbose_name='Link Flyer'),
        ),
        migrations.AlterField(
            model_name='paquete',
            name='linkPdf',
            field=models.CharField(blank=True, max_length=100, null=True, verbose_name='Link Pdf'),
        ),
        migrations.AlterField(
            model_name='paquete',
            name='linkWord',
            field=models.CharField(blank=True, max_length=100, null=True, verbose_name='Link Word'),
        ),
        migrations.AlterField(
            model_name='paquete',
            name='precio',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=6, null=True, verbose_name='Precio'),
        ),
    ]
