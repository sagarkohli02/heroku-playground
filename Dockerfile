# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Install sudo command
RUN apt-get update && apt-get install -y sudo git && apt-get clean

# Install the Heroku CLI
RUN apt-get update && apt-get install -y curl && \
    curl https://cli-assets.heroku.com/install.sh | sh

ARG HEROKU_API_KEY
# Set Heroku API key for authentication
ENV HEROKU_API_KEY=$HEROKU_API_KEY
# Set the current user and group IDs
ARG USER_ID
ARG GROUP_ID

# Create a new user with the same user and group IDs as the host user
RUN addgroup --gid $GROUP_ID user && \
    useradd --create-home --shell /bin/bash --uid $USER_ID --gid $GROUP_ID user && \
    echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user

# Switch to the user
USER user

# Verify the installation
RUN heroku --version

# Run any command to keep the container running
CMD ["bash"]

