Templates
=========

All templates for an app should be collected under a ``templates/`` folder in your app::

  - my_app/
      - templates/

However, do not put templates directly under the ``templates/`` folder, like this::

  - my_app/
      - templates/
          - template_1.html
          - template_2.html
          ...

Instead, create a subfolder with the **same name** as your app's container folder, like this::

  - my_app/
      - templates/
          - my_app/

Then put your templates under **that** folder::

  - my_app/
      - templates/
          - my_app/
              - template_1.html
              - template_2.html
              ...

Finally, in your views, when you refer to ``template_1.html``, refer to ``my_app/template_1.html`` (instead of just ``template_1.html``).

This "namespaces" the template to your app, in the sense that it tells Django which app ``template_1.html`` belongs to.

Why do it this way? The reason has to do with the way Django finds templates. When you say in a view, "use ``template_1.html``," Django will search all folders called ``templates/`` for a file called ``template_1.html``, and Django will use the first file with that name it finds. 

But what if another app has a template called ``template_1.html``, and Django looks at it first? Since Django uses the first file it finds, it will use **that** template instead of the one you intended. That would lead to unexpected results.

By putting your templates inside the folder --- ::

    <app_name>/templates/<app_name>

--- you ensure that Django will find the template that belong only to your app.