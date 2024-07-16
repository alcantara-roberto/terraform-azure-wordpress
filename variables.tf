variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "rg-terraform-wordpress"
}

variable "location" {
  description = "The Azure region to deploy the resources"
  default     = "East US"
}

variable "admin_username" {
  description = "The admin username for the VM"
  default     = "adminuser"
}

variable "admin_password" {
  description = "The admin password for the VM"
  default     = "Password1234!"
}
