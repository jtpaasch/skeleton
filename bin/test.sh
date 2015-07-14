#!/usr/bin/env bash

# Make sure we're at the root of the project.
if [[ ! -f project/urls.py ]]; then
    echo 'You must be at the root of the project to run this script.'
    exit 1
fi

# Clean the coverage files.
find . -name "*,cover" -delete

# Run the tests, with coverage.
coverage run --source 'apps' --branch manage.py test apps

# Exit with our last code.
exit $?