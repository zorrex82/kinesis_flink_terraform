variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

variable "company" {
  type        = string
  description = "Company name"
  default     = "company"
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "poc"
}


variable "environment" {
  type        = string
  description = "Environment where the resource should be created"
  validation {
    condition     = contains(["dev", "qa", "prd"], var.environment)
    error_message = "Environment where the resource should be created. Accepted values are: dev, qa, prd"
  }
}

variable "name" {
  type        = string
  description = "Variables to compose the data catalog name."
}

variable "catalog_database_description" {
  type    = string
  default = "Database for Glue Data Catalog."
}

variable "catalog_id" {
  type        = string
  description = "Database Glue Catalog ID. The default is the AWS Account ID."
}

variable "create_table_default_permission" {
  type        = any
  description = "Creates a series of default permissions for tables."
}

