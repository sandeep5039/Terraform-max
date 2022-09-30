resource "azurerm_public_ip" "bastionip" {
  name                = "${var.prefix}-${var.env}-bastion-pip"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = "Static"

  tags = {
    environment = "Testing"
  }
}

resource "azurerm_network_interface" "bastion" {
  name                = "${var.prefix}-${var.env}-bastion-nic"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.bastion.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.bastionip.id
  }
}

resource "azurerm_linux_virtual_machine" "bastion" {
  name                = "${var.prefix}-${var.env}-bastion-machine"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  size                = var.bastionVmSize
  admin_username      = var.username
  network_interface_ids = [
    azurerm_network_interface.bastion.id,
  ]

  admin_ssh_key {
    username   = var.username
    public_key = file(var.pubKeyPath)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}