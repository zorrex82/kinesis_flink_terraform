## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | ../name_convention | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_glue_catalog_database.glue_catalog_database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_catalog_database_description"></a> [catalog\_database\_description](#input\_catalog\_database\_description) | n/a | `string` | `"Database for Glue Data Catalog."` | no |
| <a name="input_catalog_id"></a> [catalog\_id](#input\_catalog\_id) | Database Glue Catalog ID. The default is the AWS Account ID. | `string` | n/a | yes |
| <a name="input_company"></a> [company](#input\_company) | Company name | `string` | `"company"` | no |
| <a name="input_create_table_default_permission"></a> [create\_table\_default\_permission](#input\_create\_table\_default\_permission) | Creates a series of default permissions for tables. | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment where the resource should be created | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Variables to compose the data catalog name. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"poc"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | n/a |
