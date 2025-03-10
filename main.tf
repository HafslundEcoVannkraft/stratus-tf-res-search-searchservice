data "azapi_resource" "rg" {
  type        = "Microsoft.Resources/resourceGroups@2021-04-01"
  resource_id = var.rg_id
}

resource "azapi_resource" "search_service" {
  type      = "Microsoft.Search/searchServices@2024-06-01-preview"
  parent_id = var.rg_id
  name      = var.search_service_name
  location  = var.location
  count     = var.lifecycle_ignore_tag_changes ? 0 : 1
  identity {
    type         = "SystemAssigned"
    identity_ids = []
  }
  body = {
    properties = {
      disableLocalAuth                = true
      disabledDataExfiltrationOptions = []
      encryptionWithCmk = {
        enforcement = "Disabled"
      }
      hostingMode = "default"
      networkRuleSet = {
        bypass  = var.network_rule_set_bypass
        ipRules = var.ip_rules
      }
      partitionCount      = 1
      publicNetworkAccess = var.public_network_access
      replicaCount        = 1
      semanticSearch      = "disabled"
    }
    sku = {
      name = var.sku
    }
  }
}

resource "azapi_resource" "search_service_ignore_tag_changes" {
  type      = "Microsoft.Search/searchServices@2024-06-01-preview"
  parent_id = var.rg_id
  name      = var.search_service_name
  location  = var.location
  count     = var.lifecycle_ignore_tag_changes ? 1 : 0
  identity {
    type         = "SystemAssigned"
    identity_ids = []
  }
  body = {
    properties = {
      disableLocalAuth                = true
      disabledDataExfiltrationOptions = []
      encryptionWithCmk = {
        enforcement = "Disabled"
      }
      hostingMode = "default"
      networkRuleSet = {
        bypass  = var.network_rule_set_bypass
        ipRules = var.ip_rules
      }
      partitionCount      = 1
      publicNetworkAccess = var.public_network_access
      replicaCount        = 1
      semanticSearch      = "disabled"
    }
    sku = {
      name = var.sku
    }
  }

  lifecycle {
    ignore_changes = [tags]
  }
}
