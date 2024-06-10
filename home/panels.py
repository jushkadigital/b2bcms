from wagtail.admin.panels import Component,Panel
from django.utils.safestring import mark_safe
from django.template.loader import render_to_string


def getEditPage(url,id):
    final = f"{url}/cms/pages/{id}/edit"
    return final

class ListChildsPanel(Panel):
    def __init__(self, name,template="ChildrenPanel/children_panel.html", **kwargs):
        super().__init__(**kwargs)
        self.name = name
        self.template = template

    def clone_kwargs(self):
        kwargs = super().clone_kwargs()
        del kwargs["help_text"]
        kwargs.update(
            name = self.name,
            template=self.template,
        )
        return kwargs

    class BoundPanel(Panel.BoundPanel):
        def __init__(self, panel, instance, request, form, prefix):
            super().__init__(panel, instance, request, form, prefix)
            self.template_name = self.panel.template
            self.name = self.panel.name
            
        def get_context_data(self, parent_context):
            context = super().get_context_data(parent_context)
            # print([i.get_full_url() for i in self.instance.get_children().live().specific()[0].get_children().specific()])
            firstPath = self.instance.get_children().live().specific()
            context['chill'] =([{'link':getEditPage(i.get_url_parts()[1],i.id),'title':i.title} for i in firstPath[0].get_children().specific()])
            context['heading'] =firstPath[0].title
            return context


class ListSnippetPanel(Panel):
    def __init__(self, modell,template="ChildrenPanel/snippet_panel.html", **kwargs):
        super().__init__(**kwargs)
        self.modell = modell
        self.template = template

    def clone_kwargs(self):
        kwargs = super().clone_kwargs()
        del kwargs["help_text"]
        kwargs.update(
            modell = self.modell,
            template=self.template,
        )
        return kwargs

    class BoundPanel(Panel.BoundPanel):
        def __init__(self, panel, instance, request, form, prefix):
            super().__init__(panel, instance, request, form, prefix)
            self.template_name = self.panel.template
            self.modell = self.panel.modell
            
        def get_context_data(self, parent_context):
            context = super().get_context_data(parent_context)
            # print([i.get_full_url() for i in self.instance.get_children().live().specific()[0].get_children().specific()])
            # firstPath = self.instance.get_children().live().specific()
            # context['chill'] =([{'link':getEditPage(i.get_url_parts()[1],i.id),'title':i.title} for i in firstPath[0].get_children().specific()])
            print(self.modell.objects.all())
            context['chill'] = self.modell.objects.all()
            context['heading'] = self.modell.__name__
            return context


