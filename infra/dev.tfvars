
resource_group_name = data.azurerm_resource_group.rg.name
location            = data.azurerm_resource_group.rg.location

aks_name = "aks-mes-dev"
kv_name  = "kvmesdev123"
db_name  = "pgmesdev123"

admin_username = "pgadmin"
admin_password = "Test@12345"
