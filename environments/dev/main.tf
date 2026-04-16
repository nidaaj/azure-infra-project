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