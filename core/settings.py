"""
Django settings for core project.

Generated by 'django-admin startproject' using Django 5.0.6.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.0/ref/settings/
"""

from pathlib import Path
import os


# MYURLFRONT = "https://www.perudestinoseguro.com"
MYURLFRONT = "https://www.perudestinoseguro.com"

CLOUDINARY_STORAGE = {
    # 'CLOUD_NAME': 'denkdx0za',  # required
    'CLOUD_NAME': 'dhwwdtclq',  # required
    'API_KEY': 453554727621738,  # required
    # 'API_SECRET': 'rPJHaGT36J8EK9wygmjN_tXBQEw'
    'API_SECRET': 'ZpZNNDtRzhwY2IOy9jOtt91W-kY'
    }

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development setllltings - unsuitable for production
# See https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
# SECRET_KEY = 'django-insecure-6ox1w=+9jhi6z7gr3%bci01=ohf5sqif@-6_f0mluj8)88kx7w'
SECRET_KEY = os.environ.get('SECRET_KEY', default='your secret key')
# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = 'RENDER' not in os.environ

# https://docs.djangoproject.com/en/3.0/ref/settings/#allowed-hosts
ALLOWED_HOSTS = ['www.vps.perudestinoseguro.com','vps.perudestinoseguro.com','localhost']

# RENDER_EXTERNAL_HOSTNAME = os.environ.get('RENDER_EXTERNAL_HOSTNAME')
# if RENDER_EXTERNAL_HOSTNAME:
#     ALLOWED_HOSTS.append(RENDER_EXTERNAL_HOSTNAME)

# Application definition

INSTALLED_APPS = [
    'home',
    'paquete',
    'tour',
    'wagtail.locales',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    'wagtail.contrib.forms',
    'wagtail.contrib.redirects',
    "wagtail.contrib.simple_translation",
    'wagtail.embeds',
    'wagtail.sites',
    'wagtail.users',
    'wagtail.snippets',
    'wagtail.documents',
    'wagtail.images',
    'wagtail.search',
    'wagtail.admin',
    'wagtail',

    'modelcluster',
    'taggit',
    
    'cloudinary',
    'cloudinary_storage',
    # 'wagtailcloudinary',
    
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'wagtail.contrib.redirects.middleware.RedirectMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'core.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'core.wsgi.application'


# Database
# https://docs.djangoproject.com/en/5.0/ref/settings/#databases

# DATABASES = {
#     'default':{
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': 'uzmduhmy_wagtailb2b',
#         'USER': 'uzmduhmy_josue',
#         'PASSWORD':'Admin123321Admin',
#         'HOST': 'single-5922.banahosting.com',
#         'PORT': '3306',
#         'OPTIONS': {
#             'charset': 'utf8mb4',  # <--- Use this
#         }
#         }
# }

DATABASES = {
    'default':{
        'ENGINE': 'django.db.backends.mysql',
        'OPTIONS': {
            'read_default_file': '/etc/mysql/my.cnf',
            'charset': 'utf8mb4',  # <--- Use this
            'use_unicode': True,
            }
        }
}

# Password validation
# https://docs.djangoproject.com/en/5.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True

USE_I18N = True
WAGTAIL_I18N_ENABLED = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.0/howto/static-files/

STATIC_URL = 'static/'
if not DEBUG:
    # Tell Django to copy static assets into a path called `staticfiles` (this is specific to Render)
    STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
    # Enable the WhiteNoise storage backend, which compresses static files to reduce disk use
    # and renames the files with unique names for each version to support long-term caching
    STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'
else:
    STATIC_ROOT = os.path.join(BASE_DIR, 'static')

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'

WAGTAIL_SITE_NAME = 'My Example Site'
WAGTAILADMIN_BASE_URL = 'http://example.com'
WAGTAILDOCS_EXTENSIONS = ['csv', 'docx', 'key', 'odt', 'pdf', 'pptx', 'rtf', 'txt', 'xlsx', 'zip']

WAGTAILIMAGES_IMAGE_MODEL = "home.CloudinaryImage"

WAGTAIL_CONTENT_LANGUAGES = LANGUAGES = [
    ('es', "Spanish"),
    ('en', "English"),
]

LANGUAGE_CODE = 'es'

# Default primary key field type
# https://docs.djangoproject.com/en/5.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'


