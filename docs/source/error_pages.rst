Error Pages like 404 or 500 Pages
=================================

When Django displays, say, a 404 page, it steps through each ``templates`` folder it can find, looking for a file called ``404.html``. 

To keep things modular, put this inside its own app, as follows.

Create an app called ``404``, create a ``templates/`` directory inside that, and then add a ``404.html`` file to it. The 404 app looks like this::

  - 404/
      - templates
          - 404.html

Be sure to add ``apps.404`` to the ``INSTALLED_APPS`` setting, or else Django won't know to look for the ``404.html`` file there::

    INSTALLED_APPS = (
        ...
        'apps.404',
        ...
    )

You should also add ``selenium/`` and ``tests/`` folders to the app, and populate those folders with the relevant tests.

Do the same for 400, 403, and 500 error pages.