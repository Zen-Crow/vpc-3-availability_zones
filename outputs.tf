output "vpc_network_id" {
  value = yandex_vpc_network.this.id
}

output "subnet_id" {
  value = { for k, v in yandex_vpc_subnet.this : k => v.id }
}

output "security_group_id" {
  value = yandex_vpc_security_group.group.id
}
