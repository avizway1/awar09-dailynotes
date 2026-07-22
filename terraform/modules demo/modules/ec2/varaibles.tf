variable "ami" {
  description = "THe AMI to use for ec2 instance"
  type = string
}

variable "instance_type" {
  description = "The type of instance to use"
  type = string
}

variable "name" {
  description = "The name to use for the instance"
  type = string
}