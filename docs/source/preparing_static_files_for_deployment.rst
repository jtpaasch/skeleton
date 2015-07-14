Preparing Static Files for Deployment
=====================================

While in development mode (when the ``DEBUG`` setting is ``True``), Django will serve your static files (e.g., assets) directly from your apps.

However, when you move into production mode (when ``DEBUG`` is ``False``), Django has a strict policy: Django believes it has no business serving static files. So, **IT WON'T**. Instead, it forces you to put your static files somewhere else, and serve them independently (e.g., from a CDN).

To prepare your static files for deployment to a CDN, run the command::

    $ ./bin/assets.sh

That will find all the static files in your apps, and copy them over into the ``dist/`` folder. They are then ready for deployment.






