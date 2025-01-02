# DevOps Technical Assessment Solution

This repository contains the solution for the DevOps Technical Assessment, implementing a complete infrastructure setup for a web application and API using Azure cloud services.

## Project Structure

```
├── terraform/
│   ├── modules/
│   │   ├── aks/
│   │   ├── acr/
│   │   ├── cosmosdb/
│   │   └── vm/
│   └── main/
├── docker/
│   ├── webapp/
│   └── api/
├── scripts/
│   ├── setup.sh
│   └── deploy.sh
├── kubernetes/
│   ├── webapp/
│   └── api/
└── docs/
    ├── architecture.md
    └── standards.md
```

## Prerequisites

- Azure Subscription
- GitHub Account
- Azure CLI
- Terraform
- Docker
- kubectl

## Implementation Details

### Infrastructure Components

- Azure Kubernetes Service (AKS) for container orchestration
- Azure Container Registry (ACR) for Docker image storage
- Azure CosmosDB for database
- Azure Virtual Machine for additional tasks
- Azure Virtual Network for network isolation

### Features

- Containerized Web App and API
- Infrastructure as Code using Terraform
- Automated CI/CD using GitHub Actions
- SSL/TLS configuration
- Nginx reverse proxy setup
- Monitoring implementation

## Getting Started

1. Clone this repository
2. Follow setup instructions in docs/setup.md
3. Review architecture documentation in docs/architecture.md

## Standards and Best Practices

- Infrastructure follows Azure Well-Architected Framework
- GitFlow branching strategy
- Semantic versioning
- Infrastructure modularization
- Security best practices

## Documentation

Detailed documentation can be found in the `docs/` directory:
- Architecture Design
- Project Standards
- Setup Guide
- Monitoring Guide 