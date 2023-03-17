resource "aws_instance" "instance1" {
    ami = var.ami
    instance_type = var.instance_type
    tags = {
      Name = var.name_tag
    }
}
