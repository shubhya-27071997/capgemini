variable "ami" {
  description = "inserting ami values to main"
  type = string
  default = "ami-0ebfd941bbafe70c6"
}

variable "instance_type" {
  description = "inserting instance type to main"
  type = string
  default = "t2.micro"
}

variable "key" {
  description = "inserting key to main"
  type = string
  default = "aws_key"
}