variable "resource_group_name" {
  type    = string
  default = "rg-terraform-wordpress"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "admin_username" {
  type    = string
  default = "adminuser"
}

variable "admin_password" {
  type    = string
  default = "Password123!"
}
