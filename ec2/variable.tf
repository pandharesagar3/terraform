variable "subnet_cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/18", "10.0.64.0/18", "10.0.128.0/18","10.0.192.0/18"]
}

variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for EC2 instances"
  type        = string
  default     = "ami-0cc9838aa7ab1dce7"
}

variable "instance_types" {
  description = "The types of EC2 instances to create"
  type        = list(string)
  default     = ["t2.micro", "t2.micro", "t2.micro","t2.micro"]
}


variable "availability_zones" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b","ap-south-1a"]
}

variable "aws_region" {
    default = "ap-south-1"
  
}