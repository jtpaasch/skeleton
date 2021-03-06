The Structure of a Project
==========================

The directory structure of a Nara project is somewhat different from regular Django projects.
::

  - main_folder/

      - .git
      - .gitignore
      - README.md

      - manage.py               (Django's command line tool)
      - bin/
          - lint.sh             (checks code for quality/style)
          - test.sh             (runs all tests)
          - coverage.sh         (reports on test coverage)
          - assets.sh           (builds static files for deployment)
          - docs.sh             (generates docs)
          - scaffold_env.sh     (scaffolds an environment)
          - run.sh              (runs an environment)

      - apps/                   (custom apps go in here)

      - project/                (project configuration goes in here)
          - settings.py         (project settings)
          - urls.py             (project urls)
          - wsgi.py             (Django's wsgi file)

      - environments/           (environments go in here)

      - docs/                   (documentation goes in here)
          - source/             (source .rst docs)
          - build/              (files generated by bin/docs)

      - dist/                   (built static files go in here)


.git
    The project's git folder.

.gitignore
    The ``environments/``, ``docs/build``, and ``dist/`` folders 
    should be listed here. Everything else should be
    checked in under source control.

README.md
    The README required by github.

manage.py
    Django's command line tool that provides management commands
    like `runserver`, `migrate`, and so on.

bin/
    Custom utility scripts go in this folder. 

    lint.sh
        Runs code-quality checks on the project's code. It reports 
        errors regarding style, unused variables and imports, overly
        complex control structures, and the like.

    test.sh
        Runs all selenium and unit tests.

    coverage.sh
        Displays a coverage report of how much code is covered by
        unit tests. 

    assets.sh
        Collects all static files and copies them into the ``dist/``
        folder, ready for deployment.

    docs.sh
        Generates documentation in the ``docs/build`` folder.

    scaffold_env.sh
        Scaffolds a new environment by creating all the relevant
        files and folders in the ``environments/`` folder.

    run.sh
        Activates an environment (configured in the ``environments/``
        folder) and runs the environment.

apps/
    All custom apps go in this folder.

project/
    Project-level configuration goes inside this folder.

    settings.py
        Contains settings for the project.

    urls.py
        Contains urls for the project.

    wsgi.py
        Django's default ``wsgi.py`` file.

environments/
    A folder to hold different environments.

docs/
    A folder to hold documentation. Documentation is generated
    with ``Sphinx``.

    source/
        A folder to hold source ``.rst`` documents.

    build/
        A folder to hold the documentation generated by running
        ``bin/docs``. This directory should be listed
        in ``.gitignore``. 

dist/
    A folder to hold static assets ready for deployment. 
    This directory should be listed in ``.gitignore``.



