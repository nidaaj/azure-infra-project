output "resource_group_name" {
  value = module.resource_group.name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "nsg_name" {
  value = module.nsg.nsg_name
}

output "nsg_id" {
  value = module.nsg.nsg_id
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "vm_public_ip" {
  value = module.vm.public_ip_address
}