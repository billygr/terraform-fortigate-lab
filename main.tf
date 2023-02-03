// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "terraform-fortigate-lab"
  location = var.location

  tags = {
    environment = "Terraform Single FortiGate"
  }
}
