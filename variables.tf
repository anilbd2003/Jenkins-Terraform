variable "ami" {
   type        = string
   description = "AMI ID of Ubuntu machine in N. Virginia Region"
   default     = "ami-0557a15b87f6559cf"
}

variable "instance_type" {
   type        = string
   description = "Instance type"
   default     = "t2.micro"
}

variable "name_tag" {
   type        = string
   description = "Name of the EC2 instance"
   default     = "My Ubuntu server"
}
