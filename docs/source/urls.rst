URLs
====

URLs should NOT be defined inside the main ``project/urls.py`` file. Instead, 
each app should have its own set of urls, defined in its own ``urls.py`` file. 

The main ``project/urls.py`` should then import the app's urls, like so::

    urlpatterns = [
        ...
        url(r'^helloworld$', include('apps.helloworld.urls')),
        ...
    ]

This will prefix every url from ``apps.helloworld.urls`` with ``/helloworld``. 

Note the following:

* By defining the app's URLs inside the app itself, the app remains a self-contained package, decoupled from the larger project.
* By prefixing the app's URLs in your project, you can import the same app multiple times (with different prefixes), and also avoid any naming conflicts with other app's urls.
