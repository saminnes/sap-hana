variable "subscription-id" {
  description = "Enter Subscription ID for provisioning resources in Azure"
}
variable "client-id" {
  description = "Enter appId"
}
variable "client-secret" {
  description = "Enter Client secret (password)"
}
variable "tenant-id" {
  description = "Enter tenancy ID for the AAD tenancy"
}
#################################################################
#   Variables
#################################################################

# Generic info
variable resource_group_name {
  description = "The name of the Resource Group where the VM is"
}
variable location {
  description = "The Azure Region in which the Resource Group exists"
}

# Active Directory & Domain Controller
variable vmname {
  description = "The Virtual Machine name that you wish to join to the domain"
}

variable "active_directory_domain" {
  description = "The name of the Active Directory domain, for example `consoto.local`"
}

variable "admin_password" {
  description = "The password associated with the local administrator account on the virtual machine"
}

variable "active_directory_netbios_name" {
  description = "The netbios name of the Active Directory domain, for example `consoto`"
}
