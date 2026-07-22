provider "aws" {
  region = var.region
}

module "ec2" {
  source = "./modules/ec2"
  ami = var.ami
  instance_type = var.instance_type
  name = var.name
}

module "s3" {
  source = "./modules/s3"
  bucket_name = var.bucket_name
}

module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"

  name = "tf-test-user"

  force_destroy           = true
  pgp_key                 = "keybase:test"
  password_reset_required = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-tf-testvpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_instance" "webserver" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnets[0]

  tags = {
    Name = "MyWebServer"
  }
  
}