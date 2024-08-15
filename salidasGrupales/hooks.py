from wagtail import hooks
from wagtail.admin.viewsets.pages import PageListingViewSet

from salidasGrupales.customPageListViewSet import MyPageListingViewSet
from salidasGrupales.models import SalidasGrupales


class SalidasGrupalesListingViewSet(MyPageListingViewSet):
    icon = "globe"
    menu_label = "salidasGrupales"
    add_to_admin_menu = True
    model = SalidasGrupales
    menu_order= 270

salidasGrupales_listing_viewset = SalidasGrupalesListingViewSet("salidasGrupales_pages")

@hooks.register("register_admin_viewset")
def register_salidasGrupales_page_listing_viewset():
    return salidasGrupales_listing_viewset
