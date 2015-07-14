Secure HTTP Headers
===================

Django provides a number of ways to set standard secure HTTP headers.


Clickjacking
------------

In your settings file, add the ``XFrameOptionsMiddleware`` middleware (this should be there by default)::

    MIDDLEWARE_CLASSES = (
        ...
        'django.middleware.clickjacking.XFrameOptionMiddleware',
        ...
    )

Set the ``X_FRAME_OPTIONS`` setting::

    X_FRAME_OPTIONS = 'DENY'

This will make sure that Django sets the ``X-Frame-Options`` header to ``DENY``.

HTTP Strict Transport Security
------------------------------

If your site runs entirely over HTTPS, it is a good idea to force all requests to be carried out over HTTPS. 

Well, we should be more exact. Django can enforce HTTPS for every request except the first request. The first request is the problem, because the **first time** someone comes to you, you cannot guess their protocol. 

However, once Django receives that first request, Django can then say: "from now on, always connect to us with HTTPS."

To make this happen, in your settings file, add ``SecurityMiddleware`` to the middleware if it's not already there (it should be there, by default)::

    MIDDLEWARE_CLASSES = (
        ...
        'django.middleware.security.SecurityMiddleware',
        ...
    )

Then set the SECURE_HSTS_SECONDS to 1 year, and include subdomains::

    SECURE_HSTS_SECONDS = 31536000
    SECURE_HSTS_INCLUDE_SUBDOMAINS = True

That will ensure that Django will always require any client to connect through HTTPS (except the first time).