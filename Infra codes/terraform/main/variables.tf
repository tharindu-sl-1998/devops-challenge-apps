variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "westeurope"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "main"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "wp"
}

variable "admin_ssh_public_key" {
  description = "The SSH public key for the VM admin user"
  type        = string
} 