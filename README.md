<!-- BEGIN_TF_DOCS -->
# Stratus Terraform Verified Module Cognitive Deployment Module

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (>2.0.0)

## Resources

The following resources are used by this module:

- [azapi_resource.deployment](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_cognitive_account_id"></a> [cognitive\_account\_id](#input\_cognitive\_account\_id)

Description: ID of the parent cognitive account

Type: `string`

### <a name="input_cognitive_deployment_name"></a> [cognitive\_deployment\_name](#input\_cognitive\_deployment\_name)

Description: Name of the cognitive deployment

Type: `string`

### <a name="input_model_name"></a> [model\_name](#input\_model\_name)

Description: The name of the model

Type: `string`

### <a name="input_model_version"></a> [model\_version](#input\_model\_version)

Description: The version of the model

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_model_format"></a> [model\_format](#input\_model\_format)

Description: The format of the model

Type: `string`

Default: `"OpenAI"`

### <a name="input_sku"></a> [sku](#input\_sku)

Description: The SKU of the cognitive deployment

Type: `string`

Default: `"Standard"`

## Outputs

No outputs.

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
<!-- END_TF_DOCS -->