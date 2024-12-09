module "scale_set" {
  source = "./modules/scale_set"

  scale_set = {
    scale_name   = "example-scale-set"
    rg_name      = "example-rg"
    location     = "eastus"
    sku          = "Standard_DS1_v2"
    instances    = 2
    admin_username = "adminuser"
    admin_ssh_key = {
      username   = "adminuser"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
    os_disk = {
      storage_account_type = "Standard_LRS"
      caching              = "ReadWrite"
    }
    network_interface = {
      name    = "nic-name"
      primary = true
      ip_configuration = {
        name      = "ipconfig-name"
        primary   = true
        subnet_id = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Network/virtualNetworks/xxx/subnets/xxx"
      }
    }
  }

  use_key_vault = false
  public_key    = "ssh-rsa AAAA..."
}

###################33 

