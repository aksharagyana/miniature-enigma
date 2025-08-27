{
  "Name": "AKS-Postgres-ACR-Storage-LogAnalytics-Operator",
  "IsCustom": true,
  "Description": "Can provision AKS, Azure PostgreSQL Flexible Server, ACR, Storage (Blob+Queue), and Log Analytics Workspace only.",
  "Actions": [
    // AKS
    "Microsoft.ContainerService/managedClusters/*",

    // PostgreSQL Flexible Server
    "Microsoft.DBforPostgreSQL/flexibleServers/*",
    "Microsoft.DBforPostgreSQL/flexibleServers/firewallRules/*",
    "Microsoft.DBforPostgreSQL/flexibleServers/configurations/*",

    // ACR
    "Microsoft.ContainerRegistry/registries/*",

    // Storage
    "Microsoft.Storage/storageAccounts/*",

    // Log Analytics
    "Microsoft.OperationalInsights/workspaces/*",

    // Supporting operations (network, monitoring, private endpoints)
    "Microsoft.Network/virtualNetworks/subnets/join/action",
    "Microsoft.Network/privateEndpoints/*",
    "Microsoft.Network/privateDnsZones/*",
    "Microsoft.Insights/diagnosticSettings/*"
  ],
  "NotActions": [],
  "AssignableScopes": [
    "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP_NAME>"
  ]
}
