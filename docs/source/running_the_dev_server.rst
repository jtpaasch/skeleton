Running a Development Server
============================

The typical way to start the Django development server is to run the command::

    ./manage.py runserver

The 3rd party package ``django-extensions`` includes an enhanced development server called **RunServerPlus**. Run it with this command::

    ./manage.py runserver_plus

The main benefit of RunServerPlus is that it lets you debug requests that fail, live in the browser.

(The runserver_plus server will also get started by the ``bin/cdn.sh`` script, but that script will also start a development CDN server.)
