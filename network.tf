resource "azurerm_virtual_network" "myrg-vnet" {
  name                = "${var.prefix}-${var.env}-vnet"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  address_space       = var.vnetCIDR
  dns_servers         = var.dnsServer



  tags = {
    environment = "var.env"
  }
}

resource "azurerm_subnet" "bastion" {
  name                 = "${var.prefix}-${var.env}-subnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myrg-vnet.name
  address_prefixes     = var.bastionCIDR
 }

 resource "azurerm_subnet" "web" {
  name                 = "${var.prefix}-${var.env}-web-subnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myrg-vnet.name
  address_prefixes     = var.webCIDR
 }

  resource "azurerm_subnet" "App" {
  name                 = "${var.prefix}-${var.env}-App-subnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myrg-vnet.name
  address_prefixes     = var.AppCIDR
 }

  resource "azurerm_subnet" "db" {
  name                 = "${var.prefix}-${var.env}-db-subnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myrg-vnet.name
  address_prefixes     = var.dbCIDR
 }

 resource "azurerm_subnet" "api" {
  name                 = "${var.prefix}-${var.env}-api-subnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myrg-vnet.name
  address_prefixes     = var.apiCIDR
 }
