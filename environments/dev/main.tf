module "resource_group" {
  source              = "../../modules/resource-group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source              = "../../modules/network"
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = var.address_space
  subnet_prefixes     = var.subnet_prefixes
}

module "nsg" {
  source              = "../../modules/nsg"
  nsg_name            = var.nsg_name
  location            = var.location
  resource_group_name = module.resource_group.name
}

module "storage" {
  source               = "../../modules/storage"
  storage_account_name = var.storage_account_name
  resource_group_name  = module.resource_group.name
  location             = var.location
}

module "vm" {
  source              = "../../modules/vm"
  public_ip_name      = var.public_ip_name
  nic_name            = var.nic_name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  location            = var.location
  resource_group_name = module.resource_group.name
  subnet_id           = module.network.subnet_id
  nsg_id              = module.nsg.nsg_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}