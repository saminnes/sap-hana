variable "allow_ips" {
  description = "The ip addresses that will be allowed by the nsg"
  type        = list(string)
}

variable "az_region" {
}

variable "az_resource_group" {
  description = "Which Azure resource group to deploy the HANA setup into.  i.e. <myResourceGroup>"
}

variable "existing_nsg_name" {
  description = "The name of the pre-existing nsg that you would like to use"
  default     = ""
}

variable "existing_nsg_rg" {
  description = "The name of the pre-existing resource group that you would like to use"
  default     = ""
}

variable "install_xsa" {
  description = "Flag that determines whether to install XSA on the host"
  default     = false
}

variable "use_existing_nsg" {
  default     = false
  description = "When set to true, and the appropriate variables are provided, will use that nsg instead of creating a new one"
}

variable "sap_instancenum" {
  description = "The SAP instance number which is in range 00-99."
}

variable "sap_sid" {
  default = "PV1"
}
variable "vnet_ip_space" {
  default = "10.0.0.0/21"
}

locals {
  all_ips      = ["0.0.0.0/0"]
  empty_string = ""
  new_nsg_name = "${var.sap_sid}-nsg"

  // Structure for the rules will be: "rule_name,priority,destination_port_range"
  hana_xsc_rules = [
    "XSC-HTTP,103,80${var.sap_instancenum}",
    "XSC-HTTPS,104,43${var.sap_instancenum}",
  ]

  hana_xsa_rules = [
    "XSA-HTTP,105,4000-4999",
    "XSA,106,50000-59999",
  ]
}

