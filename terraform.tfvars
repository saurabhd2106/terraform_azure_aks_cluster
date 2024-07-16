resource_group_name = "rg-demo"
subnet_configuration = {
  ingress = "10.64.4.0/24"
  nodes   = "10.64.0.0/22"
}
vnet_address_space = ["10.64.0.0/16"]
location = "eastus"
vnet_name = "vnet-demo"