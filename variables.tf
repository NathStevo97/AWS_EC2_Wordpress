variable "vpc_cidr" {
  type = string
}

variable "region" {
  type = string
}

variable "availability_zone_map" {
  type = map(any)
}
variable "resource_name_prefix" {
  type = string
}

variable "db_name" {
  type        = string
  description = "The database name"
}
variable "db_pass" {
  type        = string
  description = "The database password"
}

variable "db_user" {
  type        = string
  description = "The database user"
}

variable "aws_ami_id" {
  type        = string
  description = "Custom AMI ID by Packer"
}