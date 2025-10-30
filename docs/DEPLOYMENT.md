# Deployment Guide

This guide covers deploying the Flask Docker webapp to various cloud platforms and environments.

## Table of Contents

- [Prerequisites](#prerequisites)
- [General Deployment Steps](#general-deployment-steps)
- [Cloud Platform Deployments](#cloud-platform-deployments)
  - [AWS Deployment](#aws-deployment)
  - [Azure Deployment](#azure-deployment)
  - [Google Cloud Platform](#google-cloud-platform)
- [Container Registry Setup](#container-registry-setup)
- [Environment Variables](#environment-variables)
- [SSL/TLS Configuration](#ssltls-configuration)
- [Monitoring & Logging](#monitoring--logging)

## Prerequisites

- Docker installed and configured
- Cloud provider CLI tools installed
- Access credentials for your cloud platform
- Domain name (for SSL/TLS)

## General Deployment Steps

1. Build the production image:
   ```bash
   docker build -t my-webapp:v1.0 .
   ```

2. Test the production build locally:
   ```bash
   docker run -d -p 8080:5000 --name my-webapp my-webapp:v1.0
   ```

3. Tag the image for your registry:
   ```bash
   docker tag my-webapp:v1.0 your-registry.com/my-webapp:v1.0
   ```

4. Push to container registry:
   ```bash
   docker push your-registry.com/my-webapp:v1.0
   ```

## Cloud Platform Deployments

### AWS Deployment

#### Amazon ECS (Elastic Container Service)

1. Install AWS CLI and configure credentials:
   ```bash
   aws configure
   ```

2. Create an ECR repository:
   ```bash
   aws ecr create-repository --repository-name my-webapp
   ```

3. Push to ECR:
   ```bash
   aws ecr get-login-password --region region | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region.amazonaws.com
   docker push aws_account_id.dkr.ecr.region.amazonaws.com/my-webapp:v1.0
   ```

4. Create ECS cluster:
   ```bash
   aws ecs create-cluster --cluster-name my-webapp-cluster
   ```

5. Create task definition (task-definition.json):
   ```json
   {
     "family": "my-webapp",
     "containerDefinitions": [{
       "name": "my-webapp",
       "image": "aws_account_id.dkr.ecr.region.amazonaws.com/my-webapp:v1.0",
       "memory": 512,
       "cpu": 256,
       "essential": true,
       "portMappings": [{
         "containerPort": 5000,
         "hostPort": 80
       }]
     }]
   }
   ```

6. Register task definition:
   ```bash
   aws ecs register-task-definition --cli-input-json file://task-definition.json
   ```

7. Create service:
   ```bash
   aws ecs create-service --cluster my-webapp-cluster --service-name my-webapp-service --task-definition my-webapp:1 --desired-count 2
   ```

### Azure Deployment

#### Azure Container Instances

1. Login to Azure:
   ```bash
   az login
   ```

2. Create resource group:
   ```bash
   az group create --name my-webapp-rg --location eastus
   ```

3. Create container registry:
   ```bash
   az acr create --resource-group my-webapp-rg --name mywebappregistry --sku Basic
   ```

4. Deploy container:
   ```bash
   az container create \
     --resource-group my-webapp-rg \
     --name my-webapp \
     --image mywebappregistry.azurecr.io/my-webapp:v1.0 \
     --dns-name-label my-webapp \
     --ports 80
   ```

### Google Cloud Platform

#### Google Kubernetes Engine (GKE)

1. Configure gcloud:
   ```bash
   gcloud init
   ```

2. Create GKE cluster:
   ```bash
   gcloud container clusters create my-webapp-cluster \
     --num-nodes=3 \
     --zone=us-central1-a
   ```

3. Deploy to GKE:
   ```bash
   kubectl apply -f kubernetes/deployment.yaml
   kubectl apply -f kubernetes/service.yaml
   ```

## Container Registry Setup

### Docker Hub

1. Login to Docker Hub:
   ```bash
   docker login
   ```

2. Push image:
   ```bash
   docker push username/my-webapp:v1.0
   ```

### Private Registry

1. Set up registry:
   ```bash
   docker run -d -p 5000:5000 --name registry registry:2
   ```

2. Push to private registry:
   ```bash
   docker push localhost:5000/my-webapp:v1.0
   ```

## Environment Variables

Production environment variables to configure:

```bash
FLASK_ENV=production
FLASK_DEBUG=0
PYTHONUNBUFFERED=1
```

## SSL/TLS Configuration

### Using Nginx as Reverse Proxy

1. Install Nginx
2. Configure SSL certificate
3. Example nginx.conf:
   ```nginx
   server {
       listen 443 ssl;
       server_name your-domain.com;

       ssl_certificate /etc/nginx/certs/fullchain.pem;
       ssl_certificate_key /etc/nginx/certs/privkey.pem;

       location / {
           proxy_pass http://localhost:8080;
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr;
       }
   }
   ```

## Monitoring & Logging

### Prometheus & Grafana Setup

1. Add Prometheus client to Flask app
2. Deploy Prometheus
3. Configure Grafana dashboards

### Log Aggregation

Example ELK Stack setup:
1. Deploy Elasticsearch
2. Configure Logstash
3. Set up Kibana dashboards

## Scaling Considerations

- Use load balancers
- Implement horizontal scaling
- Configure auto-scaling rules
- Monitor resource usage

## Backup and Disaster Recovery

1. Regular container image backups
2. Infrastructure as Code backups
3. Database backups (when added)
4. Documented recovery procedures

## Security Best Practices

1. Use HTTPS only in production
2. Implement WAF rules
3. Regular security updates
4. Access control implementation
5. Security monitoring