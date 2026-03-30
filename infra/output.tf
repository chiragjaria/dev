output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "kv_name" {
  value = azurerm_key_vault.kv.name
}

output "db_name" {
  value = azurerm_postgresql_flexible_server.db.name
}
