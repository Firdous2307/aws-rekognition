provider "aws" {
  region = var.region
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = var.latest_ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.ec2_instance_name
  }

  user_data = var.ec2_user_data
}

resource "aws_network_interface_attachment" "test" {
  instance_id          = aws_instance.ec2_instance.id
  network_interface_id = data.aws_subnet.selected.id
  device_index         = 0
}
