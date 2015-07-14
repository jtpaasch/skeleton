#!/usr/bin/env bash

# Make sure we're at the root of the project.
if [[ ! -f project/urls.py ]]; then
    echo 'You must be at the root of the project to run this script.'
    exit 1
fi

# Run the linting tool.
prospector --ignore-patterns 'env' --ignore-patterns 'settings.py' --zero-exit --full-pep8 --doc-warnings --member-warnings --with-tool vulture

# Exit with our last exit code.
exit $?