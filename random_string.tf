resource "random_string" "aks_cluster_name" {
  length  = 4
  number  = false
  special = false
  upper   = true
}

resource "random_string" "resource_group_name" {
  length  = 4
  special = false
}

resource "random_string" "storage_account_name" {
  length  = 4
  number  = false
  special = false
  upper   = false
}

resource "random_string" "storage_container_name" {
  length  = 4
  number  = false
  special = false
  upper   = false
}