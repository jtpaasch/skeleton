SKELETON
========

A skeleton for Django projects.

To generate the documentation, run this command:

    $ ./bin/docs.sh

To use the dev environment, make sure it has a virtual environment:

    $ pyvenv environments/bin/pyvenv

Then, to start up that environment, run this command:

    $ ./bin/run.sh dev -r

The `-r` flag will do a `pip install -r` from the `dev` environment's `requirements.txt` file. When you don't need to install or update your environment's packages, you can omit it:

    $ ./bin/run.sh dev