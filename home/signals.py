
from wagtail.models import ValidationError
from wagtail.signals import page_published
import requests


# Let everyone know when a new page is published
def send_to_vercel(sender, **kwargs):
    instance = kwargs['instance']
    url = 'https://api.vercel.com/v1/integrations/deploy/prj_7x5hHOUPrZhjTqQkCtvWoflxhW5W/9cv7iNWwRv'
    values = {
    }
    # response = requests.get(url)
    # print(response)
    print("gaaa")

# Register a receiver
page_published.connect(send_to_vercel)
