resource "azurerm_lb" "this" {
  name                = var.load_balancer_config.name
  location            = var.load_balancer_config.location
  resource_group_name = var.load_balancer_config.resource_group_name
  sku                 = var.load_balancer_config.sku

  frontend_ip_configuration {
    name                 = var.load_balancer_config.rule.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.this.id
  }
}

resource "azurerm_public_ip" "this" {
  name                = var.load_balancer_config.public_ip.name
  location            = var.load_balancer_config.location
  resource_group_name = var.load_balancer_config.resource_group_name
  allocation_method   = var.load_balancer_config.public_ip.allocation_method
  sku                 = var.load_balancer_config.public_ip.sku
}

resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = var.load_balancer_config.backend_pool.name
}

resource "azurerm_lb_probe" "this" {
  loadbalancer_id     = azurerm_lb.this.id
  name                = var.load_balancer_config.health_probe.name
  protocol            = var.load_balancer_config.health_probe.protocol
  port                = var.load_balancer_config.health_probe.port
  interval_in_seconds = var.load_balancer_config.health_probe.interval_in_seconds
  number_of_probes    = var.load_balancer_config.health_probe.number_of_probes
}

resource "azurerm_lb_rule" "this" {
  loadbalancer_id                = azurerm_lb.this.id
  name                           = var.load_balancer_config.rule.name
  protocol                       = var.load_balancer_config.rule.protocol
  frontend_port                  = var.load_balancer_config.rule.frontend_port
  backend_port                   = var.load_balancer_config.rule.backend_port
  frontend_ip_configuration_name = var.load_balancer_config.rule.frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.this.id]
  probe_id                       = azurerm_lb_probe.this.id
}
