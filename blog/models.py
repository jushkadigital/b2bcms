from django.core.exceptions import ValidationError
from django.db import models
from django.forms import CheckboxSelectMultiple
from wagtail.admin.ui.tables import UpdatedAtColumn
from wagtail.api.v2.views import APIField
from wagtail.models import Page, slugify
from wagtail.snippets.models import register_snippet
from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel
from wagtail.admin.panels import FieldPanel, InlinePanel, ObjectList, TabbedInterface, WagtailAdminPageForm
from wagtail.models import Orderable
from wagtail.fields import RichTextField
from wagtail.admin.panels import FieldPanel, MultiFieldPanel, InlinePanel
from modelcluster.fields import ParentalKey, ParentalManyToManyField
from wagtail.models import  Page, ParentalKey, StreamField, TranslatableMixin, ValidationError, forms, slugify
from wagtail.images import get_image_model_string
from django.db import models
from wagtail.snippets.views.snippets import SnippetViewSet


class CategoryBlog(ClusterableModel):
    name = models.CharField(
        max_length=80, unique=True, verbose_name=('Category Name'))
    parent = models.ForeignKey(
        'self',on_delete=models.CASCADE , blank=True, null=True, related_name="children"
    )
    description = models.CharField(max_length=500, blank=True)

    class Meta:
        ordering = ['name']
        verbose_name = ("Category")
        verbose_name_plural = ("Categories")

    panels = [
        FieldPanel('name'),
        FieldPanel('parent'),
        FieldPanel('description'),
    ]

    def __str__(self):
        return self.name

    def clean(self):
        if self.parent:
            parent = self.parent
            if self.parent == self:
                raise forms.ValidationError('Parent category cannot be self.')
            if parent.parent and parent.parent == self:
                raise forms.ValidationError('Cannot have circular Parents.')

    # def save(self, *args, **kwargs):
    #     if not self.slug:
    #         self.slug = slugify(self.name)
    #     return super(CategoryBlog, self).save(*args, **kwargs)


class CategoryBlogViewSet(SnippetViewSet):
    model= CategoryBlog
    icon = "tag"
    list_display = ["name",UpdatedAtColumn()]
    list_per_page = 50
    add_to_admin_menu = True
    menu_order = 500
    menu_label = "CategoryBlog"
    inspect_view_enabled = True
    admin_url_namespace = "categoryBlog_views"
    base_url_path = "internal/categoryBlog"
    edit_handler = TabbedInterface([
        ObjectList([FieldPanel('name'),FieldPanel('description'),FieldPanel("parent")],heading="Category")
        ])

register_snippet(CategoryBlogViewSet)



class CategoryBlogPage(models.Model):
    category = ParentalKey('CategoryBlog', verbose_name=('Category'))
    page = ParentalKey('Blog')
    panels = [
        FieldPanel('category'),
    ]

class CustomValidateForm(WagtailAdminPageForm):
    """
    Custom Form for validations only in Publish Mode
    """

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields["action-publish"] = forms.CharField(required=False, widget=forms.HiddenInput())

    def clean(self):
        cleaned_data = super().clean()
        if cleaned_data.get("action-publish") and cleaned_data.get('body') is None:
            raise forms.ValidationError({"body": "Debes poner contenido en el cuerpo"})
        if cleaned_data.get("action-publish") and cleaned_data.get('date') is None:
            raise forms.ValidationError({"date": "Debes poner uno fecha de Publicacion"})
        return cleaned_data


class Blog(Page):
    categories = models.ManyToManyField(CategoryBlog, through=CategoryBlogPage, blank=True,null=True)
    body = RichTextField(blank=True,null=True)
    date = models.DateField(verbose_name="Fecha para mostrar en el Post",blank=True,null=True)
    background = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Imagen de Fondo"
    )
    featuredImage = models.ForeignKey(
        get_image_model_string(),null=True,blank=True, on_delete=models.SET_NULL, related_name='+',verbose_name="Thumbnail"
    )
    parent_page_types = ['home.Global']
    base_form_class = CustomValidateForm

    content_panels = Page.content_panels + [
        FieldPanel('categories'),
        FieldPanel('background'),
        FieldPanel('featuredImage'),
        FieldPanel('body'),
        FieldPanel('date'),
    ]

    api_fields = [
        APIField('body'),
        APIField('background'),
        APIField('featuredImage'),
        APIField('date'),
    ]


