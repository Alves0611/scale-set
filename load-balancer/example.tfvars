load_balancer_config = {
  name                = "example-lb"
  location            = "eastus"
  resource_group_name = "example-resource-group"
  sku                 = "Standard"

  public_ip = {
    name              = "example-public-ip"
    allocation_method = "Static"
    sku               = "Standard"
  }

  backend_pool = {
    name = "example-backend-pool"
  }

  health_probe = {
    name                = "example-probe"
    protocol            = "Tcp"
    port                = 80
    interval_in_seconds = 5
    number_of_probes    = 2
  }

  rule = {
    name                           = "example-rule"
    protocol                       = "Tcp"
    frontend_port                  = 80
    backend_port                   = 80
    frontend_ip_configuration_name = "PublicIPConfig"
  }
}
