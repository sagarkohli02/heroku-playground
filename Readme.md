# Heroku CLI Dockerized

This project demonstrates how to use Docker to run the Heroku CLI in a containerized environment. It allows you to interact with Heroku without installing the CLI directly on your local machine.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/sagarkohli02/heroku-playground.git
   ```

2. Navigate to the project directory:

   ```bash
   cd heroku-cli-docker
   ```

3. Create a `.env` file in the project directory with your Heroku API key:

   ```bash
   echo "HEROKU_API_KEY=your_heroku_api_key_here" > .env
   ```

   Replace `your_heroku_api_key_here` with your actual Heroku API key. If you don't have an API key, you can obtain it from the Heroku dashboard:

   - Log in to your Heroku account.
   - Navigate to the [Account settings](https://dashboard.heroku.com/account) page.
   - Scroll down to the **API Key** section.
   - Click on **Reveal** to view your API key.
   - Copy the API key and paste it into the `.env` file.

4. Run the build script to build the Docker image and start the container:

   ```bash
   ./build.sh
   ```

   This script will prompt you to enter your Heroku API key. Once entered, it will build the Docker image and run the container with the current directory mounted.

5. You are now inside the Docker container with the Heroku CLI installed and ready to use. You can execute Heroku CLI commands as needed.

6. When you're finished, exit the container by typing `exit` or pressing `Ctrl + D`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

