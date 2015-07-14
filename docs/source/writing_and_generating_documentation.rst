Writing and Generating Documentation
====================================

Like most standard Python projects, Nara's Django projects use Sphinx to generate documentation.

View your documentation by opening ``docs/build/html/index.html``.

If you make changes to the source documentation files (in ``docs/source``), you can re-generate the polished HTML version of the documentation with this script::

    $ ./bin/docs.sh

Note the following:

* As long as you provide docstrings for all your classes and methods, Sphinx will build documentation for your new code automatically.
* If you need to write any custom documentation, do that by creating/modifying the ``.rst`` files in the ``docs/source`` directory.
