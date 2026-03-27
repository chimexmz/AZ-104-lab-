targetScope = 'subscription'

@description('Azure region for deployments')
param location string = 'westeurope'

@description('Hub resource group name')
param hubRgName string = 'rg-hub-network'

// Create Hub Resource Group
resource rgHub 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: hubRgName
  location: location
}

// Deploy Hub Network into the Hub RG
module hubNetwork 'modules/hub-network.bicep' = {
  name: 'hubNetworkDeployment'
  scope: rgHub
  params: {
    location: location
    hubVnetName: 'vnet-hub'
    hubAddressPrefix: '10.0.0.0/16'
    bastionSubnetPrefix: '10.0.1.0/26'
    gatewaySubnetPrefix: '10.0.2.0/27'
    sharedServicesSubnetPrefix: '10.0.10.0/24'
  }
}

output hubResourceGroup string = rgHub.name
output hubVnetId string = hubNetwork.outputs.hubVnetId
output hubVnetName string = hubNetwork.outputs.hubVnetNameOut