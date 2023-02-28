module "bastion_host" {
  source                = "george-markou/bastion-host/azurerm"
  version               = "1.0.0""
  resource_group_name   = "my-resource-group"
  location              = "eastus"
  pip_name              = "my-bas-pip-01"
  bastion_name          = "my-bas-01"
  subnet_id             = "/subscriptions/<subcription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<vnet-name>/subnets/<subnet-name>"
  copy_paste_enabled    = true
  file_copy_enabled     = false
  ip_connect_enabled    = true
  shareable_link_enabled = true
  tunneling_enabled     = false
  sku                   = "Standard"
  tags = {
    "Environment" = "Production"
  }
}
