CSRF Protection
===============

This is enabled by default with django.middleware.csrf.CsrfViewMiddleware. Make sure that class is listed in settings.py under MIDDLEWARE_CLASSES.

Make sure you use generic class-based views, where CSRF is automatically handled. If you roll your own views, you'll need to handle the CSRF processing yourself. See https://docs.djangoproject.com/en/1.8/ref/csrf/#using-csrf for more details.

Note that CSRF tokens need to be included in POST data from forms, and also in ajax requests. If you use a templating system other than the default Django templating system, you'll need to be sure to include the CSRF tokens.

When users fail the CSRF check, Django returns a 403. In production, you should have a good page for that case. Set the view to handle 403s with the CSRF_FAILURE_VIEW setting in settings.py. See https://docs.djangoproject.com/en/1.8/ref/settings/#std:setting-CSRF_FAILURE_VIEW for details.

Watch out for caching though. See:
https://docs.djangoproject.com/en/1.8/ref/csrf/#caching

If you want to write tests for CSRF, see:
https://docs.djangoproject.com/en/1.8/ref/csrf/#testing

Adjust the CSRF cookie settings if needed. See:
https://docs.djangoproject.com/en/1.8/ref/csrf/#settings