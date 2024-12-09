variable "scale_set" {
  description = "Configuration for the Virtual Machine Scale Set"
  type = object({
    rg_name        = string
    location       = string
    scale_name     = string
    admin_username = string
    sku            = string
    instances      = number

    admin_ssh_key = object({
      username             = string
      key_vault_secret_uri = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

    os_disk = object({
      storage_account_type = string
      caching              = string
    })

    network_interface = object({
      name    = string
      primary = bool
      ip_configuration = object({
        name      = string
        primary   = bool
        subnet_id = string
      })
    })
  })
}

variable "consume_key_vault" {
  description = "Configuration for consuming the Key Vault"
  type = object({
    key_vault_name        = string
    key_vault_rg_name     = string
    key_vault_secret_name = string
  })
}
