# API Documentation

This document provides detailed information about the Flask Docker Webapp's API endpoints.

## Base URL

When running locally:
- Development: `http://localhost:5000`
- Docker: `http://localhost:8080`

## API Endpoints

### GET /

Returns a welcome message.

```http
GET /
```

#### Response

```json
200 OK
Content-Type: text/plain

Hello from Flask in Docker!
```

## Future API Endpoints

The following endpoints are planned for future implementation:

### Health Check Endpoint

```http
GET /health
```

Expected Response:
```json
{
    "status": "healthy",
    "version": "1.0.0",
    "timestamp": "2025-10-30T12:00:00Z"
}
```

### API Version Endpoint

```http
GET /api/version
```

Expected Response:
```json
{
    "version": "1.0.0",
    "api_version": "v1",
    "flask_version": "2.3.2"
}
```

## Error Handling

### Standard Error Response Format

```json
{
    "error": {
        "code": "ERROR_CODE",
        "message": "Human readable error message",
        "details": {}
    }
}
```

### Common Error Codes

- `400 Bad Request`: Invalid request parameters
- `404 Not Found`: Resource not found
- `500 Internal Server Error`: Server-side error

## Rate Limiting

Currently, no rate limiting is implemented. Future versions will include:
- Rate limiting by IP
- API key-based rate limiting
- Custom headers for rate limit status

## Authentication & Authorization

Future implementations will support:
- API key authentication
- JWT tokens
- OAuth2 integration

## Request/Response Headers

### Current Headers

```http
Content-Type: text/plain
```

### Planned Headers

```http
Content-Type: application/json
X-Rate-Limit-Limit: 100
X-Rate-Limit-Remaining: 99
X-Rate-Limit-Reset: 1635591234
```

## API Versioning

Future API versions will be accessible via URL versioning:
- `/api/v1/...`
- `/api/v2/...`

## Testing the API

Using cURL:
```bash
# Basic endpoint
curl http://localhost:8080

# With headers (future)
curl -H "Content-Type: application/json" http://localhost:8080/api/v1/health
```

Using PowerShell:
```powershell
Invoke-WebRequest -Uri 'http://localhost:8080' -Method GET
```

## Monitoring & Logging

Future versions will include:
- Prometheus metrics endpoint at `/metrics`
- OpenTelemetry integration
- Structured logging output

## API Changes & Deprecation Policy

- API versions will be supported for minimum 12 months
- Deprecation notices will be provided 3 months in advance
- Breaking changes will only be introduced in major versions