from django.apps import AppConfig


class SalidasgrupalesConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'src.salidasGrupales'
    def ready(self):
        import salidasGrupales.hooks
