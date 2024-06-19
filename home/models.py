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

class DataNumeros(models.Model):
    name =  models.CharField(max_length=255,verbose_name = "Nombre")
    numero =  models.CharField(max_length=255,verbose_name = "Numero Formate +x xxxxxxx")
    link = models.CharField(max_length=300,verbose_name = "link",blank=True)

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

    subpage_types = ['home.Inicio','home.Nosotros']
    api_fields = [
    ]

    page_description = "Sitio cms wagtail"

# PAGES WAGTAIL

class Inicio(Page):
    paqueteTitulo = models.CharField(max_length=30,verbose_name="Subtitulo Paquetes")
    destinoTitulo = models.CharField(max_length=30,verbose_name="Subtitulo Destinos")
    formularioTitulo = models.CharField(max_length=75,verbose_name="Titulo Formulario")
    formularioSubtitulo = models.CharField(max_length=75,verbose_name="Subtitulo Formulario")

    content_panels = Page.content_panels + [
        # TitleFieldPanel('title', placeholder="Titulo del Paquete",help_text="El titulo sera incluido en la parte superior"),
        # MultiFieldPanel([InlinePanel('galleryInicio')],heading="Carousel de Imagenes"),
        MultipleChooserPanel('galleryInicio', label="Carousel de Imagenes",chooser_field_name="image"),
        FieldPanel('paqueteTitulo'),
        ListChildsPanel(name="aoeu"),
        FieldPanel('destinoTitulo'),
        ListSnippetPanel(modell=Destino),
        MultiFieldPanel([InlinePanel('faqInicio')],heading="Preguntas Frecuentes"),
        MultiFieldPanel([FieldPanel('formularioTitulo'),FieldPanel('formularioSubtitulo')],heading="formularioInicio")
    ]
    parent_page_types = ['home.Home']
    max_count_per_parent = 1
    subpage_types = ['paquete.IndexPaquete']
    api_fields = [
            APIField('galleryInicio'),
            APIField('paqueteTitulo'),
            APIField('destinoTitulo'),
            APIField('faqInicio'),
            APIField('formularioTitulo'),
            APIField('formularioSubtitulo')
    ]


class GalleryCarousel(Orderable):
    page = ParentalKey(Inicio, on_delete=models.CASCADE , related_name = 'galleryInicio')

    image = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    )
    
    carouselTitulo = models.CharField(max_length=50,verbose_name="Titulo")
    
    carouselDuracion = models.CharField(max_length=30,verbose_name="Duracion")
    
    panels = [
        FieldPanel('image'),
        FieldPanel('carouselTitulo'),
        FieldPanel('carouselDuracion',help_text="Formato: 10-8 = 10Dias/8noches"),
    ]

    api_fields = [
            APIField('image'),
            APIField('carouselTitulo'),
            APIField('carouselDuracion'),
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

class Nosotros(Page):
    background = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    )
    titulo = models.CharField( max_length=100,verbose_name="Titulo")
    subTitulo = models.CharField( max_length=100,verbose_name="Subtitulo")
    parrafo = RichTextField(verbose_name="Parrafo")
    imageParrafo = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    ) 
    razonSocial = models.CharField(max_length=100 ,verbose_name= "Razon Social") 
    numeroRuc = models.CharField(max_length=100 ,verbose_name= "Numero de Ruc") 
    nombreComercial = models.CharField(max_length=100 ,verbose_name= "Nombre Comercial") 
    certificadoAutorizacion = models.CharField(max_length=100 ,verbose_name= "Certificado de Autorizacion") 
    content_panels = Page.content_panels + [
        # TitleFieldPanel('title', placeholder="Titulo del Paquete",help_text="El titulo sera incluido en la parte superior"),
        # MultiFieldPanel([InlinePanel('galleryInicio')],heading="Carousel de Imagenes"),
        MultiFieldPanel([FieldPanel('background'),FieldPanel('titulo')],heading="Banner"),
        MultiFieldPanel([
        FieldRowPanel([MultiFieldPanel([FieldPanel('subTitulo'),FieldPanel('parrafo')],heading="Parrafo"),FieldPanel('imageParrafo')])],heading="Parrafo e Informacion"),
        MultiFieldPanel([FieldRowPanel([FieldPanel('razonSocial'),FieldPanel('numeroRuc')]),FieldRowPanel([FieldPanel('nombreComercial'),FieldPanel('certificadoAutorizacion')])],heading="Informacion Legal"),
        MultiFieldPanel([InlinePanel('estadisticasNosotros')],heading="Estadisticas de la Empresa"),
        MultiFieldPanel([InlinePanel('valoresNosotros')],heading="Valores de la Empresa"),
        MultiFieldPanel([InlinePanel('partnersNosotros')],heading="Partners"),
        MultiFieldPanel([InlinePanel('certificadosNosotros')],heading="Certificados"),
    ]
    parent_page_types = ['home.Home']
    max_count_per_parent = 1

class Estadisticas(Orderable):
    page = ParentalKey(Nosotros,on_delete=models.CASCADE , related_name = 'estadisticasNosotros')
    redLet = models.CharField( max_length=50,verbose_name="Letra Roja")
    grayLet = models.CharField( max_length=50,verbose_name="Letra Gris")
    panels = [
        FieldPanel('redLet'),
        FieldPanel('grayLet'),
    ]
    api_fields = [
            APIField('redLet'),
            APIField('grayLet')
            ]
class Valores(Orderable):
    page = ParentalKey(Nosotros,on_delete=models.CASCADE , related_name = 'valoresNosotros')
    img = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    ) 
    label = models.CharField( max_length=50,verbose_name="Nombre del valor")
    panels = [
        FieldPanel('img'),
        FieldPanel('label'),
    ]
    api_fields = [
            APIField('img'),
            APIField('label')
            ]

class Partners(Orderable):
    page = ParentalKey(Nosotros, on_delete=models.CASCADE , related_name = 'partnersNosotros')
    image = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    )
   
    panels = [
        FieldPanel('image'),
    ]

    api_fields = [
            APIField('image'),
            ]

class Certificados(Orderable):
    page = ParentalKey(Nosotros, on_delete=models.CASCADE , related_name = 'certificadosNosotros')
    image = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    )
   
    panels = [
        FieldPanel('image'),
    ]

    api_fields = [
            APIField('image'),
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

class DataNumerosViewSet(SnippetViewSet):
    model= DataNumeros
    icon = "user"
    list_display = ["name",UpdatedAtColumn()]
    list_per_page = 50
    add_to_admin_menu = True
    inspect_view_enabled = True
    admin_url_namespace = "dataNumeros_views"
    base_url_path = "internal/dataNumeros"
    edit_handler = TabbedInterface([
        ObjectList([FieldPanel('name'),FieldPanel("numero"),FieldPanel("link")],heading="Data")
        ])

register_snippet(DataNumerosViewSet)
