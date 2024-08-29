# Generated by Django 5.0.6 on 2024-08-28 02:25

import django.db.models.deletion
import modelcluster.fields
import wagtail.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('wagtailcore', '0093_uploadedfile'),
    ]

    operations = [
        migrations.CreateModel(
            name='Blog',
            fields=[
                ('page_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='wagtailcore.page')),
                ('body', wagtail.fields.RichTextField(blank=True, null=True)),
                ('date', models.DateField(blank=True, null=True, verbose_name='Fecha para mostrar en el Post')),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailcore.page',),
        ),
        migrations.CreateModel(
            name='CategoryBlog',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=80, unique=True, verbose_name='Category Name')),
                ('description', models.CharField(blank=True, max_length=500)),
                ('parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='blog.categoryblog')),
            ],
            options={
                'verbose_name': 'Category',
                'verbose_name_plural': 'Categories',
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='CategoryBlogPage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category', modelcluster.fields.ParentalKey(on_delete=django.db.models.deletion.CASCADE, to='blog.categoryblog', verbose_name='Category')),
                ('page', modelcluster.fields.ParentalKey(on_delete=django.db.models.deletion.CASCADE, to='blog.blog')),
            ],
        ),
        migrations.AddField(
            model_name='blog',
            name='categories',
            field=models.ManyToManyField(blank=True, null=True, through='blog.CategoryBlogPage', to='blog.categoryblog'),
        ),
    ]