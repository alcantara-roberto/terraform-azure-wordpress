variable "resource_group_name" {
  default = "rg-terraform-wordpress"
}

variable "location" {
  default = "eastus"
}

variable "admin_username" {
  default = "adminuser"
}

variable "admin_password" {
  default = "AdminPass1234!"
}

variable "vm_size" {
  default = "Standard_B2s" # Tamanho da VM ajustado para um SKU diferente
}




