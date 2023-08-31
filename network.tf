# Get aws vpc
data "aws_vpc" "private_cloud" {
  id = var.vpc_id
}

data "aws_route_table" "rtb" {
  route_table_id = var.rtb_id
}

# Create subnet
# resource "aws_subnet" "private_network" {
#   vpc_id = data.aws_vpc.private_cloud.id
#   cidr_block = var.private_network_cidr

#   map_public_ip_on_launch = true

#   tags = {
#     Name = "${var.name_prefix}-private_network"
#   }
# }

# Create a route table association
# resource "aws_route_table_association" "private_network_rt_a" {
#   subnet_id      = var.subnet_id
#   route_table_id = data.aws_route_table.rtb.id
# }
