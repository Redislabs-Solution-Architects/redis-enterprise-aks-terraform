locals {
  redisgeek_config = {
    client_certificate = azurerm_kubernetes_cluster.redisgeek.kube_config.0.client_certificate
    kube_config        = azurerm_kubernetes_cluster.redisgeek.kube_config_raw
  }
  rg           = azurerm_resource_group.redisgeek.name
  cluster_name = azurerm_kubernetes_cluster.redisgeek.name
}

output "redisgeek_config" {
  value     = jsonencode(local.redisgeek_config)
  sensitive = true
}

output "a_aks_get_credentials" {
  value       = "az aks get-credentials --resource-group  ${local.rg} --name ${local.cluster_name}"
  description = "command to get kube config via az aks cli"
}

output "b_namespace_setup" {
  value = "kubectl create namespace redisgeek"
}

output "c_namespace_config" {
  value = "kubectl config set-context --current --namespace=redisgeek"
}

output "d_apply_bundle" {
  value = "kubectl apply -f k8s/bundle.yaml"
}

output "e_apply_rec" {
  value = "kubectl apply -f k8s/rec.yaml"
}

output "e_apply_redb" {
  value = "kubectl apply -f k8s/redb.yaml"
}

output "f_redb_secret" {
  value = "kubectl get secret/redb-rec -o yaml"
}

output "g_rec_creds" {
  value = "kubectl get secret rec -o jsonpath='{.data.username}' | base64 --decode"
}

output "h_rec_pass" {
  value = "kubectl get secret rec -o jsonpath='{.data.password}' | base64 --decode"
}

output "i_service_rec-ui" {
  value = "kubectl get service/rec-ui -o yaml"
}

output "j_port_forward_ui" {
  value ="kubectl port-forward service/rec-ui 8085:8443"
}