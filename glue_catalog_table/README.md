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
| [aws_glue_catalog_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | Identification of Bucket S3. | `string` | n/a | yes |
| <a name="input_company"></a> [company](#input\_company) | Company name | `string` | `"company"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment where the resource should be created | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Variables to compose the data catalog name. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"poc"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |
| <a name="input_table_columns"></a> [table\_columns](#input\_table\_columns) | n/a | <pre>list(object({<br>    name    = string<br>    type    = string<br>    comment = string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
