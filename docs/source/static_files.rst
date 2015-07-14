Static Files
============

The static files of an app are the files it uses which are not dynamically generated --- for instance: CSS, javascript, images, and the like. 

All of these files should be collected under a ``static/`` folder in your app::

  - my_app/
      - static/

However, do not put any of these static files directly under the ``static/`` folder, like this::

  - my_app/
      - static/
          - file_1
          - file_2
          ...

Instead, create a subfolder with the **same name** as your app's container folder, like this::

  - my_app/
      - static/
          - my_app/

Then put your static files under **that** folder::

  - my_app/
      - static/
          - my_app/
              - file_1
              - file_2
              ...

Finally, in your templates, when you refer to ``file_1``, refer to ``my_app/file_1`` (instead of just ``file_1``).

This "namespaces" the file to your app, in the sense that it tells Django which app ``file_1`` belongs to.

Why do it this way? The reason has to do with the way Django finds static files. When you say in a view, "use ``file_1``," Django will search all folders called ``static/`` for a file called ``file_1``, and Django will use the first file with that name that it finds. 

But what if another app has a static file called ``file_1``, and Django looks at it first? Since Django uses the first file it finds, it will use **that** file instead of the one you intended. That would be a problem.

By putting your static files inside the folder -- ::

    <app_name>/templates/<app_name>

-- you ensure that Django will find the static files that belong only to your app.