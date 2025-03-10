# variabel lifecycle_ignore_tag_changes kan være true eller false.
# Hvis den er true, blir det lagd search_service_ignore_tag_changes 
# Hvis den er false, blir det lagd search_service

output "search_service_resource_id" {
  value = var.lifecycle_ignore_tag_changes == true ? azapi_resource.search_service_ignore_tag_changes[0].id : azapi_resource.search_service[0].id
}

output "identity" {
  value = var.lifecycle_ignore_tag_changes == true ? azapi_resource.search_service_ignore_tag_changes[0].identity : azapi_resource.search_service[0].identity
}