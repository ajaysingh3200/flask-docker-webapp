# Flask Docker Webapp

A minimal Flask web application containerized with Docker. This project demonstrates how to containerize a Python Flask application using Docker, with proper configuration and best practices.

[![Python](https://img.shields.io/badge/Python-3.11-blue.svg)](https://www.python.org/downloads/)
[![Flask](https://img.shields.io/badge/Flask-2.3.2-green.svg)](https://flask.palletsprojects.com/)
[![Docker](https://img.shields.io/badge/Docker-Required-blue.svg)](https://www.docker.com/get-started)

GitHub Repository: https://github.com/ajaysingh3200/flask-docker-webapp

## Features

- Minimal Flask web application
- Docker containerization
- Production-ready configuration
- Easy deployment
- Comprehensive documentation

## Quick Start

How to build and run (Windows PowerShell):

```powershell
cd C:\Users\Docker-Project1
docker build -t my-webapp:v1.0 .
docker run -d -p 8080:5000 --name my-webapp my-webapp:v1.0
# open http://localhost:8080 in your browser
```

Cleanup:

```powershell
docker stop my-webapp; docker rm my-webapp; docker rmi my-webapp:v1.0
```

## Conversation transcript

The following is a concise transcript of the recent chat and actions taken while preparing this project. This was appended at your request to keep a record of the steps and messages.

- User: Create a Dockerfile that containerizes this Flask application
	- Build the Docker image with tag my-webapp:v1.0
	- Run the container mapping host port 8080 to container port 5000
	- Create a .dockerignore file to exclude unnecessary files
	- Ensure the application is accessible via browser

- Assistant: Created a todo plan and added files under `C:\Users\Docker-project1` (initially). Files planned: `app.py`, `requirements.txt`, `Dockerfile`, `.dockerignore`, `README.md`.

- Assistant: Created the files and attempted to build the Docker image. The build failed with error "failed to read dockerfile: open Dockerfile: no such file or directory" (the build was run from `C:\Users\Docker-project1`). A directory listing attempt was cancelled by the user.

- User: Requested the files be created in the folder `C:\Users\Docker-Project1` (note: different capitalization/spacing in path).

- Assistant: Created `C:\Users\Docker-Project1` and added the following files there:
	- `app.py` — minimal Flask app that binds to 0.0.0.0:5000
	- `requirements.txt` — Flask dependency
	- `Dockerfile` — uses `python:3.11-slim`, installs requirements and runs `app.py`
	- `.dockerignore` — excludes virtualenvs, cache and common editor/OS files
	- `README.md` — usage and cleanup instructions (this file)

- Assistant: Updated the todo list statuses. Asked whether to build and run the container locally.

- User: Noted that there were changes to `c:\Users\Docker-project1\Dockerfile` and then asked: "add the above chats in Readme file?"

- Assistant: Appended this conversation transcript to `C:\Users\Docker-Project1\README.md` and updated the todo list to record the change.

Notes:
- Paths used: `C:\Users\Docker-project1` and `C:\Users\Docker-Project1` both appeared in earlier messages; files were created under `C:\Users\Docker-Project1` per your later instruction.
- Building and running the Docker image requires Docker to be installed and running on your machine. If you want, I can run the build and run commands and capture the output here (you must have Docker running in the environment where these commands will be executed).

If you want the full raw chat transcript (including tool outputs), tell me and I can append that as well or save it to a separate log file.

## Project Structure

```
.
├── app.py              # Main Flask application
├── requirements.txt    # Python dependencies
├── Dockerfile         # Docker image configuration
├── .dockerignore     # Files excluded from Docker context
├── README.md         # This file
└── docs/             # Additional documentation
    ├── DEVELOPMENT.md    # Development guide
    └── CONTRIBUTING.md   # Contributing guidelines
```

## Documentation

- [Development Guide](docs/DEVELOPMENT.md) - Detailed setup and development instructions
- [Contributing Guidelines](docs/CONTRIBUTING.md) - How to contribute to this project
- [API Documentation](docs/API.md) - Complete API reference and future endpoints
- [Deployment Guide](docs/DEPLOYMENT.md) - Deployment instructions for various platforms

## Requirements

- Python 3.11 or higher
- Docker Desktop or Docker Engine
- Git (for development)

## Local Development

See the [Development Guide](docs/DEVELOPMENT.md) for detailed instructions on setting up a local development environment.

## Contributing

We welcome contributions! Please see our [Contributing Guidelines](docs/CONTRIBUTING.md) for details on how to submit pull requests, report issues, and contribute to the project.

## License

This project is open source and available under the [MIT License](https://opensource.org/licenses/MIT).

## Support

If you encounter any problems or have suggestions:
1. Check the [Development Guide](docs/DEVELOPMENT.md)
2. Search for or create an issue in the GitHub repository
