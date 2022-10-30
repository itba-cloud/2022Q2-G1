variable lambdas {
  type        = list(object({
    function_name = string
    description   = string
    handler       = string
    runtime       = string
    source_path   = string
  }))

  description = "Lambdas configuration to support business logic"
}

variable vpc_subnet_ids {
  type        = list(string)
  description = "List of VPC subnet IDs where lambdas will run"
}

variable vpc_security_group_ids {
  type        = list(string)
  description = "List of VPC security group IDs to use with lambdas"
}

variable lambda_role {
  type        = string
  description = "Role that will use the lambda. Always use LabRole."
}