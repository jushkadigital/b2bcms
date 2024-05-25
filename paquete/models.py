from django.db import models
from wagtail.api.v2.views import APIField
from wagtail.models import Orderable, Page, ParentalKey
from wagtail.fields import RichTextField
from wagtail.admin.panels import FieldPanel, InlinePanel

# Create your models here.

class Paquete(Page):
    # background = models.ForeignKey(
    #     'wagtailimages.Image', on_delete=models.CASCADE, related_name='+',verbose_name="Imagen de Fondo"
    # )
    precio = models.DecimalField(max_digits=6, decimal_places=2,verbose_name="Precio")
    duracion = models.CharField( max_length=12,verbose_name="Duracion")
    date = models.DateField("Fecha")
    content_panels = Page.content_panels + [
        # FieldPanel('background',),
        FieldPanel('precio'),
        FieldPanel('duracion',help_text="Formato: 10-8 = 10d-8n"),
        InlinePanel('excluidos', label="ExcluidoItem"),
        InlinePanel('galleryExcluidos', label="Galeria Item"),
        FieldPanel('date'),
    ]
    api_fields = [
        # APIField('background'),
        APIField('precio'),
        APIField('duracion'),
        APIField('date'),
        APIField('excluidos'),
        APIField('galleryExcluidos')
    ]

class ExcluidoItemPaquete(Orderable):
    page = ParentalKey(Paquete, on_delete=models.CASCADE , related_name = 'excluidos')
    item = models.CharField( max_length=80,verbose_name="Item")
    panels = [
            FieldPanel('item')
            ]
    api_fields = [
            APIField('item')
            ]

# class GalleryCarousel(Orderable):
#     page = ParentalKey(Paquete, on_delete=models.CASCADE , related_name = 'galleryExcluidos')
#     image = models.ForeignKey(
#         'wagtailimages.Image', on_delete=models.CASCADE, related_name='+'
#     )
#     caption = models.CharField(blank=True, max_length=250)

#     panels = [
#         FieldPanel('image'),
#         FieldPanel('caption'),
#     ]
#     api_fields = [
#             APIField('image')
#             ]

