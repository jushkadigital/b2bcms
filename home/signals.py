
from wagtail.models import ValidationError
from wagtail.signals import page_published
from paquete.models import Paquete 
import requests


# Let everyone know when a new page is published
def send_to_vercel_Paquete(sender, **kwargs):
    instance = kwargs['instance']
    print(dir(instance))
    print(instance.get_default_locale())
    print(type(sender).__name__)
    print(sender.__name__)
    # print(sender.content_type())
    print(dir(sender))
    values = {"sender":sender.__name__,"lng":instance.get_default_locale() }
    url = "https://www.perudestinoseguro.com/api/isr"
    response = requests.post(url,values)

    
    # url = 'https://api.vercel.com/v1/integrations/deploy/prj_7x5hHOUPrZhjTqQkCtvWoflxhW5W/9cv7iNWwRv'

# Register a receiver
page_published.connect(send_to_vercel_Paquete,sender=Paquete)
