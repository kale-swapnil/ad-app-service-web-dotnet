variable "resource_group_name" {
  type = string
  description = "value for the resource group name"
}

variable "location" {
  type = string
  description = "value for the location"
  
}

variable "subscription_id" {
  type = string
  description = "value for the subscription id"
  default = "000000-0000-0000-0000-000000000000"
}