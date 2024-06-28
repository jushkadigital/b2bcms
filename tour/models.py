from django.db import models
from wagtail.admin.ui.tables import UpdatedAtColumn
from wagtail.api.v2.filters import TaggableManager
from wagtail.api.v2.views import APIField
from wagtail.blocks import RichTextBlock
from wagtail.fields import RichTextField
from wagtail.models import Orderable, Page, ParentalKey, StreamField
from wagtail.admin.panels import FieldPanel, InlinePanel, MultipleChooserPanel,MultiFieldPanel,FieldRowPanel, TitleFieldPanel
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


# class TaggedTour(ItemBase):
#     tag = models.ForeignKey(
#         "home.Destino", related_name="tagged_blogs", on_delete=models.CASCADE
#     )
#     content_object = ParentalKey(
#         to='tour.Tour',
#         on_delete=models.CASCADE,
#         related_name='tagged_items'
#     )

class Tour(WorkflowMixin, DraftStateMixin, LockableMixin, RevisionMixin, ClusterableModel):
    # tags = TaggableManager(through=TaggedTour)
    tour = models.ForeignKey("home.Destino",on_delete=models.CASCADE, related_name="tour_foreign",verbose_name="Destino")
    categories = ParentalManyToManyField("home.TourCategory",blank=True)
    title = models.CharField( max_length=100)
    background = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Imagen de Fondo"
    )
    featuredImage = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Thumbnail"
    )
    precio = models.DecimalField(max_digits=6, decimal_places=2,verbose_name="Precio")
    linkWord = models.CharField( max_length=100,verbose_name="Link Word")
    linkPdf = models.CharField( max_length=100,verbose_name="Link Pdf")
    linkFlyer = models.CharField( max_length=100,verbose_name="Link Flyer")
    itinerario = RichTextField()
    _revisions = GenericRelation("wagtailcore.Revision", related_query_name="tour")
    workflow_states = GenericRelation(
        "wagtailcore.WorkflowState",
        content_type_field="base_content_type",
        object_id_field="object_id",
        related_query_name="tour",
        for_concrete_model=False,
    )
    @property
    def revisions(self):
        # Some custom logic here if necessary
        return self._revisions   
    
    panels = [
        TitleFieldPanel('title', placeholder="Titulo del Tour",help_text="El titulo sera incluido en la parte superior"),
        FieldPanel('featuredImage'),
        MultiFieldPanel([
        FieldPanel('background'),
        FieldRowPanel([FieldPanel('linkWord'),FieldPanel('linkPdf'),FieldPanel('linkFlyer')])],heading="Parte Superior"),
        FieldPanel('itinerario'),
        MultiFieldPanel([
        FieldRowPanel([MultiFieldPanel([FieldPanel('precio'),InlinePanel('excluidos', label="No Incluye"),InlinePanel('incluidos', label="Incluye") ]),
                       MultiFieldPanel([MultipleChooserPanel('galleryTour', label="Galeria de Imagenes",chooser_field_name="image")])])],heading="Parte Intermedia"),
        FieldPanel('tour'),
        FieldPanel('categories'),
        PublishingPanel()
    ]

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
        APIField('galleryPaquete'),
        APIField('tour')
    ]

    page_description = "Informacion del paquete"


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

## Register Snippet

class TourViewSet(SnippetViewSet):
    model = Tour
    icon = "tag"
    list_display = ["title", "featuredImage", UpdatedAtColumn()]
    list_per_page = 50
    add_to_admin_menu = True
    menu_order = 200
    copy_view_enabled = False
    inspect_view_enabled = True
    admin_url_namespace = "tour_views"
    base_url_path = "snippets/tour"
    # alternatively, you can use the following instead of filterset_class
    # list_filter = ["shirt_size"]
    # or
    # list_filter = {"shirt_size": ["exact"], "name": ["icontains"]}
    # edit_handler = TabbedInterface([
    #     ObjectList([FieldPanel("name"),FieldPanel("background")], heading="Informacion"),
    # ])

register_snippet(TourViewSet)


