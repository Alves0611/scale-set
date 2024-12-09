module "load_balancer" {
  source = "./modules/load_balancer"

  load_balancer_config = {
    name                = "my-load-balancer"
    location            = "eastus"
    resource_group_name = "my-resource-group"
    sku                 = "Standard"

    public_ip = {
      name             = "my-public-ip"
      allocation_method = "Static"
      sku              = "Standard"
    }

    backend_pool = {
      name = "my-backend-pool"
    }

    health_probe = {
      name                = "my-health-probe"
      protocol            = "Tcp"
      port                = 80
      interval_in_seconds = 5
      number_of_probes    = 2
    }

    rule = {
      name                           = "my-rule"
      protocol                       = "Tcp"
      frontend_port                  = 80
      backend_port                   = 80
      frontend_ip_configuration_name = "frontend-config"
    }
  }
}
