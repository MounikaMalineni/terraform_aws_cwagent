terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.44.0"
    }
  }
}

provider "aws" {
  # Configuration options
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "vscode"
}