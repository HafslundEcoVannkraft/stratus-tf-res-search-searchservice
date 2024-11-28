resource "azapi_resource" "deployment" {
  type      = "Microsoft.CognitiveServices/accounts/deployments@2024-10-01"
  parent_id = var.cognitive_account_id
  name      = var.cognitive_deployment_name
  body = {
    properties = {
      currentCapacity = 1
      model = {
        format  = var.model_format
        name    = var.model_name
        version = var.model_version
      }
      versionUpgradeOption = "OnceNewDefaultVersionAvailable"
    }
    sku = {
      capacity = 1
      name     = var.sku
    }
  }
}