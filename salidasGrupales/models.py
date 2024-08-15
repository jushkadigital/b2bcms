from django.db import models
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
from wagtail.admin.panels import PageChooserPanel
from paquete.models import Paquete
from rest_framework.fields import Field

class LinkedPageSerializer(Field):
    def to_representation(self, page):
        # print((page.featuredImage.serializable_value()))
        return {
                "title": page.title,
                "duration": page.duracion,
                # "ii": page.featuredImage,
                'slug': page.slug
                }


class SalidasGrupales(Page):
    linkedPage = models.ForeignKey(
        Paquete,  # Relación de ForeignKey a BlogPage
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='linked_custom_pages'  # Relación inversa
    )
    date = models.DateField(verbose_name="Fecha de Salida del Grupo")
    content_panels =Page.content_panels +[
        PageChooserPanel('linkedPage','paquete.Paquete'),
        FieldPanel('date'),
            ]

    parent_page_types = ['home.Global']
    api_fields = [
        APIField('linkedPage',serializer=LinkedPageSerializer()),
        APIField('date'),
        ]



# Create your models here.
