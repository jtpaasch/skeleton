Secure Cookies
==============

Django sends out two sensitive cookies:

#. CSRF cookies
#. Session cookies

If your site operates entirely over HTTPS, then you should send these cookies **only** over HTTPS. To tell Django to do this, set these values in your settings file:

* ``SESSION_COOKIE_SECURE = True``
* ``CSRF_COOKIE_SECURE = True``

In addition, you should also instruct Django to prevent javascript from accessing these cookies (by making the cookies ``HTTP-Only``). In your settings file, set the following:

* ``CSRF_COOKIE_HTTPONLY = True``
* ``SESSION_COOKIE_HTTPONLY = True``

Note, however, that the ``HTTP-Only`` flag is not respected by all browsers. It is nice-to-have when it matters.