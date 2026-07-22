variable "region" {
  type = string
  default = "ap-south-1"
}

variable "ami" {
  description = "THe AMI to use for ec2 instance"
  type = string
  default = "ami-0b910d1016287a5e7"
}

variable "instance_type" {
  description = "The type of instance to use"
  type = string
  default = "t3.micro"
}

variable "name" {
  description = "The name to use for the instance"
  type = string
}

variable "bucket_name" {
  description = "The name of the bucket to create"
  type = string
}