scale_set = {
  rg_name        = "example-resource-group"
  location       = "eastus"
  scale_name     = "example-vmss"
  sku            = "Standard_F2"
  instances      = 1
  admin_username = "adminuser"

  admin_ssh_key = {
    username   = "adminuser"
  }

  source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk = {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface = {
    name    = "example"
    primary = true
    ip_configuration = {
      name      = "internal"
      primary   = true
      subnet_id = "/subscriptions/.../subnets/internal"
    }
  }
}
