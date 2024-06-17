from django.db import models
from wagtail import blocks
from wagtail.api.v2.views import APIField
from wagtail.models import Orderable, Page, ParentalKey, StreamField
from wagtail.fields import RichTextField
from wagtail.admin.panels import FieldPanel, InlinePanel, MultipleChooserPanel,MultiFieldPanel,FieldRowPanel, TitleFieldPanel
from wagtail.images import get_image_model_string
# Create your models here.
from wagtail_cloudinary_image.abstract import AbstractRendition,AbstractCloudinaryImage,AbstractCloudinaryRendition
from wagtail.images.blocks import ImageChooserBlock
from wagtail.admin.forms import WagtailAdminPageForm

class CloudinaryImage(AbstractCloudinaryImage):
    pass
#     image = models.ForeignKey(
#             CloudinaryImage, on_delete=models.CASCADE, related_name="renditions"
#         )

class CloudinaryRendition(AbstractCloudinaryRendition):
    image = models.ForeignKey(
            CloudinaryImage, on_delete=models.CASCADE, related_name="renditions"
        )
    


class IndexPaquete(Page):
    # intro = models.CharField(max_length=100)
    parent_page_types = ['home.Inicio']
    subpage_types = ['paquete.Paquete']
    max_count_per_parent = 1


# class CloudinaryRendition(AbstractCloudinaryRendition):
#     image = models.ForeignKey(
#             CloudinaryImage, on_delete=models.CASCADE, related_name="renditions"
#         )


class Paquete(Page):
    background = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Imagen de Fondo"
    )
    featuredImage = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Thumbnail"
    )
    precio = models.DecimalField(max_digits=6, decimal_places=2,verbose_name="Precio")
    duracion = models.CharField( max_length=12,verbose_name="Duracion del Paquete")
    linkWord = models.CharField( max_length=100,verbose_name="Link Word")
    linkPdf = models.CharField( max_length=100,verbose_name="Link Pdf")
    linkFlyer = models.CharField( max_length=100,verbose_name="Link Flyer")
    content_panels = Page.content_panels[1:] + [
        TitleFieldPanel('title', placeholder="Titulo del Paquete",help_text="El titulo sera incluido en la parte superior"),
        FieldPanel('featuredImage'),
        MultiFieldPanel([
        FieldPanel('background'),
        FieldPanel('duracion',help_text="Formato: 10-8 = 10Dias/8noches"),
        FieldRowPanel([FieldPanel('linkWord'),FieldPanel('linkPdf'),FieldPanel('linkFlyer')])],heading="Parte Superior"),

        MultiFieldPanel([
        FieldRowPanel([MultiFieldPanel([FieldPanel('precio'),InlinePanel('excluidos', label="No Incluye"),InlinePanel('incluidos', label="Incluye") ]),
                       MultiFieldPanel([MultipleChooserPanel('galleryPaquete', label="Galeria de Imagenes",chooser_field_name="image"),InlinePanel('dias',label="dia")])])],heading="Parte Intermedia"),
    ]

    api_fields = [
        APIField('background'),
        APIField('featuredImage'),
        APIField('duracion'),
        APIField('linkWord'),
        APIField('linkPdf'),
        APIField('linkFlyer'),
        APIField('precio'),
        APIField('excluidos'),
        APIField('incluidos'),
        APIField('galleryPaquete'),
        APIField('dias'),
    ]

    page_description = "Informacion del paquete"


class ExcluidoItemPaquete(Orderable):
    page = ParentalKey(Paquete, on_delete=models.CASCADE , related_name = 'excluidos')
    item = models.CharField( max_length=80,verbose_name="Item")
    panels = [
            FieldPanel('item')
            ]
    api_fields = [
            APIField('item')
            ]

class IncluidoItemPaquete(Orderable):
    page = ParentalKey(Paquete, on_delete=models.CASCADE , related_name = 'incluidos')
    item = models.CharField( max_length=80,verbose_name="Item")
    panels = [
            FieldPanel('item')
            ]
    api_fields = [
            APIField('item')
            ]

class GalleryCarousel(Orderable):
    page = ParentalKey(Paquete, on_delete=models.CASCADE , related_name = 'galleryPaquete')
    image = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    )
    caption = models.CharField(blank=True, max_length=250)

    panels = [
        FieldPanel('image'),
        FieldPanel('caption'),
    ]
    api_fields = [
            APIField('image'),
            APIField('caption')
            ]
class Dias(Orderable):
    page = ParentalKey(Paquete, on_delete=models.CASCADE , related_name = 'dias')
    item = RichTextField()
    panels = [
            FieldPanel('item')
            ]
    api_fields = [
            APIField('item')
            ]

