@description('Azure region for hub networking resources (must match the RG location)')
param location string

@description('Name of the hub Virtual Network')
param hubVnetName string = 'vnet-hub'

@description('CIDR address space for the hub Virtual Network')
param hubAddressPrefix string = '10.0.0.0/16'

@description('CIDR for Azure Bastion subnet (name must be AzureBastionSubnet)')
param bastionSubnetPrefix string = '10.0.1.0/26'

@description('CIDR for VPN Gateway subnet (name must be GatewaySubnet)')
param gatewaySubnetPrefix string = '10.0.2.0/27'

@description('CIDR for shared services subnet in the hub')
param sharedServicesSubnetPrefix string = '10.0.10.0/24'

resource hubVnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: hubVnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        hubAddressPrefix
      ]
    }
    subnets: [
      {
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefix: bastionSubnetPrefix
        }
      }
      {
        name: 'GatewaySubnet'
        properties: {
          addressPrefix: gatewaySubnetPrefix
        }
      }
      {
        name: 'SharedServicesSubnet'
        properties: {
          addressPrefix: sharedServicesSubnetPrefix
        }
      }
    ]
  }
}

output hubVnetId string = hubVnet.id
output hubVnetNameOut string = hubVnet.name
output hubAddressSpace string = hubAddressPrefix