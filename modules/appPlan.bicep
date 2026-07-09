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


# Bash script
az ad sp create-for-rbac --name mySPGA --role reader --scopes /subscriptions/
resourceGroups/myRG1
# PowerShell script
az ad sp create-for-rbac --name mySPGA --role contributor --scopes /subscriptions/ca335c06-ab64-4278-b18e-433ad6ed7e71
