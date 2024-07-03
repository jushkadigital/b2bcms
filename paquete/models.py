from django.db import models
from wagtail import blocks
from wagtail.admin.ui.tables import UpdatedAtColumn
from wagtail.api.v2.views import APIField
from wagtail.models import BootstrapTranslatableMixin, Orderable, Page, ParentalKey, StreamField, TranslatableMixin
from wagtail.fields import RichTextField
from wagtail.admin.panels import FieldPanel, InlinePanel, MultipleChooserPanel,MultiFieldPanel,FieldRowPanel, ObjectList, TabbedInterface, TitleFieldPanel
from wagtail.images import get_image_model_string
# Create your models here.
from wagtail.snippets.models import register_snippet
from wagtail.snippets.views.snippets import SnippetViewSet
from wagtail_cloudinary_image.abstract import AbstractRendition,AbstractCloudinaryImage,AbstractCloudinaryRendition
from wagtail.images.blocks import ImageChooserBlock
from wagtail.admin.forms import WagtailAdminPageForm
from wagtail.admin.viewsets.model import ModelViewSet
from django.contrib.contenttypes.fields import GenericRelation
from wagtail.admin.panels import PublishingPanel
from wagtail.models import DraftStateMixin, LockableMixin, RevisionMixin, WorkflowMixin
from modelcluster.models import ClusterableModel
from wagtail.search import index
from wagtail.admin.panels import PublishingPanel

class CloudinaryImage(AbstractCloudinaryImage):
    pass
#     image = models.ForeignKey(
#             CloudinaryImage, on_delete=models.CASCADE, related_name="renditions"
#         )

class CloudinaryRendition(AbstractCloudinaryRendition):
    image = models.ForeignKey(
            CloudinaryImage, on_delete=models.CASCADE, related_name="renditions"
        )
    


# class IndexPaquete(Page):
#     # intro = models.CharField(max_length=100)
#     parent_page_types = ['home.Inicio']
#     subpage_types = ['paquete.Paquete']
#     max_count_per_parent = 1


# class CloudinaryRendition(AbstractCloudinaryRendition):
#     image = models.ForeignKey(
#             CloudinaryImage, on_delete=models.CASCADE, related_name="renditions"
#         )


class Paquete(TranslatableMixin, WorkflowMixin, DraftStateMixin, LockableMixin, RevisionMixin, ClusterableModel):
    title = models.CharField( max_length=100)
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
    _revisions = GenericRelation("wagtailcore.Revision", related_query_name="paquete")
    workflow_states = GenericRelation(
        "wagtailcore.WorkflowState",
        content_type_field="base_content_type",
        object_id_field="object_id",
        related_query_name="paquete",
        for_concrete_model=False,
    )
    @property
    def revisions(self):
        # Some custom logic here if necessary
        return self._revisions   
    
    def __str__(self):
        return self.title

    panels = [
        TitleFieldPanel('title', placeholder="Titulo del Paquete",help_text="El titulo sera incluido en la parte superior"),
        FieldPanel('featuredImage',help_text ="Dimensiones max: 425 x 585. px"),
        MultiFieldPanel([
        FieldPanel('background',help_text ="Dimensiones max: 1445 x 1030. px"),
        FieldPanel('duracion',help_text="Formato: 10-8 = 10Dias/8noches"),
        FieldRowPanel([FieldPanel('linkWord'),FieldPanel('linkPdf'),FieldPanel('linkFlyer')])],heading="Parte Superior"),

        MultiFieldPanel([
        FieldRowPanel([MultiFieldPanel([FieldPanel('precio'),InlinePanel('excluidos', label="No Incluye"),InlinePanel('incluidos', label="Incluye") ]),
                       MultiFieldPanel([MultipleChooserPanel('galleryPaquete', label="Galeria de Imagenes",chooser_field_name="image"),InlinePanel('dias',label="dia")])])],heading="Parte Intermedia"),
        PublishingPanel(),
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
        FieldPanel('image',help_text ="Dimensiones max: 279 x 279. px"),
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

## Register Snippet

class PaqueteViewSet(SnippetViewSet):
    model = Paquete
    icon = "tag"
    list_display = ["title", "featuredImage", UpdatedAtColumn()]
    list_per_page = 50
    add_to_admin_menu = True
    menu_order = 250
    copy_view_enabled = False
    inspect_view_enabled = True
    admin_url_namespace = "paquete_views"
    base_url_path = "snippets/paquete"
    # alternatively, you can use the following instead of filterset_class
    # list_filter = ["shirt_size"]
    # or
    # list_filter = {"shirt_size": ["exact"], "name": ["icontains"]}
    
register_snippet(PaqueteViewSet)


