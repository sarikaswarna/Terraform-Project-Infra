terraform {
    required_providers {
    aws =   {
      source = "hashicorp/aws"
      version = "4.33.0"
    }
    }

# creating the s3 bucket backend
   backend "s3" {
   bucket = "terraform-project-bucket1"
   key    = "state"
   region = "us-east-2"
   }
}

# configure the AWS provider
provider "aws" {
    region = var.region
}

# crating the VPC

resource "aws_vpc" "sarika-vpc" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "sarika-vpc"
  }
}

          