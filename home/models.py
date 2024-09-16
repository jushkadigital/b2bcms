from django.db import models
from wagtail.api.v2.views import APIField
from wagtail.fields import RichTextField
from wagtail.images.blocks import ImageChooserBlock
from wagtail.models import ClusterableModel, Orderable, Page, ParentalKey, StreamField, ValidationError
from wagtail.admin.panels import FieldPanel, InlinePanel, MultipleChooserPanel,MultiFieldPanel,FieldRowPanel, ObjectList, PageChooserPanel, TabbedInterface, TitleFieldPanel
from wagtail.images import get_image_model_string
# Create your models here.
from blog.models import Blog
from home.wagtailCloudinary.abstract import AbstractRendition,AbstractCloudinaryImage,AbstractCloudinaryRendition
from wagtail.snippets.models import register_snippet
from wagtail.admin.filters import WagtailFilterSet
from wagtail.admin.ui.tables import UpdatedAtColumn
from wagtail.snippets.models import register_snippet
from wagtail.snippets.views.snippets import SnippetViewSet
from rest_framework import serializers
from modelcluster.fields import  ParentalKey as parentKeyModel
from taggit.models import Tag
# from home.serializers import DestinosSnippetsSerializer


from rest_framework.fields import Field
from rest_framework.serializers import Serializer

from home.panels import  ListSnippetPanel
from paquete import blocks
from paquete.models import Paquete


class CloudinaryImage(AbstractCloudinaryImage):
    pass
#     image = models.ForeignKey(
#             CloudinaryImage, on_delete=models.CASCADE, related_name="renditions"
#         )

class CloudinaryRendition(AbstractCloudinaryRendition):
    image = models.ForeignKey(
            CloudinaryImage, on_delete=models.CASCADE, related_name="renditions"
        )
    



# from home.models import Destino
class Destino(models.Model):
    name = models.CharField(max_length=255,verbose_name = "Nombre")
    background = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Imagen"
    )
    backgroundMobile = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Imagen para Mobile"
    )
    backgroundDestinoPage = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Imagen para el Fondo de Destinos"
    )

    panels = [
        FieldPanel('name'),
    ]
    def __str__(self):
        return self.name

class Informacion(models.Model):
    name =  models.CharField(max_length=255,verbose_name = "Nombre")
    image = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Imagen Icono"
    )
    numero =  models.CharField(max_length=255,verbose_name = "Numero Formato +x xxxxxxx o Texto de Boton ")
    desc =  models.CharField(max_length=255,verbose_name = "Descripcion",null=True,blank=True)
    link = models.CharField(max_length=300,verbose_name = "link")

class DataGeneral(ClusterableModel):
    razonSocial = models.CharField(max_length=255,verbose_name = "Razon Social") 
    direccion = models.CharField(max_length=255,verbose_name = "Direccion") 
    email = models.EmailField(max_length=100, verbose_name = "Correo Electronico",unique=True) 
    whatsapp = models.CharField(max_length=255,verbose_name = "whatsapp") 
    youtube = models.CharField(max_length=255,verbose_name = "Youtube") 
    instagram = models.CharField(max_length=255,verbose_name = "Instagram") 
    facebook = models.CharField(max_length=255,verbose_name = "Facebook") 
    tiktok = models.CharField(max_length=255,verbose_name = "Tiktok") 
    def save(self, *args, **kwargs):
        # Asegurarse de que solo hay una instancia
        if not self.pk and DataGeneral.objects.exists():
            raise ValidationError('Solo puede existir una instancia de SiteSettings.')
        return super().save(*args, **kwargs)

    def __str__(self):
        return self.razonSocial

class TelDataGeneral(Orderable):
    page = ParentalKey("home.DataGeneral", related_name="telefonos", on_delete=models.CASCADE)
    numero = models.CharField(max_length=255,verbose_name = "Numero de Celular ")
    api_fields = [
        APIField("numero")
            ]

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

    subpage_types = ['home.Inicio','home.Nosotros','home.Contacto','home.Global','home.SalidasPage','home.BlogPage']
    api_fields = [
    ]

    page_description = "Sitio cms wagtail"


from wagtail.images.api.fields import ImageRenditionField

class MyImageChooserBlock(ImageChooserBlock):
    def get_api_representation(self, value, context=None):
        if value:
            return {
                'id': value.id,
                'url': ImageRenditionField('width-1000').to_representation(value)
                }
    

class GalleryPaquetesCarousel(blocks.StructBlock):
    photo = MyImageChooserBlock(required=False)
    carouselTitulo = blocks.CharBlock(max_length=75,help_text="Titulo")
    carouselDuracion = blocks.CharBlock(max_length=75,help_text="Titulo")
    carouselLink = blocks.CharBlock(max_length=200,help_text="Link")
    carouselButtonName = blocks.CharBlock(max_length=75,help_text="texto del Boton")
    miniPhotos = blocks.ListBlock(MyImageChooserBlock(required=False))
    
class GalleryCarousel(blocks.StructBlock):
    photo = MyImageChooserBlock(required=False)
    carouselTitulo = blocks.CharBlock(max_length=75,help_text="Titulo",default=" ")
    carouselButtonName = blocks.CharBlock(max_length=75,help_text="texto del Boton")
 

# PAGES WAGTAIL

class Inicio(Page):
    paqueteTitulo = models.CharField(max_length=30,verbose_name="Subtitulo Paquetes")
    destinoTitulo = models.CharField(max_length=30,verbose_name="Subtitulo Destinos")
    formularioTitulo = models.CharField(max_length=75,verbose_name="Titulo Formulario")
    formularioSubtitulo = models.CharField(max_length=200,verbose_name="Subtitulo Formulario")
    galleryIni = StreamField([('Tipo1',GalleryPaquetesCarousel()),('Tipo2',GalleryCarousel())])
    content_panels = Page.content_panels + [
        # MultipleChooserPanel('galleryInicio', label="Carousel de Imagenes",chooser_field_name="image"),
        FieldPanel('galleryIni'),
        FieldPanel('paqueteTitulo'),
        # ListChildsPanel(name="aoeu"),
        ListSnippetPanel(modell=Paquete),
        FieldPanel('destinoTitulo'),
        ListSnippetPanel(modell=Destino),
        MultiFieldPanel([InlinePanel('faqInicio')],heading="Preguntas Frecuentes"),
        MultiFieldPanel([FieldPanel('formularioTitulo'),FieldPanel('formularioSubtitulo')],heading="formularioInicio")
    ]
    parent_page_types = ['home.Home']
    max_count_per_parent = 1
    subpage_types = []
    api_fields = [
            APIField('galleryIni'),
            APIField('paqueteTitulo'),
            APIField('destinoTitulo'),
            APIField('faqInicio'),
            APIField('formularioTitulo'),
            APIField('formularioSubtitulo')
    ]


# class GalleryCarousel(Roderable):
#     page = ParentalKey(Inicio, on_delete=models.CASCADE , related_name = 'galleryInicio')

#     image = models.ForeignKey(
#         get_image_model_string(), on_delete=models.CASCADE, related_name='+'
#     )
#     
#     carouselTitulo = models.CharField(max_length=50,verbose_name="Titulo")
#     
#     carouselDuracion = models.CharField(max_length=30,verbose_name="Duracion",default =" ")
#     
#     carouselLink = models.CharField(max_length=50,verbose_name="Link")

#     carouselButtonName = models.CharField(max_length=50,verbose_name="Texto del Boton")
#     
#     panels = [
#         FieldPanel('image'),
#         FieldPanel('carouselTitulo'),
#         FieldPanel('carouselDuracion',help_text="Formato: 10-8 = 10Dias/8noches"),
#         FieldPanel('carouselLink',help_text="Link del contenido"),
#         FieldPanel('carouselButtonName',help_text="Texto del Boton Rojo"),
#     ]

#     api_fields = [
#             APIField('image'),
#             APIField('carouselTitulo'),
#             APIField('carouselDuracion'),
#             APIField('carouselLink'),
#             APIField('carouselButtonName'),
#             ]
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
    puv = models.CharField(max_length=350 ,verbose_name= "Promesa Unica de Valor") 
    puvName = models.CharField(max_length=100 ,verbose_name= "Promesa Unica de Valor Nombre") 
    puvImage = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    )
    middleMensajeTitle =  models.CharField(max_length=350 ,verbose_name= "Mensaje Intermedio Subtitulo") 
    middleMensaje =  models.CharField(max_length=350 ,verbose_name= "Mensaje Intermedio") 
    mision = models.CharField(max_length=400 ,verbose_name= "Mision") 
    vision = models.CharField(max_length=400 ,verbose_name= "Vision") 
    razonSocial = models.CharField(max_length=100 ,verbose_name= "Razon Social") 
    numeroRuc = models.CharField(max_length=100 ,verbose_name= "Numero de Ruc") 
    nombreComercial = models.CharField(max_length=100 ,verbose_name= "Nombre Comercial") 
    certificadoAutorizacion = models.CharField(max_length=100 ,verbose_name= "Certificado de Autorizacion") 
    valoresSubtitle = models.CharField(max_length=100 ,verbose_name= "Valores Subtitilo") 
    partnersSubtitle = models.CharField(max_length=100 ,verbose_name= "Partners Subtitilo") 
    certificadosSubtitle = models.CharField(max_length=100 ,verbose_name= "Certificados Subtitilo") 

    content_panels = Page.content_panels + [
        # TitleFieldPanel('title', placeholder="Titulo del Paquete",help_text="El titulo sera incluido en la parte superior"),
        # MultiFieldPanel([InlinePanel('galleryInicio')],heading="Carousel de Imagenes"),
        MultiFieldPanel([FieldPanel('background'),FieldPanel('titulo')],heading="Banner"),
        MultiFieldPanel([
        FieldRowPanel([MultiFieldPanel([FieldPanel('subTitulo'),FieldPanel('parrafo')],heading="Parrafo"),FieldPanel('imageParrafo')])],heading="Parrafo e Informacion"),
        # MultiFieldPanel([FieldPanel('puv'),FieldPanel('puvName'),FieldPanel('puvImage')],heading="Promesa Unica de Valor"),
        # MultiFieldPanel([FieldPanel('midMessageSubtitle'),FieldPanel('midMessage')],heading="Mensaje Intermedio"),
        # MultiFieldPanel([FieldPanel('mision'),FieldPanel('vision')],heading="Mision Vision"),
        MultiFieldPanel([FieldRowPanel([FieldPanel('razonSocial'),FieldPanel('numeroRuc')]),FieldRowPanel([FieldPanel('nombreComercial'),FieldPanel('certificadoAutorizacion')])],heading="Informacion Legal"),
        MultiFieldPanel([InlinePanel('estadisticasNosotros')],heading="Estadisticas de la Empresa"),
        MultiFieldPanel([InlinePanel('valoresNosotros')],heading="Valores de la Empresa"),
        MultiFieldPanel([InlinePanel('partnersNosotros')],heading="Partners"),
        MultiFieldPanel([InlinePanel('certificadosNosotros')],heading="Certificados"),
        FieldPanel('valoresSubtitle'),
        FieldPanel('partnersSubtitle'),
        FieldPanel('certificadosSubtitle'),
    ]
    parent_page_types = ['home.Home']
    subpage_types = []
    max_count_per_parent = 1
    api_fields = [
            APIField('background'),
            APIField('titulo'),
            APIField('subTitulo'),
            APIField('parrafo'),
            APIField('imageParrafo'),
            # APIField('puv'),
            # APIField('puvName'),
            # APIField('puvImage'),
            # APIField('midMessage'),
            # APIField('midMessageSubtitle'),
            # APIField('vision'),
            # APIField('mision'),
            APIField('razonSocial'),
            APIField('numeroRuc'),
            APIField('nombreComercial'),
            APIField('certificadoAutorizacion'),
            APIField('estadisticasNosotros'),
            APIField('valoresNosotros'),
            APIField('partnersNosotros'),
            APIField('certificadosNosotros'),
            APIField('valoresSubtitle'),
            APIField('partnersSubtitle'),
            APIField('certificadosSubtitle'),
    ]

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

class Contacto(Page):
    background = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    )
    backgroundMobile = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    )
    titulo = models.CharField( max_length=100,verbose_name="Titulo")
    subTitulo = models.CharField( max_length=100,verbose_name="SubTitulo")
    formTitle = models.CharField( max_length=100,verbose_name="Titulo del Formulario de Contacto")
    ubicacion = models.CharField( max_length=100,verbose_name="Direccion de la Empresa")
    content_panels = Page.content_panels + [
        MultiFieldPanel([FieldPanel('background'),FieldPanel('backgroundMobile',help_text="background en Celulares"),FieldPanel('titulo'),FieldPanel('subTitulo')],heading="Banner"),
        FieldPanel('formTitle'),
        FieldPanel('ubicacion'),
            ]
    parent_page_types = ['home.Home']
    subpage_types = []
    max_count_per_parent = 1
    api_fields = [
            APIField('background'),
            APIField('backgroundMobile'),
            APIField('subTitulo'),
            APIField('titulo'),
            APIField('formTitle'),
            APIField('ubicacion'),
        ]
class ArticuloPrincipalSerializer(Field):
    def to_representation(self, page):
        # print((page.featuredImage.serializable_value()))
        return {
                "id": page.id,
                }


class BlogPage(Page):
    background = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    )
    backgroundMobile = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    )
    titulo = models.CharField( max_length=100,verbose_name="Titulo")
    articuloPrincipal = models.ForeignKey(
        Blog,  # Relación de ForeignKey a BlogPage
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='articuloPrincipal'  # Relación inversa
    )
    content_panels = Page.content_panels + [
        PageChooserPanel('articuloPrincipal','blog.Blog'),
        FieldPanel('titulo'),
        FieldPanel('background'),
        FieldPanel('backgroundMobile'),
        MultiFieldPanel([InlinePanel('articulosRecomendados')],heading="ArticulosRecomendados"),
            ]
    parent_page_types = ['home.Home']
    subpage_types = []
    max_count_per_parent = 1
    api_fields = [
            APIField('articuloPrincipal',serializer=ArticuloPrincipalSerializer()),
            APIField('titulo'),
            APIField('background'),
            APIField('backgroundMobile'),
            APIField('articulosRecomendados')
        ]


class ArticulosRecomendados(Orderable):
    page = ParentalKey(BlogPage, on_delete=models.CASCADE , related_name = 'articulosRecomendados')
    articuloPrincipal = models.ForeignKey(
        Blog,  # Relación de ForeignKey a BlogPage
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='articuloPrincipalOrderable'  # Relación inversa
    )
    panels = [
        PageChooserPanel('articuloPrincipal','blog.Blog'),
    ]
    api_fields = [
            
        APIField('articuloPrincipal',serializer=ArticuloPrincipalSerializer()),
            ]




class SalidasPage(Page):
    background = models.ForeignKey(
        get_image_model_string(), on_delete=models.CASCADE, related_name='+'
    )
    content_panels = Page.content_panels + [
        MultiFieldPanel([FieldPanel('background')],heading="Banner"),
        ]
    
    
    parent_page_types = ['home.Home']
    
    subpage_types = []
    
    max_count_per_parent = 1
    api_fields = [
        APIField('background'),
        ]


    

class Global(Page):
    body = RichTextField(blank=True)
    parent_page_types = ['home.Home']
    max_count_per_parent = 1
    content_panels = Page.content_panels + [
        # TitleFieldPanel('title', placeholder="Titulo del Paquete",help_text="El titulo sera incluido en la parte superior"),
        FieldPanel('body'),
    ]


# SNIPPETS WAGTAIL
@register_snippet
class TourCategory(models.Model):

    name = models.CharField(max_length=255)
    panels = [
        FieldPanel("name"),
    ]

    class Meta:
        verbose_name = "Tour Category"
        verbose_name_plural = "Tour Categories"
        ordering = ["name"]

    def __str__(self):
        return self.name




class DestinoViewSet(SnippetViewSet):
    model = Destino
    icon = "tag"
    list_display = ["name", "background", UpdatedAtColumn()]
    list_per_page = 50
    add_to_admin_menu = True
    menu_order = 400
    copy_view_enabled = False
    inspect_view_enabled = True
    admin_url_namespace = "destino_views"
    base_url_path = "internal/destinos"
    # alternatively, you can use the following instead of filterset_class
    # list_filter = ["shirt_size"]
    # or
    # list_filter = {"shirt_size": ["exact"], "name": ["icontains"]}
    edit_handler = TabbedInterface([
        ObjectList([FieldPanel("name"),FieldPanel("background",help_text ="Dimensiones max: varian consultar Maqueta. px"),FieldPanel("backgroundMobile",help_text ="Dimensiones max: . px"),FieldPanel("backgroundDestinoPage",help_text ="Dimensiones max: . px")], heading="Informacion"),
    ])

register_snippet(DestinoViewSet)

class InformacionViewSet(SnippetViewSet):
    model= Informacion
    icon = "tag"
    list_display = ["name",UpdatedAtColumn()]
    list_per_page = 50
    add_to_admin_menu = True
    menu_order = 500
    menu_label = "Informacion"
    inspect_view_enabled = True
    admin_url_namespace = "informacion_views"
    base_url_path = "internal/informacion"
    edit_handler = TabbedInterface([
        ObjectList([FieldPanel('name'),FieldPanel('image'),FieldPanel("numero"),FieldPanel("desc"),FieldPanel("link")],heading="Data")
        ])

register_snippet(InformacionViewSet)


class DataGeneralViewSet(SnippetViewSet):
    model= DataGeneral
    icon = "tag"
    list_display = ["razonSocial",UpdatedAtColumn()]
    list_per_page = 50
    add_to_admin_menu = True
    menu_order = 550
    menu_label = "Data General"
    inspect_view_enabled = True
    admin_url_namespace = "dataGeneral_views"
    base_url_path = "internal/dataGeneral"
    edit_handler = TabbedInterface([
        ObjectList([FieldPanel('razonSocial'),FieldPanel('direccion'),InlinePanel("telefonos", label="Telefonos"),FieldPanel("email"),FieldPanel("whatsapp"),FieldPanel("youtube"),FieldPanel("instagram"),FieldPanel("facebook"),FieldPanel("tiktok")],heading="Data")
    ])

register_snippet(DataGeneralViewSet)
