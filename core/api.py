# api.py

from wagtail.api.v2.views import BaseAPIViewSet, PagesAPIViewSet
from wagtail.api.v2.router import WagtailAPIRouter
from rest_framework.renderers import JSONRenderer
from paquete.models import Paquete
from home.models import DataNumero, Destino, Inicio, Nosotros
from wagtail.images.api.v2.views import ImagesAPIViewSet
# Create the router. "wagtailapi" is the URL namespace

api_router = WagtailAPIRouter('wagtailapi')


# Add the three endpoints using the "register_endpoint" method.
# The first parameter is the name of the endpoint (such as pages, images). This
# is used in the URL of the endpoint
# The second parameter is the endpoint class that handles the requests


class CustomPagesAPIViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "paquetes"
    model = Paquete
    # nested_default_fields = BaseAPIViewSet.nested_default_fields + [
    #     "title",
    #     "precio"
    # ]
    # body_fields = BaseAPIViewSet.body_fields + [
    #     "title",
    #     "precio",
    # ]

class CustomInicioApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "inicios"
    model = Inicio

class CustomNosotrosApiViewSet(PagesAPIViewSet):
    renderer_classes = [JSONRenderer]
    name = "nosotros"
    model = Nosotros

class CustomSnippetDestinoApiViewSet(BaseAPIViewSet):
    body_fields = BaseAPIViewSet.body_fields + ["name", "background"]
    renderer_classes = [JSONRenderer]
    name = "destinos"
    model = Destino
class CustomSnippetDatNumerosApiViewSet(BaseAPIViewSet):
    body_fields = BaseAPIViewSet.body_fields + ["name", "numero","desc","link"]
    renderer_classes = [JSONRenderer]
    name = "dataNumeros"
    model = DataNumero


api_router.register_endpoint('pages/paquete', CustomPagesAPIViewSet)
api_router.register_endpoint('pages/inicio', CustomInicioApiViewSet)
api_router.register_endpoint('pages/nosotros', CustomNosotrosApiViewSet)
api_router.register_endpoint('images', ImagesAPIViewSet)
api_router.register_endpoint('snippets/destino', CustomSnippetDestinoApiViewSet)
api_router.register_endpoint('snippets/dataNumeros', CustomSnippetDatNumerosApiViewSet)
