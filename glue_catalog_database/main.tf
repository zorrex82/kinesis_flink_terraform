resource "aws_glue_catalog_database" "glue_catalog_database" {
  name        = local.name
  description = var.catalog_database_description
  catalog_id  = var.catalog_id

  dynamic "create_table_default_permission" {
    for_each = var.create_table_default_permission != null ? [true] : []

    content {
      permissions = try(var.create_table_default_permission.permissions, null)

      dynamic "principal" {
        for_each = try(var.create_table_default_permission.principal, null) != null ? [true] : []

        content {
          data_lake_principal_identifier = try(var.create_table_default_permission.principal.data_lake_principal_identifier, null)
        }
      }
    }
  }

}