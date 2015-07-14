Allowed Hosts
=============

When you make an HTTP request in your browser for, say, ``http://www.some-site.com/foo``, you are specifying two things:

#. The resource, named ``/foo``.
#. The host, named ``www.some-site.com``.

Indeed, the raw HTTP request that your browser makes behind the scenes is this::

    GET /foo HTTP/1.1
    Host: www.some-site.com

Note: on the first line, you have the **resource** (the ``/foo`` part), and on the second line, you have the **host** (the ``Host: ...`` part).

According to the HTTP/1.1 spec, [#]_ any valid HTTP request must include the ``Host`` header.

Django is a good HTTP citizen in the sense that it enforces this --- at least so long as ``DEBUG`` is set to ``False``. [#]_

In your settings file, you must provide a list of ``ALLOWED_HOSTS`` that Django will respond to. For instance, you need to put something like this into your settings file::

    ALLOWED_HOSTS = [
        'www.my-site.com',
        ...
    ]

If the request specifies a ``Host`` header of ``Host: www.my-site.com``, then Django will serve the response, no problem. 

However, if the request does **NOT** specify a host listed in ``ALLOWED_HOSTS``, then Django will refuse to serve the response. Instead, it will return a ``400 Bad Request`` response.


.. [#] See http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.23
.. [#] If ``DEBUG`` is set to ``True``, Django will not check if 
       the request has provided a legitimate ``Host`` header. Instead, 
       it will just serve the response. It is only when ``DEBUG`` is set 
       to ``False`` that Django steps in and checks the ``Host`` header. 
       The moral of the story: when you go to production, make sure you 
       have your ``ALLOWED_HOSTS`` set up correctly.