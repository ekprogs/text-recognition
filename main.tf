# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY A TEXT RECOGNITION FUNCTION TO AWS LAMBDA
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ----------------------------------------------------------------------------------------------------------------------
# AWS PROVIDER SETUP
# ----------------------------------------------------------------------------------------------------------------------

provider "aws" {
  region = "eu-west-1"
}

terraform {
  required_providers {
    archive = "~> 2.4.0"
  }
}

# ----------------------------------------------------------------------------------------------------------------------
# AWS LAMBDA EXPECTS A DEPLOYMENT PACKAGE
# A deployment package is a ZIP archive that contains your function code and dependencies.
# ----------------------------------------------------------------------------------------------------------------------

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/python/main.py"
  output_path = "${path.module}/python/main.py.zip"
}

# ----------------------------------------------------------------------------------------------------------------------
# DEPLOY THE LAMBDA FUNCTION
# ----------------------------------------------------------------------------------------------------------------------

module "lambda-function" {
  source  = "mineiros-io/lambda-function/aws"
  version = "~> 0.5.0"

  function_name = "text_recognition"
  description   = "Python Text Recognition Function"
  filename      = data.archive_file.lambda.output_path
  runtime       = "python3.8"
  handler       = "main.lambda_handler"
  timeout       = 30
  memory_size   = 128

  role_arn = module.iam_role.role.arn

  layer_arns = []

  module_tags = {
    Environment = "Dev"
  }
}

# ----------------------------------------------------------------------------------------------------------------------
# CREATE AN IAM LAMBDA EXECUTION ROLE WHICH WILL BE ATTACHED TO THE FUNCTION
# ----------------------------------------------------------------------------------------------------------------------

module "iam_role" {
  source  = "mineiros-io/iam-role/aws"
  version = "~> 0.6.0"

  name = "text_recognition"

  assume_role_principals = [
    {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  ]

  policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]

  tags = {
    Environment = "Dev"
  }
}