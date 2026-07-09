param namePrefix string
param location string = resourceGroup().location
param sku string = 'B1'

resource appServicePlan 'Microsoft.Web/serverfarms@2025-03-01' = {
    name: '${namePrefix}-ASP'
    location: location 
    kind: 'linux'
    sku: {
        name: sku
    }
    
  properties: {
    hyperV: false
    perSiteScaling: false
    reserved: true
    zoneRedundant: false
  }
} 

output planId string = appServicePlan.id


