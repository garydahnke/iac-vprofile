terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.25.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23.0"
    }
  }

  # When you run terraform, and terraform is applied, it will create the terraform.st file locally
  # on the system where the terraform is applied if this S3 backend is not set up. Other, the terraform.st
  # would be stored in the S3 bucket if this S3 backend is set up. Need to centralize the the terraform.st
  # file so multiple individuals can access it to keep everyone in sync.
  backend "s3" {
    bucket = "gd-devop-gitops-vprofile-actions"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }

  required_version = "~> 1.6.3"
}
##
##
##
