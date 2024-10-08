from django.db import models
from wagtail.admin.ui.tables import UpdatedAtColumn
from wagtail.api.v2.filters import TaggableManager
from wagtail.api.v2.views import APIField
from wagtail.blocks import RichTextBlock
from wagtail.fields import RichTextField
from wagtail.models import BootstrapTranslatableMixin, Orderable, Page, ParentalKey, StreamField, TranslatableMixin,forms,slugify
from wagtail.admin.panels import FieldPanel, InlinePanel, MultipleChooserPanel,MultiFieldPanel,FieldRowPanel, TitleFieldPanel, WagtailAdminPageForm
from wagtail.images import get_image_model_string
from modelcluster.contrib.taggit import ClusterTaggableManager
from taggit.models import  ItemBase
from django.contrib.contenttypes.fields import GenericRelation
from wagtail.admin.panels import PublishingPanel
from wagtail.models import DraftStateMixin, LockableMixin, RevisionMixin, WorkflowMixin
from modelcluster.models import ClusterableModel, ParentalManyToManyField
from wagtail.search import index
from wagtail.admin.panels import PublishingPanel
from wagtail.snippets.models import register_snippet
from wagtail.snippets.views.chooser import SnippetChosenMultipleView
from wagtail.snippets.views.snippets import SnippetViewSet


dictRelativeNames = {
        "excluidos": "No Incluye",
        "incluidos": "Incluye",
        "galleryTour": "Galeria de Imagenes",
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
        if cleaned_data.get("action-publish") and cleaned_data.get('itinerario') is None:
            raise forms.ValidationError({"itinerario": "Error debes poner el itinerario"})
        if cleaned_data.get("action-publish") and cleaned_data.get('tourDestino') is None:
            raise forms.ValidationError({"tourDestino": "Error debes poner a que destino pertenece"})
        return cleaned_data


class Tour(Page):
    # tags = TaggableManager(through=TaggedTour)
    tourDestino = models.ForeignKey("home.Destino",on_delete=models.CASCADE, related_name="tour_foreign",verbose_name="Destino",null=True,blank=True)
    categories = ParentalManyToManyField("home.TourCategory",null=True,blank=True)
    background = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Imagen de Fondo"
    )
    featuredImage = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Thumbnail"
    )
    precio = models.DecimalField(max_digits=6, decimal_places=2,verbose_name="Precio",null=True,blank=True)
    duracion = models.CharField( max_length=12,verbose_name="Duracion del Tour, 0 o 1 = no aparecera",null=True,blank=True)
    linkWord = models.CharField( max_length=100,verbose_name="Link Word",null=True,blank=True)
    linkPdf = models.CharField( max_length=100,verbose_name="Link Pdf",null=True,blank=True)
    itinerario = RichTextField(null=True,blank=True)
    base_form_class = CustomValidateForm
    def __str__(self):
        return self.title

    content_panels =Page.content_panels +  [
        FieldPanel('featuredImage',help_text ="Dimensiones max: 425 x 585. px"),
        MultiFieldPanel([
        FieldPanel('background',help_text ="Dimensiones max: 1445 x 1030. px"),
        FieldRowPanel([FieldPanel('linkWord'),FieldPanel('linkPdf')])],heading="Parte Superior"),
        FieldPanel('itinerario'),
        MultiFieldPanel([
        FieldRowPanel([MultiFieldPanel([FieldPanel('precio'),FieldPanel('duracion'),InlinePanel('incluidos', label="Incluye") ,InlinePanel('excluidos', label="No Incluye")]),
                       MultiFieldPanel([MultipleChooserPanel('galleryTour', label="Galeria de Imagenes",chooser_field_name="image")])])],heading="Parte Intermedia"),
        FieldPanel('tourDestino'),
        FieldPanel('categories'),
    ]

    parent_page_types = ['home.Global']

    api_fields = [
        APIField('background'),
        APIField('featuredImage'),
        APIField('linkWord'),
        APIField('linkPdf'),
        APIField('precio'),
        APIField('duracion'),
        APIField('excluidos'),
        APIField('incluidos'),
        APIField('itinerario'),
        APIField('galleryTour'),
        APIField('tourDestino')
    ]

    page_description = "Informacion del Tour"
    def clean(self):
        super().clean()
        new_slug = slugify(self.title)
        print(new_slug)
        if self.slug != new_slug:
            self.slug = new_slug

    def save(self, *args, **kwargs):
        self.full_clean()
        super().save(*args, **kwargs)
    

class ExcluidoItemPaquete(Orderable):
    page = ParentalKey(Tour, on_delete=models.CASCADE , related_name = 'excluidos')
    item = models.CharField( max_length=80,verbose_name="Item")
    panels = [
            FieldPanel('item')
            ]
    api_fields = [
            APIField('item')
            ]

class IncluidoItemPaquete(Orderable):
    page = ParentalKey(Tour, on_delete=models.CASCADE , related_name = 'incluidos')
    item = models.CharField( max_length=80,verbose_name="Item")
    panels = [
            FieldPanel('item')
            ]
    api_fields = [
            APIField('item')
            ]

class GalleryCarousel(Orderable):
    page = ParentalKey(Tour, on_delete=models.CASCADE , related_name = 'galleryTour')
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
