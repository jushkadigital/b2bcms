from wagtail import hooks
from wagtail.admin.viewsets.pages import PageListingViewSet

from tour.customPageListViewSet import MyPageListingViewSet
from tour.models import Tour


class TourListingViewSet(MyPageListingViewSet):
    icon = "globe"
    menu_label = "Tours"
    add_to_admin_menu = True
    model = Tour
    menu_order= 250





tour_listing_viewset = TourListingViewSet("tours_pages")

@hooks.register("register_admin_viewset")
def register_tours_page_listing_viewset():
    return tour_listing_viewset
