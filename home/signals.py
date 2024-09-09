
from wagtail.models import ValidationError
from wagtail.signals import page_published,page_unpublished
from paquete.models import Paquete 
from salidasGrupales.models import SalidasGrupales
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


# Let everyone know when a new page is published
def send_to_vercel_Tour(sender, **kwargs):
    instance = kwargs['instance']
    # print(sender.content_type())
    values = {"sender":sender.__name__,"lng":instance.get_default_locale().__str__(),"destino":  instance.tourDestino.__str__().lower() }
    url = f"{settings.MYURLFRONT}/api/isr/"
    response = requests.post(url,json=values)

def send_to_vercel_Salidas(sender, **kwargs):
    instance = kwargs['instance']
    # print(sender.content_type())
    values = {"sender":sender.__name__,"lng":instance.get_default_locale().__str__() }
    url = f"{settings.MYURLFRONT}/api/isr/"
    response = requests.post(url,json=values)


# Register a receiver
page_published.connect(send_to_vercel_Paquete,sender=Paquete)
page_published.connect(send_to_vercel_Tour,sender=Tour)
page_published.connect(send_to_vercel_Salidas,sender=SalidasGrupales)
page_unpublished.connect(send_to_vercel_Paquete,sender=Paquete)
page_unpublished.connect(send_to_vercel_Tour,sender=Tour)
page_unpublished.connect(send_to_vercel_Salidas,sender=SalidasGrupales)
