Running Tests
=============

To run all the tests, run the script::

    $ ./bin/test.sh

This will automatically find all selenium and unit tests in your apps, run them, and then finally return a report of how many it ran, and how many passed and/or failed.

The exit code will be a ``0`` if all passed, or non-zero otherwise.