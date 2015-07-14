Code Coverage
=============

To find out how much of your code is covered by unit tests, run the script::

    $ ./bin/coverage.sh

This will display a report of all the modules that were executed, and how many lines are covered by tests. 

If there is 100% coverage, the script will exit with a ``0``. Otherwise, it will exit with a non-zero value.

Note: the coverage tests are generated each time you run ``./bin/test.sh``, so be sure to run the tests before checking coverage.