# api.py

from wagtail.api.v2.views import BaseAPIViewSet, PagesAPIViewSet
from wagtail.api.v2.router import WagtailAPIRouter
from rest_framework.renderers import JSONRenderer
from paquete.models import Paquete
from home.models import Contacto, DataGeneral, Informacion, Destino, Inicio, Nosotros, SalidasPage
from wagtail.images.api.v2.views import ImagesAPIViewSet

from salidasGrupales.models import SalidasGrupales
from tour.models import Tour
from wagtail.api.v2.utils import (
    BadRequestError,
    page_models_from_string,
)
from wagtail.models import Page 
from wagtail.search.query import Phrase
from .filterBackendsApi import AlgoRecomendationsFilterTour,AlgoRecomendationsFilterPaquete

# Create the router. "wagtailapi" is the URL namespace

api_router = WagtailAPIRouter('wagtailapi')


# Add the three endpoints using the "register_endpoint" method.
# The first parameter is the name of the endpoint (such as pages, images). This
# is used in the URL of the endpoint
# The second parameter is the endpoint class that handles the requests

class CustomSalidasGrupalesApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "saildasGrupales"
    model = SalidasGrupales

class CustomTourApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "tour"
    model = Tour 
    filter_backends = PagesAPIViewSet.filter_backends + [
        AlgoRecomendationsFilterTour
            ]

    known_query_parameters = BaseAPIViewSet.known_query_parameters.union(
        [
            "type",
            "child_of",
            "ancestor_of",
            "descendant_of",
            "translation_of",
            "locale",
            "site",
            "sss",
            "sender"
        ]
    )
    
# class CustomTourApiViewSet(PagesAPIViewSet):
#     renderer_classes = [JSONRenderer]
#     name = "tour"
#     model = Tour 

class CustomPaqueteApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "paquete"
    model = Paquete
    known_query_parameters = BaseAPIViewSet.known_query_parameters.union(
        [
            "type",
            "child_of",
            "ancestor_of",
            "descendant_of",
            "translation_of",
            "locale",
            "site",
            "sss",
            "sender"
        ]
    )
    filter_backends = PagesAPIViewSet.filter_backends + [
        AlgoRecomendationsFilterPaquete
            ]

    # def get_queryset(self):
    #     request = self.request

    #     # Allow pages to be filtered to a specific type
    #     try:
    #         models_type = request.GET.get("type", None)
    #         models = models_type and page_models_from_string(models_type) or []
    #     except (LookupError, ValueError):
    #         raise BadRequestError("type doesn't exist")

    #     if not models:
    #         print("here")
    #         if self.model == Page:
    #             return self.get_base_queryset()
    #         else:
    #             algoParameter = request.GET.get("sss",None)
    #             if algoParameter is None:
    #                 return self.model.objects.filter(
    #                 pk__in=self.get_base_queryset().values_list("pk", flat=True)
    #             )
    #             else:
    #                 try:
    #                     senderId = request.GET.get("sender",None)
    #                     senderId = int(senderId)
    #                 except (LookupError, ValueError):
    #                     raise BadRequestError("sender doesn't exist")
    #                 if algoParameter == "basic":
    #                     return self.model.objects.filter(
    #                     pk__in=self.get_base_queryset().exclude(pk=senderId).values_list("pk", flat=True)
    #                     ).order_by('?')[:1]
    #                 elif algoParameter == "campaing":
    #                     return self.model.objects.filter(
    #                     pk__in=self.get_base_queryset().filter(paquete__isCampaing=True).values_list("pk", flat=True)
    #                     )
    #                 elif algoParameter == "nocampaing":
    #                     return self.model.objects.filter(
    #                     pk__in=self.get_base_queryset().filter(paquete__isCampaing=False).values_list("pk", flat=True)
    #                     )

    #                 else:
    #                     return self.model.objects.filter(
    #                     pk__in=self.get_base_queryset().values_list("pk", flat=True)
    #                     )


    #     elif len(models) == 1:
    #         # If a single page type has been specified, swap out the Page-based queryset for one based on
    #         # the specific page model so that we can filter on any custom APIFields defined on that model
    #         return models[0].objects.filter(
    #             pk__in=self.get_base_queryset().values_list("pk", flat=True)
    #         )

    #     else:  # len(models) > 1
    #         return self.get_base_queryset().type(*models)


class CustomInicioApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "inicios"
    model = Inicio

class CustomNosotrosApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "nosotros"
    model = Nosotros

class CustomContactoApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "contacto"
    model = Contacto

class CustomSalidasPageApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "salidasPage"
    model = SalidasPage

class CustomSnippetDestinoApiViewSet(BaseAPIViewSet):
    body_fields = BaseAPIViewSet.body_fields + ["name", "background","backgroundMobile","backgroundDestinoPage"]
    renderer_classes = [JSONRenderer]
    name = "destinos"
    model = Destino

class CustomSnippetInformacionApiViewSet(BaseAPIViewSet):
    body_fields = BaseAPIViewSet.body_fields + ["name", "image","numero","desc","link"]
    renderer_classes = [JSONRenderer]
    name = "informacion"
    model = Informacion
class CustomSnippetDataGeneralApiViewSet(BaseAPIViewSet):
    body_fields = BaseAPIViewSet.body_fields + ["razonSocial", "direccion","telefonos","email","whatsapp","youtube","instagram","facebook","tiktok"]
    renderer_classes = [JSONRenderer]
    name = "dataGeneral"
    model = DataGeneral



api_router.register_endpoint('pages/paquete', CustomPaqueteApiViewSet)
api_router.register_endpoint('pages/tour', CustomTourApiViewSet)
api_router.register_endpoint('pages/salidasGrupales', CustomSalidasGrupalesApiViewSet)
api_router.register_endpoint('pages/inicio', CustomInicioApiViewSet)
api_router.register_endpoint('pages/nosotros', CustomNosotrosApiViewSet)
api_router.register_endpoint('pages/contactar', CustomContactoApiViewSet)
api_router.register_endpoint('pages/salidasPage', CustomSalidasPageApiViewSet)
api_router.register_endpoint('images', ImagesAPIViewSet)
api_router.register_endpoint('snippets/destino', CustomSnippetDestinoApiViewSet)
api_router.register_endpoint('snippets/dataNumeros', CustomSnippetInformacionApiViewSet)
api_router.register_endpoint('snippets/dataGeneral', CustomSnippetDataGeneralApiViewSet)
