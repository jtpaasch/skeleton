#!/usr/bin/env bash

# Make sure we're at the root of the project.
if [[ ! -f project/urls.py ]]; then
    echo 'You must be at the root of the project to run this script.'
    exit 1
fi

# Make sure we've run coverage.
if [[ ! -f .coverage ]]; then
    echo 'No tests have generated a coverage report.'
    echo 'You must first run the tests (with ./bin/test)'
    exit 1
fi

# Print out the reports. Require 100% coverage.
coverage report -m --fail-under=100
SUCCESS=$?

# If we didn't pass the requirements, indicate it.
echo '------------------------------------------------------------------------'
if [[ $SUCCESS != 0 ]]; then
    echo 'FAILED'
    echo 'Less than 100% code coverage.'
else
    echo 'OK'
    echo 'Full code coverage'
fi

# Exit with our last code.
exit $SUCCESS
