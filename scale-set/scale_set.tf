resource "azurerm_linux_virtual_machine_scale_set" "example" {
  name                = var.scale_set.scale_name
  resource_group_name = var.scale_set.rg_name
  location            = var.scale_set.location
  sku                 = var.scale_set.sku
  instances           = var.scale_set.instances
  admin_username      = var.scale_set.admin_username

  admin_ssh_key {
    username   = var.scale_set.admin_ssh_key.username
    public_key = data.azurerm_key_vault_secret.ssh_key.value
  }

  source_image_reference {
    publisher = var.scale_set.source_image_reference.publisher
    offer     = var.scale_set.source_image_reference.offer
    sku       = var.scale_set.source_image_reference.sku
    version   = var.scale_set.source_image_reference.version
  }

  os_disk {
    storage_account_type = var.scale_set.os_disk.storage_account_type
    caching              = var.scale_set.os_disk.caching
  }

  network_interface {
    name    = var.scale_set.network_interface.name
    primary = var.scale_set.network_interface.primary

    ip_configuration {
      name      = var.scale_set.network_interface.ip_configuration.name
      primary   = var.scale_set.network_interface.ip_configuration.primary
      subnet_id = var.scale_set.network_interface.ip_configuration.subnet_id
    }
  }
}
