SKELETON
========

A skeleton for Django projects.

* Python >= 3.4
* Django >= 1.8

To generate the documentation, run this command:

    $ ./bin/docs.sh

To start up the dev environment, run this command:

    $ ./bin/run.sh dev -r

The `-r` flag will do a `pip install -r` from the `environments/dev` folder's `requirements.txt` file. When you don't need to install or update the dev environment's packages, you can omit it:

    $ ./bin/run.sh dev