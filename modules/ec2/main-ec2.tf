/*





provider "aws" {
  region = var.region
}

data "aws_vpc" "existing_vpc" {
  id = var.vpc_id
}

data "aws_subnet" "existing_subnet" {
  vpc_id     = data.aws_vpc.existing_vpc.id
  cidr_block = var.subnet_cidr_block
}


resource "aws_instance" "ec2_instance" {
  ami           = var.latest_ami_id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.existing_subnet.id

  tags = {
    Name = var.ec2_instance_name
  }

  user_data = var.ec2_user_data
}

resource "aws_network_interface_attachment" "test" {
  instance_id          = aws_instance.ec2_instance.id
  network_interface_id = data.aws_subnet.existing_subnet.id
  device_index         = 0
}





*/
