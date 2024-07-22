variable "resource_group_name" {
  default = "rg-terraform-wordpress"
}

variable "location" {
  default = "westeurope"
}

variable "admin_username" {
  default = "adminuser"
}

# senha passa a se tornar "GAud4mZby8F3SD6P" após a inicialização
variable "admin_password" {
  default = "AdminPass1234!"
}
