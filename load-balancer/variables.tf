variable "load_balancer_config" {
  description = "Configuration for the Azure Load Balancer"
  type = object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string

    public_ip = object({
      name              = string
      allocation_method = string
      sku               = string
    })

    backend_pool = object({
      name = string
    })

    health_probe = object({
      name                = string
      protocol            = string
      port                = number
      interval_in_seconds = number
      number_of_probes    = number
    })

    rule = object({
      name                           = string
      protocol                       = string
      frontend_port                  = number
      backend_port                   = number
      frontend_ip_configuration_name = string
    })
  })
}
