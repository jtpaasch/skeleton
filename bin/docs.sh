#!/usr/bin/env bash

# Activate the virtual environment.
. environments/dev/pyvenv/bin/activate

# Make sure we're at the root of the project.
if [[ ! -f project/urls.py ]]; then
    echo 'You must be at the root of the project to run this script.'
    exit 1
fi

# Make sure there's a /docs directory.
if [[ ! -d docs ]]; then
    echo 'There is no docs directory to build documentation in.'
    echo 'Please configure the docs directory with Sphinx first.'
    exit 1
fi

# Make sure there's a /docs/source directory.
if [[ ! -d docs/source ]]; then
    echo 'There is no docs/source directory. Please configure'
    echo 'the docs directory with source and build directories'.
    exit 1
fi

# Now remove any files in /docs/source/modules.
if [[ -d docs/source/modules ]]; then
    echo 'Cleaning docs/source/modules...'
fi

# Re-generate .rst files for the apps folder.
sphinx-apidoc --force --module-first --separate -d 1 -o docs/source/modules apps

# Change into the docs directory.
cd docs

# Build the documentation.
make html

# Exit with our last exit code.
exit $?