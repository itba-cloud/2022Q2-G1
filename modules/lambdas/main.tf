module "lambda_functions" {
  for_each = {for lambda in var.lambdas: lambda.function_name => lambda}

  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 4.2.0"

  use_existing_cloudwatch_log_group = false
  create_role                       = false


  function_name = "${each.value.function_name}"
  description   = "${each.value.description}"
  handler       = "${each.value.handler}"
  runtime       = "${each.value.runtime}"

  vpc_subnet_ids         = var.vpc_subnet_ids
  vpc_security_group_ids = var.vpc_security_group_ids

  lambda_role = var.lambda_role
  source_path = "${each.value.source_path}"
}