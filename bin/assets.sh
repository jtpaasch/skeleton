#!/usr/bin/env bash

# Make sure we're at the root of the project.
if [[ ! -f project/urls.py ]]; then
    echo 'You must be at the root of the project to run this script.'
    exit 1
fi

# Does the dist directory exist?
# If so, delete it.
if [[ -d dist ]]; then
    echo 'Deleting dist...'
    rm -rf dist
fi

# Now run the collectstatic command.
./manage.py collectstatic --noinput

# Exit with our last exit code.
exit $?