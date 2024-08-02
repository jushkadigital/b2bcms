
from wagtail.models import ValidationError
from wagtail.signals import page_published,page_unpublished
from paquete.models import Paquete 
from tour.models import Tour 
from django.conf import settings
import requests


# Let everyone know when a new page is published
def send_to_vercel_Paquete(sender, **kwargs):
    instance = kwargs['instance']

    print('signal paquete')
    # print(sender.content_type())
    values = {"sender":sender.__name__,"lng":instance.get_default_locale().__str__() }
    url = f"{settings.MYURLFRONT}/api/isr/"
    response = requests.post(url,json=values)

    # url = 'https://api.vercel.com/v1/integrations/deploy/prj_7x5hHOUPrZhjTqQkCtvWoflxhW5W/9cv7iNWwRv'

# Let everyone know when a new page is published
def send_to_vercel_Tour(sender, **kwargs):
    instance = kwargs['instance']
    # print(sender.content_type())
    values = {"sender":sender.__name__,"lng":instance.get_default_locale().__str__(),"destino":  instance.tourDestino.__str__().lower() }
    url = f"{settings.MYURLFRONT}/api/isr/"
    response = requests.post(url,json=values)

    # url = 'https://api.vercel.com/v1/integrations/deploy/prj_7x5hHOUPrZhjTqQkCtvWoflxhW5W/9cv7iNWwRv'

# Register a receiver
page_published.connect(send_to_vercel_Paquete,sender=Paquete)
page_published.connect(send_to_vercel_Tour,sender=Tour)
page_unpublished.connect(send_to_vercel_Paquete,sender=Paquete)
page_unpublished.connect(send_to_vercel_Tour,sender=Paquete)
