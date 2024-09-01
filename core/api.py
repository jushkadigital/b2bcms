# api.py

from wagtail.api.v2.views import BaseAPIViewSet, PagesAPIViewSet
from wagtail.api.v2.router import WagtailAPIRouter
from rest_framework.renderers import JSONRenderer
from blog.models import Blog
from paquete.models import Paquete
from home.models import BlogPage, Contacto, DataGeneral, Informacion, Destino, Inicio, Nosotros, SalidasPage
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

class CustomBlogApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "blog"
    model = Blog
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
        # AlgoRecomendationsFilterPaquete
            ]


class CustomInicioApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "inicios"
    model = Inicio

class CustomNosotrosApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "nosotros"
    model = Nosotros

class CustomBlogPageApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "blogPage"
    model = BlogPage


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
api_router.register_endpoint('pages/blog', CustomBlogApiViewSet)
api_router.register_endpoint('pages/salidasGrupales', CustomSalidasGrupalesApiViewSet)
api_router.register_endpoint('pages/inicio', CustomInicioApiViewSet)
api_router.register_endpoint('pages/nosotros', CustomNosotrosApiViewSet)
api_router.register_endpoint('pages/contactar', CustomContactoApiViewSet)
api_router.register_endpoint('pages/blogPage', CustomBlogPageApiViewSet)
api_router.register_endpoint('pages/salidasPage', CustomSalidasPageApiViewSet)
api_router.register_endpoint('images', ImagesAPIViewSet)
api_router.register_endpoint('snippets/destino', CustomSnippetDestinoApiViewSet)
api_router.register_endpoint('snippets/dataNumeros', CustomSnippetInformacionApiViewSet)
api_router.register_endpoint('snippets/dataGeneral', CustomSnippetDataGeneralApiViewSet)
