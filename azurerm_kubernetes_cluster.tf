resource "azurerm_kubernetes_cluster" "redisgeek" {
  name                = format("redisgeek-%s", random_string.aks_cluster_name.result)
  location            = azurerm_resource_group.redisgeek.location
  resource_group_name = azurerm_resource_group.redisgeek.name
  dns_prefix          = random_string.aks_cluster_name.result

  default_node_pool {
    name       = "default"
    node_count = 5
    vm_size    = "Standard_D4_v4"
  }

  identity {
    type = "SystemAssigned"
  }

}
