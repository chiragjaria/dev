terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location
}

# Key Vault
resource "azurerm_key_vault" "kv" {
  name                        = var.kv_name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = "f9619075-6411-4bf8-8c43-c9b10b59452b"
  sku_name                    = "standard"
}

# AKS
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aksdns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

# PostgreSQL Flexible Server
resource "azurerm_postgresql_flexible_server" "db" {
  name                = var.db_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  sku_name   = "GP_Standard_D2s_v3"
  storage_mb = 32768
  version    = "14"
  public_network_access_enabled = false
}
