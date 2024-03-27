#!/bin/bash

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Load environment variables from .env file
if [[ -f "$DIR/.env" ]]; then
    source "$DIR/.env"
else
    echo "Error: .env file not found in $DIR directory."
    exit 1
fi

# Get current user and group IDs
USER_ID=$(id -u)
GROUP_ID=$(id -g)

# Build the Docker image with user, group IDs, and API key as build arguments
docker build --build-arg USER_ID=$USER_ID --build-arg GROUP_ID=$GROUP_ID --build-arg HEROKU_API_KEY="$HEROKU_API_KEY" -t heroku-cli .

# Run the Docker container with the current directory mounted
docker run -it --rm -v $DIR:/usr/src/app heroku-cli

# Clean up
unset USER_ID
unset GROUP_ID
unset HEROKU_API_KEY

