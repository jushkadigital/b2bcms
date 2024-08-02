from django.db import models
from wagtail.admin.ui.tables import UpdatedAtColumn
from wagtail.api.v2.filters import TaggableManager
from wagtail.api.v2.views import APIField
from wagtail.blocks import RichTextBlock
from wagtail.fields import RichTextField
from wagtail.models import BootstrapTranslatableMixin, Orderable, Page, ParentalKey, StreamField, TranslatableMixin,forms
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
from django.utils.text import slugify


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

        print(cleaned_data)

        for key,val in (self.formsets.items()):
            if cleaned_data.get("action-publish") and len(val.forms) == 0 and key != "comments":
                raise forms.ValidationError(f"Error debe haber almenos uno en {dictRelativeNames[key]}")
        if cleaned_data.get("action-publish") and cleaned_data.get('background') is None:
            raise forms.ValidationError({"background": "Error debes poner la imagen de fondo"})
        if cleaned_data.get("action-publish") and cleaned_data.get('featuredImage') is None:
            raise forms.ValidationError({"featuredImage": "Error debes poner el Thumbnail"})
        if cleaned_data.get("action-publish") and cleaned_data.get('precio') is None:
            raise forms.ValidationError({"precio": "Error debes poner el precio"})
        if cleaned_data.get("action-publish") and cleaned_data.get('linkWord') is None:
            raise forms.ValidationError({"linkWord": "Error debes poner el link"})
        if cleaned_data.get("action-publish") and cleaned_data.get('linkPdf') is None:
            raise forms.ValidationError({"linkPdf": "Error debes poner el link"})
        if cleaned_data.get("action-publish") and cleaned_data.get('linkFlyer') is None:
            raise forms.ValidationError({"linkFlyer": "Error debes poner el link"})
        if cleaned_data.get("action-publish") and cleaned_data.get('linkFlyer') is None:
            raise forms.ValidationError({"linkFlyer": "Error debes poner el link"})
        if cleaned_data.get("action-publish") and cleaned_data.get('itinerario') is None:
            raise forms.ValidationError({"itinerario": "Error debes poner el itinerario"})
        if cleaned_data.get("action-publish") and cleaned_data.get('tourDestino') is None:
            raise forms.ValidationError({"tourDestino": "Error debes poner a que destino pertenece"})
        # if cleaned_data.get("action-publish") and len(cleaned_data.get('categories')) == 0:
        #     raise forms.ValidationError({"categories": "Error debes poner al menos una Categoria"})
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
    linkWord = models.CharField( max_length=100,verbose_name="Link Word",null=True,blank=True)
    linkPdf = models.CharField( max_length=100,verbose_name="Link Pdf",null=True,blank=True)
    linkFlyer = models.CharField( max_length=100,verbose_name="Link Flyer",null=True,blank=True)
    itinerario = RichTextField(null=True,blank=True)
    base_form_class = CustomValidateForm
    def __str__(self):
        return self.title

    content_panels =Page.content_panels +  [
        FieldPanel('featuredImage'),
        MultiFieldPanel([
        FieldPanel('background'),
        FieldRowPanel([FieldPanel('linkWord'),FieldPanel('linkPdf'),FieldPanel('linkFlyer')])],heading="Parte Superior"),
        FieldPanel('itinerario'),
        MultiFieldPanel([
        FieldRowPanel([MultiFieldPanel([FieldPanel('precio'),InlinePanel('excluidos', label="No Incluye"),InlinePanel('incluidos', label="Incluye") ]),
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
        APIField('linkFlyer'),
        APIField('precio'),
        APIField('excluidos'),
        APIField('incluidos'),
        APIField('itinerario'),
        APIField('galleryTour'),
        APIField('tourDestino')
    ]

    page_description = "Informacion del Tour"
    def save(self, *args, **kwargs):
        if not self.slug or self.title != self._loaded_title:
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._loaded_title = self.title


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
