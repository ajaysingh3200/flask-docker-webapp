# Development Guide

This document provides detailed information for developers working with the Flask Docker webapp.

## Prerequisites

- Python 3.11 or higher
- Docker Desktop or Docker Engine
- Git

## Local Development

1. Clone the repository:
   ```bash
   git clone https://github.com/ajaysingh3200/flask-docker-webapp.git
   cd flask-docker-webapp
   ```

2. Set up Python virtual environment (optional but recommended):
   ```bash
   python -m venv venv
   # On Windows
   .\venv\Scripts\activate
   # On Unix/MacOS
   source venv/bin/activate
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Run the Flask app locally:
   ```bash
   python app.py
   ```
   The app will be available at http://localhost:5000

## Docker Development

### Building the Image

```bash
docker build -t my-webapp:v1.0 .
```

### Running the Container

```bash
docker run -d -p 8080:5000 --name my-webapp my-webapp:v1.0
```

### Development with Docker Compose (Future Enhancement)

Consider adding a `docker-compose.yml` file for easier development setup, especially when adding databases or other services.

## Testing

Currently, the application has a basic endpoint that returns a welcome message. Future enhancements could include:
- Unit tests
- Integration tests
- API tests

## Deployment

The application can be deployed to various platforms:

### Generic Cloud Deployment
1. Push the Docker image to a container registry
2. Pull and run on your cloud instance

### Specific Platform Instructions
- AWS: Deploy to ECS/EKS
- Azure: Deploy to AKS
- GCP: Deploy to GKE
- Heroku: Deploy using Heroku Container Registry

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Troubleshooting

Common issues and solutions:

1. Port already in use:
   ```bash
   docker stop my-webapp
   docker rm my-webapp
   ```

2. Image build fails:
   - Check Docker daemon is running
   - Verify Dockerfile syntax
   - Ensure all required files are present

## Security Considerations

- The Flask app runs in debug mode for development
- Consider adding HTTPS in production
- Review Python dependencies regularly
- Follow Docker security best practices