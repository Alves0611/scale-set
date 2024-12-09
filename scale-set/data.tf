data "azurerm_key_vault" "example" {
  name                = var.consume_key_vault.key_vault_name
  resource_group_name = var.consume_key_vault.key_vault_rg_name
}

data "azurerm_key_vault_secret" "ssh_key" {
  name         = var.consume_key_vault.key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.example.id
}
