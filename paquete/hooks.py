from wagtail import hooks
from wagtail.admin.viewsets.pages import PageListingViewSet

from paquete.models import Paquete
from paquete.customPageListViewSet import MyPageListingViewSet


class PaqueteListingViewSet(MyPageListingViewSet):
    icon = "globe"
    menu_label = "Paquetes"
    add_to_admin_menu = True
    model = Paquete
    menu_order= 200


paquete_listing_viewset = PaqueteListingViewSet("paquetes_pages")

@hooks.register("register_admin_viewset")
def register_paquetes_page_listing_viewset():
    return paquete_listing_viewset
