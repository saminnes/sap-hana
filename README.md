# sap-hana
Azure pipeline for sap-hana
Requires variables to be set, typically via variable groups with the following variables set (note: a lot of these are set multiple times) this can probably be cleaned up;

container-name <storage container for terraform state>
state-key <key for storage account>
storage-account <storage account ul>
access-key <key for storage account>
client-id <SPN ID>
client-secret <SPN PWD>
subscription-id <SUB ID>
tenant-id <Tennant ID>
ARM_CLIENT_ID <SPN ID>
ARM_CLIENT_SECRET <SPN PWD>
ARM_SUBSCRIPTION_ID <SUB ID>
ARM_TENANT_ID <Tennant ID>
AZURE_CLIENT_ID <SPN ID>
AZURE_SECRET <SPN PWD>
AZURE_SUBSCRIPTION_ID <SUB ID>
AZURE_TENANT <Tennant ID>
  
Additionally the repository contains some ssh keys, these should either be regenerated or used with care for temporary environments.
