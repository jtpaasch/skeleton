Environments
============

To create a new environment, use the scaffolding tool::

    $ ./bin/scaffold_env.sh <environment_name>


For instance, to create an environment called ``dev``::

    $ ./bin/scaffold_env.sh dev

That will create a bare environment called ``dev`` with the following structure::

    - project_root/
        - environments/           (all environments go in here)
            - dev/                (the environment named "dev")
                .env              (env variables go in here; not checked into git)
                .env.example      (an example .env file) 
                Procfile          (processes defined here)
                pyvenv/           (virtual environment goes in here; not checked into git)
                requirements.txt  (pip freeze into here)

Next, add any environment variables to ``environments/dev/.env``, for instance::

    $ echo 'PYTHONUNBUFFERED=true' >> environments/dev/.env

Add any processes you want to run in the environment to ``environments/dev/Procfile``, e.g., the development webserver::

    $ echo 'webserver: python manage.py runserver_plus' >> environments/dev/Procfile

Add any packages the environment needs::

    $ source environments/dev/pyvenv/bin/activate # Activate the environment
    $ pip install django-extensions               # Add a package
    $ pip install prospector                      # Add another package

And freeze the requirements::

    $ pip freeze > environments/dev/requirements.txt

Now you have an environment. You can run it like this::

    $ ./bin/run.sh dev -r

The ``-r`` flag updates/installs any requirements in the environment. Use this flag the first time you run the environment, or any time the requirements.txt file changes.

If you don't need to update/install any requirements, omit the ``-r`` flag::

    $ ./bin/run.sh dev

To stop running the environment, use ``Ctrl + C``.

