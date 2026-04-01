
variable "resource_group" {}
variable "location" {}
variable "aks_name" {}
variable "kv_name" {}
variable "db_name" {}
variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}
