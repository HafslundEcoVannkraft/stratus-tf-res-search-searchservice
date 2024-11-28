<!-- BEGIN_TF_DOCS -->
# Stratus Terraform Verified Module Search Service Module

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (>2.0.0)

## Resources

The following resources are used by this module:

- [azapi_resource.private_endpoint](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) (resource)
- [azapi_resource.search_service](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) (resource)
- [azapi_resource.rg](https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/resource) (data source)
- [azapi_resource.vnets](https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/resource) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_location"></a> [location](#input\_location)

Description: Location of the search service. Defaults to resource group location.

Type: `string`

### <a name="input_pe_subnets"></a> [pe\_subnets](#input\_pe\_subnets)

Description: List of subnets to create private endpoints for

Type: `list(string)`

### <a name="input_rg_id"></a> [rg\_id](#input\_rg\_id)

Description: Resource group id

Type: `string`

### <a name="input_search_service_name"></a> [search\_service\_name](#input\_search\_service\_name)

Description: Name of the search service

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules)

Description: List of ip rules

Type: `list(string)`

Default: `[]`

### <a name="input_sku"></a> [sku](#input\_sku)

Description: The SKU of the search service

Type: `string`

Default: `"basic"`

## Outputs

The following outputs are exported:

### <a name="output_identity"></a> [identity](#output\_identity)

Description: n/a

### <a name="output_search_service_resource_id"></a> [search\_service\_resource\_id](#output\_search\_service\_resource\_id)

Description: n/a

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
<!-- END_TF_DOCS -->