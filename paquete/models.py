from django.db import models
from wagtail import blocks
from wagtail.admin.ui.tables import UpdatedAtColumn
from wagtail.api.v2.views import APIField
from wagtail.models import BootstrapTranslatableMixin, Orderable, Page, ParentalKey, StreamField, TranslatableMixin, ValidationError, forms
from wagtail.fields import RichTextField
from wagtail.admin.panels import FieldPanel, InlinePanel, MultipleChooserPanel,MultiFieldPanel,FieldRowPanel, ObjectList, TabbedInterface, TitleFieldPanel
from wagtail.images import get_image_model_string
# Create your models here.
from wagtail.snippets.models import register_snippet
from wagtail.snippets.views.snippets import SnippetViewSet
from home.wagtailCloudinary.abstract import AbstractRendition,AbstractCloudinaryImage,AbstractCloudinaryRendition
from wagtail.images.blocks import ImageChooserBlock
from wagtail.admin.forms import WagtailAdminPageForm
from wagtail.admin.viewsets.model import ModelViewSet
from django.contrib.contenttypes.fields import GenericRelation
from wagtail.admin.panels import PublishingPanel
from wagtail.models import DraftStateMixin, LockableMixin, RevisionMixin, WorkflowMixin
from modelcluster.models import ClusterableModel
from wagtail.search import index
from wagtail.admin.panels import PublishingPanel


dictRelativeNames = {
        "excluidos": "No Incluye",
        "incluidos": "Incluye",
        "galleryPaquete": "Galeria de Imagenes",
        "dias":"Dias Itinerario"
        }

class CustomValidateForm(WagtailAdminPageForm):
    """
    Custom Form for validations only in Publish Mode
    """

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields["action-publish"] = forms.CharField(required=False, widget=forms.HiddenInput())

    def clean(self):
        cleaned_data = super().clean()


        for key,val in (self.formsets.items()):
            if cleaned_data.get("action-publish") and len(val.forms) == 0 and key != "comments":
                raise forms.ValidationError(f"Error debe haber almenos uno en {dictRelativeNames[key]}")
        if cleaned_data.get("action-publish") and cleaned_data.get('background') is None:
            raise forms.ValidationError({"background": "Error debes poner la imagen de fondo"})
        if cleaned_data.get("action-publish") and cleaned_data.get('featuredImage') is None:
            raise forms.ValidationError({"featuredImage": "Error debes poner el Thumbnail"})
        if cleaned_data.get("action-publish") and cleaned_data.get('precio') is None:
            raise forms.ValidationError({"precio": "Error debes poner el precio"})
        if cleaned_data.get("action-publish") and cleaned_data.get('duracion') is None:
            raise forms.ValidationError({"duracion": "Error debes poner la duracion"})
        if cleaned_data.get("action-publish") and cleaned_data.get('linkWord') is None:
            raise forms.ValidationError({"linkWord": "Error debes poner el link"})
        if cleaned_data.get("action-publish") and cleaned_data.get('linkPdf') is None:
            raise forms.ValidationError({"linkPdf": "Error debes poner el link"})
        if cleaned_data.get("action-publish") and cleaned_data.get('linkFlyer') is None:
            raise forms.ValidationError({"linkFlyer": "Error debes poner el link"})
        if cleaned_data.get("action-publish") and cleaned_data.get('linkFlyer') is None:
            raise forms.ValidationError({"linkFlyer": "Error debes poner el link"})
        return cleaned_data

class Paquete(Page):
    # title = models.CharField( max_length=100)
    background = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Imagen de Fondo"
    )
    featuredImage = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Thumbnail"
    )
    precio = models.DecimalField(max_digits=6, decimal_places=2,verbose_name="Precio",null=True,blank=True)
    duracion = models.CharField( max_length=12,verbose_name="Duracion del Paquete",null=True,blank=True)
    linkWord = models.CharField( max_length=100,verbose_name="Link Word",null=True,blank=True)
    linkPdf = models.CharField( max_length=100,verbose_name="Link Pdf",null=True,blank=True)
    linkFlyer = models.CharField( max_length=100,verbose_name="Link Flyer",null=True,blank=True)
    base_form_class = CustomValidateForm

    def __str__(self):
        return self.title

    def clean(self):
        super().clean()
                
    content_panels =Page.content_panels +  [
        # TitleFieldPanel('title', placeholder="Titulo del Paquete",help_text="El titulo sera incluido en la parte superior"),
        FieldPanel('featuredImage',help_text ="Dimensiones max: 425 x 585. px"),
        MultiFieldPanel([
        FieldPanel('background',help_text ="Dimensiones max: 1445 x 1030. px"),
        FieldPanel('duracion',help_text="Formato: 10-8 = 10Dias/8noches"),
        FieldRowPanel([FieldPanel('linkWord'),FieldPanel('linkPdf'),FieldPanel('linkFlyer')])],heading="Parte Superior"),

        MultiFieldPanel([
        FieldRowPanel([MultiFieldPanel([FieldPanel('precio'),InlinePanel('excluidos', label="No Incluye"),InlinePanel('incluidos', label="Incluye") ]),
                       MultiFieldPanel([MultipleChooserPanel('galleryPaquete', label="Galeria de Imagenes",chooser_field_name="image"),InlinePanel('dias',label="Dias Itinerario")])])],heading="Parte Intermedia"),
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
    item = models.CharField( max_length=80,verbose_name="Item",null=True,blank=True)
    @classmethod
    def get_required_fields(cls):
        return ['item'] 

    panels = [
            FieldPanel('item')
            ]
    api_fields = [
            APIField('item')
            ]
    

class IncluidoItemPaquete(Orderable):
    page = ParentalKey(Paquete, on_delete=models.CASCADE , related_name = 'incluidos')
    item = models.CharField( max_length=80,verbose_name="Item",null=True,blank=True)
    @classmethod
    def get_required_fields(cls):
        return ['item'] 

    panels = [
            FieldPanel('item')
            ]
    api_fields = [
            APIField('item')
            ]

class GalleryCarousel(Orderable):
    page = ParentalKey(Paquete, on_delete=models.CASCADE , related_name = 'galleryPaquete')
    image = models.ForeignKey(
        get_image_model_string() ,null=True,blank=True, on_delete=models.CASCADE, related_name='+'
    )
    
    caption = models.CharField( max_length=250,null=True,blank=True)
    @classmethod
    def get_required_fields(cls):
        return ['image','caption'] 

    panels = [
        FieldPanel('image',help_text ="Dimensiones max: 279 x 279. px"),
        FieldPanel('caption'),
    ]
    api_fields = [
            APIField('image'),
            APIField('caption')
            ]

class Dias(Orderable):
    page = ParentalKey(Paquete, on_delete=models.CASCADE , related_name = 'dias')
    titulo =models.CharField( max_length=100,verbose_name="Titulo del Dia",null=True,blank=True) 
    item = RichTextField(null=True,blank=True)
    def get_required_fields(cls):
        return ['item'] 
    panels = [
            FieldPanel('titulo'),
            FieldPanel('item')
            ]
    api_fields = [
            APIField('titulo'),
            APIField('item')
            ]

## PageListViewSet

# class PaqueteViewSet(SnippetViewSet):
#     model = Paquete
#     icon = "tag"
#     list_display = ["title", "featuredImage", UpdatedAtColumn()]
#     list_per_page = 50
#     add_to_admin_menu = True
#     menu_order = 250
#     copy_view_enabled = False
#     inspect_view_enabled = True
#     admin_url_namespace = "paquete_views"
#     base_url_path = "snippets/paquete"
#     # alternatively, you can use the following instead of filterset_class
#     # list_filter = ["shirt_size"]
#     # or
#     # list_filter = {"shirt_size": ["exact"], "name": ["icontains"]}
#     
# register_snippet(PaqueteViewSet)


