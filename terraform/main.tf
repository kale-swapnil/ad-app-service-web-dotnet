terraform {
  required_version = ">= 1.10.0"

  required_providers {
    azurerm = { 
        source = "hashicorp/azurerm"
        version = ">= 4.0.0"
    }
}

}
provider "azurerm" {
  features {  }
  subscription_id = var.subscription_id
}


resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.location
  
}

resource "azurerm_service_plan" "webplan" {
  name                = "aspappplan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "F1"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "aspapp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.webplan.location
  service_plan_id     = azurerm_service_plan.webplan.id

  site_config {}
}
