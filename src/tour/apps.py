from django.apps import AppConfig


class TourConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'src.tour'
    def ready(self):
        import tour.hooks
