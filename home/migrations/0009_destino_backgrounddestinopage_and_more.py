# Generated by Django 5.0.6 on 2024-08-14 18:38

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0008_contacto_backgroundmobile_contacto_subtitulo'),
    ]

    operations = [
        migrations.AddField(
            model_name='destino',
            name='backgroundDestinoPage',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='+', to='home.cloudinaryimage', verbose_name='Imagen para el Fondo de Destinos'),
        ),
        migrations.AlterField(
            model_name='destino',
            name='background',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='+', to='home.cloudinaryimage', verbose_name='Imagen'),
        ),
        migrations.AlterField(
            model_name='destino',
            name='backgroundMobile',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='+', to='home.cloudinaryimage', verbose_name='Imagen para Mobile'),
        ),
    ]
