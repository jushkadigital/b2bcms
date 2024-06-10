from django.db import models
from wagtail.api.v2.views import APIField
from wagtail.fields import RichTextField
from wagtail.models import Orderable, Page, ParentalKey, StreamField
from wagtail.admin.panels import FieldPanel, InlinePanel, MultipleChooserPanel,MultiFieldPanel,FieldRowPanel, ObjectList, TabbedInterface, TitleFieldPanel
from wagtail.images import get_image_model_string
# Create your models here.
from wagtail_cloudinary_image.abstract import AbstractRendition,AbstractCloudinaryImage,AbstractCloudinaryRendition
from wagtail.snippets.models import register_snippet
from wagtail.admin.filters import WagtailFilterSet
from wagtail.admin.ui.tables import UpdatedAtColumn
from wagtail.snippets.models import register_snippet
from wagtail.snippets.views.snippets import SnippetViewSet
from rest_framework import serializers
from modelcluster.fields import  ParentalKey as parentKeyModel


# from home.serializers import DestinosSnippetsSerializer


from rest_framework.fields import Field
from rest_framework.serializers import Serializer

from home.panels import ListChildsPanel, ListSnippetPanel

# from home.models import Destino

class Destino(models.Model):
    name = models.CharField(max_length=255,verbose_name = "Nombre")
    background = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Imagen de Fondo"
    )



class ChildSerializer(serializers.ModelSerializer):
    class Meta:
        model = Destino
        fields = '__all__'

class DestinosSnippetsSerializer(Field):
    def to_representation(self, childs):
        print(childs)
        return [ChildSerializer(child).data for child in childs]


class Home(Page):
    body = RichTextField(blank=True)
    content_panels = Page.content_panels + [
        # TitleFieldPanel('title', placeholder="Titulo del Paquete",help_text="El titulo sera incluido en la parte superior"),
        FieldPanel('body'),
    ]


    subpage_types = ['home.Inicio']
    api_fields = [
    ]

    page_description = "Sitio cms wagtail"

# PAGES WAGTAIL

class Inicio(Page):
    paqueteTitulo = models.CharField(max_length=30,verbose_name="Subtitulo Paquetes")
    destinoTitulo = models.CharField(max_length=30,verbose_name="Subtitulo Destinos")
    content_panels = Page.content_panels + [
        # TitleFieldPanel('title', placeholder="Titulo del Paquete",help_text="El titulo sera incluido en la parte superior"),
        # MultiFieldPanel([InlinePanel('galleryInicio')],heading="Carousel de Imagenes"),
        MultipleChooserPanel('galleryInicio', label="Carousel de Imagenes",chooser_field_name="image"),
        FieldPanel('paqueteTitulo'),
        ListChildsPanel(name="aoeu"),
        FieldPanel('destinoTitulo'),
        ListSnippetPanel(modell=Destino),
        MultiFieldPanel([InlinePanel('faqInicio')],heading="Preguntas Frecuentes"),
    ]

    parent_page_types = ['home.Home']
    @property
    def get_child_pages(self):
        return Destino.objects.all()

    subpage_types = ['paquete.IndexPaquete']
    api_fields = [
            APIField('galleryInicio'),
            APIField('paqueteTitulo'),
            APIField('destinoTitulo'),
            APIField('get_child_pages',serializer=DestinosSnippetsSerializer()),
            APIField('faqInicio')
    ]


class GalleryCarousel(Orderable):
    page = ParentalKey(Inicio, on_delete=models.CASCADE , related_name = 'galleryInicio')
    image = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    )
   
    panels = [
        FieldPanel('image'),
    ]

    api_fields = [
            APIField('image'),
            ]

class Faq(Orderable):
    page = ParentalKey(Inicio,on_delete=models.CASCADE , related_name = 'faqInicio')
    question = models.CharField( max_length=250,verbose_name="Pregunta")
    answer = RichTextField(verbose_name="Respuesta")
    panels = [
        FieldPanel('question'),
        FieldPanel('answer'),
    ]
    api_fields = [
            APIField('question'),
            APIField('answer')
            ]
# SNIPPETS WAGTAIL


class DestinoViewSet(SnippetViewSet):
    model = Destino
    icon = "user"
    list_display = ["name", "background", UpdatedAtColumn()]
    list_per_page = 50
    add_to_admin_menu = True
    copy_view_enabled = False
    inspect_view_enabled = True
    admin_url_namespace = "destino_views"
    base_url_path = "internal/destinos"
    # alternatively, you can use the following instead of filterset_class
    # list_filter = ["shirt_size"]
    # or
    # list_filter = {"shirt_size": ["exact"], "name": ["icontains"]}
    edit_handler = TabbedInterface([
        ObjectList([FieldPanel("name"),FieldPanel("background")], heading="Informacion"),
    ])

register_snippet(DestinoViewSet)


