from wagtail import hooks
from wagtail.admin.viewsets.pages import PageListingViewSet

from blog.models import Blog
from blog.customPageListViewSet import MyPageListingViewSet
from blog.models import Blog

class BlogListingViewSet(MyPageListingViewSet):
    icon = "globe"
    menu_label = "Blogs"
    add_to_admin_menu = True
    model = Blog
    menu_order= 400


blog_listing_viewset = BlogListingViewSet("blog_pages")

@hooks.register("register_admin_viewset")
def register_blog_page_listing_viewset():
    return blog_listing_viewset
