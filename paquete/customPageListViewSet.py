from django.urls import path

from wagtail.admin.views.pages.choose_parent import ChooseParentView
from wagtail.admin.views.pages.listing import IndexView
from wagtail.models import Page


from wagtail.admin.viewsets.base import ViewSet


from django.contrib.admin.utils import quote
from django.shortcuts import redirect
from django.urls import reverse
from django.utils.functional import cached_property
from django.utils.text import capfirst
from django.utils.translation import gettext as _
from django.utils.translation import gettext_lazy
from django.views.generic import FormView

from wagtail.admin.forms.pages import ParentChooserForm
from wagtail.admin.views.generic.base import WagtailAdminTemplateMixin
from wagtail.models import Page

from django import forms
from django.conf import settings
from django.utils.translation import gettext as _
from django.utils.translation import ngettext

from wagtail.admin import widgets
from wagtail.models import Page, PageViewRestriction


class MyParentChooserForm(forms.Form):
    def __init__(self, child_page_type, user, default_parent_page=None, *args, **kwargs):
        self.child_page_type = child_page_type
        self.user = user
        super().__init__(*args, **kwargs)

        initial_value = {'parent_page': default_parent_page} if default_parent_page else {}

        self.fields["parent_page"] = forms.ModelChoiceField(
            queryset=Page.objects.all(),
            widget=widgets.AdminPageChooser(
                target_models=self.child_page_type.allowed_parent_page_models(),
                can_choose_root=True,
                user_perms="add_subpage",
            ),
            initial=default_parent_page,
            label=_("Parent page"),
            help_text=_("The new page will be a child of this given parent page."),
        )
        if initial_value:
            self.initial.update(initial_value)

    def clean_parent_page(self):
        parent_page = self.cleaned_data["parent_page"].specific_deferred
        if not parent_page.permissions_for_user(self.user).can_add_subpage():
            raise forms.ValidationError(
                _('You do not have permission to create a page under "%(page_title)s".')
                % {"page_title": parent_page.get_admin_display_title()}
            )
        if not self.child_page_type.can_create_at(parent_page):
            raise forms.ValidationError(
                _(
                    'You cannot create a page of type "%(page_type)s" under "%(page_title)s".'
                )
                % {
                    "page_type": self.child_page_type.get_verbose_name(),
                    "page_title": parent_page.get_admin_display_title(),
                }
            )
        return parent_page


class MyChooseParentView(WagtailAdminTemplateMixin, FormView):
    template_name = "wagtailadmin/pages/choose_parent.html"
    model = Page
    index_url_name = None
    page_title = gettext_lazy("Choose parent")

    def get_form(self):
        pag = Page.objects.get(id=4)
        if self.request.method == "POST":
            return MyParentChooserForm(self.model, self.request.user,pag ,self.request.POST)
        return MyParentChooserForm(self.model, self.request.user,pag)

    def get_index_url(self):
        if self.index_url_name:
            return reverse(self.index_url_name)

    def get_breadcrumbs_items(self):
        items = []
        index_url = self.get_index_url()
        if index_url:
            items.append(
                {
                    "url": index_url,
                    "label": capfirst(self.model._meta.verbose_name_plural),
                }
            )
        items.append(
            {
                "url": "",
                "label": self.get_page_title(),
                "sublabel": self.get_page_subtitle(),
            }
        )

        return self.breadcrumbs_items + items

    def get_page_subtitle(self):
        return self.model.get_verbose_name()

    @cached_property
    def submit_button_label(self):
        return _("Create a new %(model_name)s") % {
            "model_name": self.model._meta.verbose_name,
        }

    def form_valid(self, form):
        model_opts = self.model._meta
        default_id = 4
        # parent_id = quote(form.cleaned_data["parent_page"].pk)
        parent_id = quote(default_id)
        return redirect(
            "wagtailadmin_pages:add",
        model_opts.app_label,
        model_opts.model_name,
            parent_id,
        )

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["media"] = context["form"].media
        context["submit_button_label"] = self.submit_button_label
        return context

class MyPageListingViewSet(ViewSet):
    """
    A viewset to present a flat listing of all pages of a specific type.
    All attributes and methods from :class:`~wagtail.admin.viewsets.base.ViewSet`
    are available.
    For more information on how to use this class, see :ref:`custom_page_listings`.
    """

    #: The view class to use for the index view; must be a subclass of ``wagtail.admin.views.pages.listing.IndexView``.
    index_view_class = IndexView
    #: The view class to use for choosing the parent page when creating a new page of this page type.
    choose_parent_view_class = MyChooseParentView
    #: Required; the page model class that this viewset will work with.
    model = Page
    #: A list of ``wagtail.admin.ui.tables.Column`` instances for the columns in the listing.
    columns = IndexView.columns
    #: A subclass of ``wagtail.admin.filters.WagtailFilterSet``, which is a
    #: subclass of `django_filters.FilterSet <https://django-filter.readthedocs.io/en/stable/ref/filterset.html>`_.
    #: This will be passed to the ``filterset_class`` attribute of the index view.
    filterset_class = IndexView.filterset_class

    def get_common_view_kwargs(self, **kwargs):
        return super().get_common_view_kwargs(
            **{
                "_show_breadcrumbs": True,
                "header_icon": self.icon,
                "model": self.model,
                "index_url_name": self.get_url_name("index"),
                "add_url_name": self.get_url_name("choose_parent"),
                **kwargs,
            }
        )

    def get_index_view_kwargs(self, **kwargs):
        return {
            "index_results_url_name": self.get_url_name("index_results"),
            "columns": self.columns,
            "filterset_class": self.filterset_class,
            **kwargs,
        }

    def get_choose_parent_view_kwargs(self, **kwargs):
        return kwargs

    @property
    def index_view(self):
        return self.construct_view(
            self.index_view_class, **self.get_index_view_kwargs()
        )

    @property
    def index_results_view(self):
        return self.construct_view(
            self.index_view_class, **self.get_index_view_kwargs(), results_only=True
        )

    @property
    def choose_parent_view(self):
        return self.construct_view(
            self.choose_parent_view_class, **self.get_choose_parent_view_kwargs()
        )

    def get_urlpatterns(self):
        return [
            path("", self.index_view, name="index"),
            path("results/", self.index_results_view, name="index_results"),
            path("choose_parent/", self.choose_parent_view, name="choose_parent"),
        ]



