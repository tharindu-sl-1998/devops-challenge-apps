variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "wp"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "main"
} 