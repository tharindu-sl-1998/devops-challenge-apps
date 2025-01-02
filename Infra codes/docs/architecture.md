# Architecture Design

## System Overview
The system consists of three main components:
1. Web Application (Frontend)
2. API Service (Backend)
3. Database (CosmosDB)

## Infrastructure Components

### Azure Resources
1. **Resource Group**: `wp-rg-main-001`
   - Contains all project resources

2. **AKS Cluster**: `wp-aks-main-001`
   - Hosts containerized applications
   - Node pools for application workloads
   - Integrated with Azure CNI

3. **Azure Container Registry**: `wpacrmain001`
   - Stores Docker images
   - Integrated with AKS

4. **CosmosDB**: `wp-cosmos-main-001`
   - Database for application data
   - MongoDB API compatibility

5. **Virtual Network**: `wp-vnet-main-001`
   - Network segmentation
   - Subnet configuration for AKS and other resources

6. **Virtual Machine**: `wp-vm-main-001`
   - For additional tasks and management

### Network Architecture
```
Virtual Network (10.0.0.0/16)
├── AKS Subnet (10.0.0.0/22)
├── VM Subnet (10.0.4.0/24)
└── Database Subnet (10.0.5.0/24)
```

## Application Components

### Web Application
- Containerized Node.js application
- Served via Nginx
- SSL/TLS enabled
- Domain: web.example.com

### API Service
- Containerized Node.js API
- RESTful endpoints
- SSL/TLS enabled
- Domain: api.example.com

### Database
- CosmosDB with MongoDB API
- Automated backups
- Geo-redundancy enabled

## Security Architecture
- Azure AD integration
- Network Security Groups
- Azure Key Vault for secrets
- SSL/TLS encryption
- Pod identity for AKS 