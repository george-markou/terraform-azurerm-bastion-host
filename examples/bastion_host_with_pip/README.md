<h2>Usage</h2>
You can use this module in your Terraform configuration by including it as a module and providing the required input variables. Here is an example of how to use the module to create an Azure Bastion Host along with Public IP Address:

```hcl
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
```
<br></br>
<h2>Input Variables</h2>
This module requires the following inputs:

|Variable |	Description| Type|	Required|
|---|---|---|---|
|`resource_group_name`|	The name of the Resource Group where Bastion Host and Public IP should exist.|	string|	Yes|
|`location`|	Specifies the supported Azure location.|	string|	Yes|
|`pip_name`|	Specifies the name of the Public IP.|	string|	Yes|
|`bastion_name`|	Specifies the name of the Bastion Host.|	string|	Yes|
| `subnet_id`| Reference to a subnet in which this Bastion Host has been created. | string| Yes|
| `copy_paste_enabled`| Is Copy/Paste feature enabled for the Bastion Host. Defaults to true.| bool| No|
| `file_copy_enabled`| Is File Copy feature enabled for the Bastion Host. Defaults to false.| bool| No|
| `ip_connect_enabled`|Is IP Connect feature enabled for the Bastion Host. Defaults to false.| bool| No|
| `shareable_link_enabled`|Is Shareable Link feature enabled for the Bastion Host. Defaults to false.| bool| No|
| `tunneling_enabled`|Is Tunneling feature enabled for the Bastion Host. Defaults to false.| bool| No|
| `sku`| The SKU of the Bastion Host. Accepted values are Basic and Standard. Defaults to Basic. | string| No|
|`tags`|	A map of tags to apply to the resources created by this module.|	map(string)|	No|

<h2>Output Values</h2>
This module exports the following outputs:

|Output|	Description|
|---|---|
|`bastion_name`|	The name of the bastion resource.|
|`bastion_id`|	The ID of the Bastion Host.|
|`dns_name`|	The FQDN for the Bastion Host.|
|`pip_id`|	The FQDN for the Bastion Host.|
|`pip_address`|	The IP address value that was allocated.|
