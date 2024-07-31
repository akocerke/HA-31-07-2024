variable "vpc_id" {
  description = "The VPC ID where the EC2 instance will be launched"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "The list of security group IDs to assign to the EC2 instance"
  type        = list(string)
}
