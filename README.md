SKELETON
========

A skeleton for Django projects.

To generate the documentation, run this command:

    $ ./bin/docs.sh

To start up the dev environment, run this command:

    $ ./bin/run.sh dev -r

The `-r` flag will do a `pip install -r` from the `dev` environment's `requirements.txt` file. If you don't need to install or update your environment's packages, omit it:

    $ ./bin/run.sh dev