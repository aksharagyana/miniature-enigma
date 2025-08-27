resource "azurerm_role_definition" "custom_aks_pgsql_acr_storage_log" {
  name        = "AKS-Postgres-ACR-Storage-LogAnalytics-Operator"
  scope       = data.azurerm_resource_group.target.id
  description = "Can provision AKS, PostgreSQL Flexible Server, ACR, Storage (Blob+Queue), and Log Analytics Workspace only."

  permissions {
    actions = [
      # AKS
      "Microsoft.ContainerService/managedClusters/*",

      # PostgreSQL Flexible Server
      "Microsoft.DBforPostgreSQL/flexibleServers/*",
      "Microsoft.DBforPostgreSQL/flexibleServers/firewallRules/*",
      "Microsoft.DBforPostgreSQL/flexibleServers/configurations/*",

      # ACR
      "Microsoft.ContainerRegistry/registries/*",

      # Storage
      "Microsoft.Storage/storageAccounts/*",

      # Log Analytics
      "Microsoft.OperationalInsights/workspaces/*",

      # Supporting
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/privateEndpoints/*",
      "Microsoft.Network/privateDnsZones/*",
      "Microsoft.Insights/diagnosticSettings/*",
      "Microsoft.ManagedIdentity/userAssignedIdentities/*"
    ]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_resource_group.target.id
  ]
}
