param virtualNetworkName string
param subnetName string
param subnetAddressPrefix string
param nsgId string

@description('Location')
param location string = resourceGroup().location

resource virtualNetworkName_subnetName 'Microsoft.Network/virtualNetworks/subnets@2020-06-01' = {
  name: '${virtualNetworkName}/${subnetName}'
  location: location
  properties: {
    addressPrefix: subnetAddressPrefix
    networkSecurityGroup: {
      id: nsgId
    }
  }
}
