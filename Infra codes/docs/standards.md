# Project Standards and Conventions

## Naming Conventions

### Resource Naming Pattern
`wp-<resource-type>-<environment>-<instance>`

Examples:
- AKS Cluster: `wp-aks-main-001`
- Container Registry: `wpacrmain001`
- Cosmos DB: `wp-cosmos-main-001`
- Virtual Machine: `wp-vm-main-001`
- Resource Group: `wp-rg-main-001`

### Branch Naming Convention
- Main branch: `main`
- Feature branches: `feature/wp-<feature-name>`
- Bugfix branches: `bugfix/wp-<bug-name>`
- Release branches: `release/wp-v<version>`

### Terraform Conventions
- All resources should be tagged with:
  - `project = "wp"`
  - `environment = "<env>"`
  - `managed_by = "terraform"`

### Docker Image Tags
- Format: `<service>:<version>`
- Example: `webapp:1.0.0`, `api:1.0.0`

## Best Practices

### Infrastructure
- Use Azure managed services when possible
- Implement proper network segmentation
- Enable monitoring and logging
- Use managed identities for authentication
- Implement proper backup and disaster recovery

### Security
- Follow the principle of least privilege
- Use Azure Key Vault for secrets
- Enable Azure Security Center
- Implement network security groups
- Use HTTPS/TLS for all communications

### CI/CD
- Implement automated testing
- Use infrastructure as code
- Implement automated deployments
- Use environment-specific configurations
- Implement proper access controls 