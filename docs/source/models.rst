Models
======

Models should be collected into a ``models/`` folder inside the app. Each model should be in its own file (many models should not be in the same file). 

Name the model's **file** and the **class** according to standard Python naming conventions. For instance, if you have a model class called ``Contacts``, the file should be called ``contacts.py``.

An app with such a model would look like this::

  - apps/
      - my_app/
          - models/
              - contacts.py
                |
                |-- Contacts (class)