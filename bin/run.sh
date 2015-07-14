#!/usr/bin/env bash

# Check for an argument.
ENV_NAME=$1
if [[ -z $ENV_NAME ]]; then
    echo "Specify an environment, e.g. $0 dev"
    exit 1
fi

# Check for the directory.
if [[ ! -d environments/$ENV_NAME ]]; then
    echo "No environment named $ENV_NAME."
    exit 1
fi

# Make sure a .env file exists.
# If it doesn't, create it.
if [[ ! -f environments/$ENV_NAME/.env ]]; then
    cp environments/$ENV_NAME/.env.example environments/$ENV_NAME/.env
fi

# Make sure the pyvenv directory exists.
# If it doesn't, create it.
if [[ ! -d environments/$ENV_NAME/pyvenv ]]; then
    pyvenv environments/$ENV_NAME/pyvenv
fi

# Activate the virtual environment.
source environments/$ENV_NAME/pyvenv/bin/activate

# Install requirements?
if [[ $2 == "-r" ]]; then
    pip install -r environments/$ENV_NAME/requirements.txt
fi

# Is there a start.sh in the environment?
# If so, run it.
if [[ -f environments/$ENV_NAME/start.sh ]]; then
    ./environments/$ENV_NAME/start.sh
fi

# Run our processes.
honcho --procfile environments/$ENV_NAME/Procfile start
