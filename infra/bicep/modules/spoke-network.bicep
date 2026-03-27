param location string
param spokeVnetName string
param spokeAddressPrefix string
param appSubnetPrefix string

resource spokeVnet 'Microsoft.Network/virtualNetworks@2022-09-01' = {
  name: spokeVnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        spokeAddressPrefix
      ]
    }
    subnets: [
      {
        name: 'app-subnet'
        properties: {
          addressPrefix: appSubnetPrefix
        }
      }
    ]
  }
}

output spokeVnetId string = spokeVnet.id
output spokeVnetName string = spokeVnet.name