Views
=====

Django lets you write views as (i) mere functions, or (ii) classes that are callable.

The best practice, in our view, is that Views should be written as class-based Generic Views, not functions.

So, views should be collected into a ``views/`` folder inside the app. Each view should be in its own file (many views should not be in the same file). 

Name the view's **file** and **class** according to standard Python naming conventions. For instance, if you have a view class called ``Contacts``, the file should be called ``contacts.py``.

An app with such a view would look like this::

  - apps/
      - my_app/
          - views/
              - contacts.py
                |
                |-- Contacts (class)