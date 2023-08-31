data "aws_key_pair" "keypair" {
  key_pair_id = var.keypair_id
}

# data "aws_ami" "my_image" {
#   ami_id = var.image
# }
#
# TODO: use data to obtain subnet
# data 

resource "aws_security_group" "server_fw" {
  vpc_id = data.aws_vpc.private_cloud.id
  name = "${var.name_prefix}-server-fw"

  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 20
    to_port = 20
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 21
    to_port = 255
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0 # Ignore 
    to_port = 0 # Ignore 
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-server_fw"
  }
}

resource "aws_instance" "server" {
  count = 1
  ami = var.image
  instance_type = "t2.micro"

  key_name = data.aws_key_pair.keypair.key_name
  subnet_id = var.subnet_id
  security_groups = [aws_security_group.server_fw.id]

  tags = {
    Name = "${var.name_prefix}-instance"
  }
}
