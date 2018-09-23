from .base import *

DEBUG = True
INSTALLED_APPS += [
        'debug_toolbar',
        ]
MIDDLEWARE += ['debug_toolbar.middleware.DebugToolbarMiddleware', ]
AUTH_PASSWORD_VALIDATORS = []
DEBUG_TOOLBAR_CONFIG = {
        'SHOW_TOOLBAR_CALLBACK': lambda request: True if DEBUG else False,
        }
STATIC_ROOT = os.path.join(BASE_DIR, "static/")
