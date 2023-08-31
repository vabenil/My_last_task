output "prefix" {
  value = "${var.name_prefix}"
}

output "server_ami" {
  value = var.image
}

output "key_pair_id" {
  value = data.aws_key_pair.keypair.id
}
