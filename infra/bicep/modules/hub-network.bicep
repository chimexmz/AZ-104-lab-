@description('Azure region for hub networking resources')
param location string

@description('Name of the hub Virtual Network')
param hubVnetName string

@description('CIDR address space for the hub Virtual Network')
param hubAddressPrefix string

@description('CIDR for Azure Bastion subnet')
param bastionSubnetPrefix string

@description('CIDR for VPN Gateway subnet')
param gatewaySubnetPrefix string

@description('CIDR for shared services subnet')
param sharedServicesSubnetPrefix string

// =====================
// HUB VNET
// =====================
resource hubVnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: hubVnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        hubAddressPrefix
      ]
    }
  }
}

// =====================
// SUBNETS (CHILD RESOURCES)
// =====================
resource bastionSubnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  name: '${hubVnet.name}/AzureBastionSubnet'
  properties: {
    addressPrefix: bastionSubnetPrefix
  }
}

resource gatewaySubnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  name: '${hubVnet.name}/GatewaySubnet'
  properties: {
    addressPrefix: gatewaySubnetPrefix
  }
}

resource sharedServicesSubnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  name: '${hubVnet.name}/SharedServicesSubnet'
  properties: {
    addressPrefix: sharedServicesSubnetPrefix
  }
}

// =====================
// OUTPUTS (MATCHED)
// =====================
output hubVnetId string = hubVnet.id
output hubVnetNameOut string = hubVnet.name
