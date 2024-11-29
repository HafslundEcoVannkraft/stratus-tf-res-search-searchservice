data "azapi_resource" "rg" {
  type        = "Microsoft.Resources/resourceGroups@2021-04-01"
  resource_id = var.rg_id
}

resource "azapi_resource" "search_service" {
  type      = "Microsoft.Search/searchServices@2024-06-01-preview"
  parent_id = var.rg_id
  name      = var.search_service_name
  #location  = var.location == "" ? data.azapi_resource.rg.location : var.location # couldn't make this work
  location = var.location
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
      publicNetworkAccess = var.pe_subnets == [] ? var.public_network_access : "Disabled"
      replicaCount        = 1
      semanticSearch      = "disabled"
    }
    sku = {
      name = var.sku
    }
  }
}

locals {
  pe_subnets_map = var.pe_subnets == null ? {} : {
    for subnet_id in var.pe_subnets : subnet_id => {
      subnet_id   = subnet_id
      subnet_name = split("/", subnet_id)[10]
      # vnet_id is subnet_id except for terms 9 and 10
      vnet_id             = join("/", slice(split("/", subnet_id), 0, 9))
      resource_group_name = split("/", subnet_id)[4]
    }
  }
}

# Data source to fetch subnet details
data "azapi_resource" "vnets" {
  for_each    = local.pe_subnets_map
  type        = "Microsoft.Network/virtualNetworks@2023-04-01"
  resource_id = each.value.vnet_id
}


resource "azapi_resource" "private_endpoint" {
  for_each  = local.pe_subnets_map
  type      = "Microsoft.Network/privateEndpoints@2023-04-01"
  name      = "${var.search_service_name}-pe-${data.azapi_resource.vnets[each.value.subnet_id].location}-${each.value.subnet_name}"
  parent_id = data.azapi_resource.rg.id
  location  = data.azapi_resource.vnets[each.value.subnet_id].location
  body = {
    properties = {
      subnet = {
        id = each.value.subnet_id
      }
      privateLinkServiceConnections = [
        {
          name = "searchService"
          properties = {
            privateLinkServiceId = azapi_resource.search_service.id
            groupIds             = ["searchService"]
          }
        }
      ]
    }
  }
  lifecycle {
    ignore_changes = [body.properties.private_dns_zone_group]
  }
}