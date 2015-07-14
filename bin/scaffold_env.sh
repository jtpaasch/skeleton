#!/usr/bin/env bash

# Make sure we're in the project's root directory.
if [[ ! -f project/settings.py ]]; then
    echo "You must be in the project's root directory."
    exit 1
fi

# A function to display usage.
usage() {
    echo "USAGE: "
    echo "  $0 <environment-name> [options...]"
    echo ""
    echo "OPTIONS:"
    echo "  -r  Install/update requirements."
    echo ""
    echo "EXAMPLE:"
    echo "  $0 dev -r"
    exit 1
}

# If no arguments were provided, display the usage.
if [ "$#" == "0" ]; then
    usage
fi

# Step through the rest of the arguments.
while (( "$#" )); do

    # What's the value of this argument ($1)?
    case $1 in

        # The help option: --help
        --help) usage
                ;;

        # The requirements option: -r.
        -r)     REQUIREMENTS="true"
                ;;

        # An unrecognized option.
        -*)     echo "Unrecognized option $1."
                echo "See $0 --help."
                exit 1
                ;;

        # Anything else must be the environment.
        *)      ENV_NAME=$1
                ;;

    esac

    # Shift $1 to the next argument.
    shift

done

# Make sure an environment was named.
if [[ -z $ENV_NAME ]]; then
    echo "Specify an environment name, e.g., $0 dev."
    echo "See $0 --help."
    exit 1
fi

# Does it already exist?
if [[ -d environments/$ENV_NAME ]]; then
    echo "The $ENV_NAME environment already exists."
    exit 1
fi

# Let the user know we're going to scaffold an environment.
echo "Scaffolding $ENV_NAME..."
echo ""
sleep .25

# Make sure the environments folder exists.
if [[ ! -d environments ]]; then
    mkdir environments
fi

# Create the environment's container folder.
mkdir environments/$ENV_NAME

# Make sure pyvenv exists.
if [ ! hash 2>/dev/null ]; then
    echo "You do not have pyvenv installed."
    echo "Make sure you are using Python 3.4 or higher."
    exit 1
fi

# Create the pyvenv
pyvenv environments/$ENV_NAME/pyvenv

# Activate the environment.
source environments/$ENV_NAME/pyvenv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Create an empty .env file.
echo '' > environments/$ENV_NAME/.env

# Create an empty Procfile.
echo '' > environments/$ENV_NAME/Procfile

# Create a requirements file.
pip freeze > environments/$ENV_NAME/requirements.txt

sleep .25
echo ""
echo "Scaffolding the $ENV_NAME environment complete."
echo "Populate environments/$ENV_NAME/{.env,Procfile,requirements.txt}."
exit 0