The Structure of an App
=======================

The directory structure of a custom Nara app is somewhat different from regular Django apps.
::

  - my_app/

      - urls.py      (urls for the app)

      - views/       (views go in here)

      - models/      (models go in here)

      - tests/       (unit tests go in here)

      - selenium/    (selenium tests go in here)

      - templates/
          -my_app/   (namespaces the templates)
              ...    (templates go here)

      - static/
          - my_app/  (namespaces the static files)
              ...    (static files go here)

my_app/
    The container folder of the app. It should have the app's name. 
    In this case, the name of the app is "my_app," and so the 
    folder is likewise named "my_app."

    urls.py
        The urls for the app.

    views/
        Views go in here. Each view class gets its own file.

    models/
        Models go in here. Each model class gets its own file.

    tests/
        Unit tests go in here. Each test class gets its own file. 

    selenium/
        Selenium tests go in here. Each test class gets its own file.

    templates/
        A folder to hold templates for the app.

        my_app/
            This folder must have the same name as the container
            folder of the app. All templates should go inside 
            this folder, not the parent ``templates/`` folder.
            That will namespace the templates to the app.
            

    static/
        A folder to hold static files for the app.

        my_app/
            This folder must have the same name as the container
            folder of the app. You may subdivide this folder 
            further, e.g., into ``css/``, ``js/``, and other 
            subfolders, but however you do it, all static files 
            must reside somewhere in this ``my_app/`` folder, not
            the parent ``static/`` folder. That will namespace the
            templates to the app.
            
