terraform {
  required_version = ">= 1.2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-demo-${random_id.suffix.hex}"
  location = "East US"
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-demo-${random_id.suffix.hex}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aksdemo"

  default_node_pool {
    name            = "agentpool"
    node_count      = 1
    min_count       = 1
    max_count       = 3
    enable_auto_scaling = true
    vm_size         = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = null  # null picks latest available
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
