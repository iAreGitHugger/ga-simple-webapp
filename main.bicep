param storageName string = 'mpswappsa'
param namePrefix string = 'mihaiprofir'
param dockerImge string = 'nginx'
param dockerImageTag string = 'latest'

targetScope = 'resourceGroup'

module storage 'modules/storage.bicep' = {
  params: {
    storageName: storageName
  }
}

module appPlan 'modules/appPlan.bicep' = {
  params: {
    namePrefix: namePrefix
  }
}

module appsite 'modules/appSite.bicep' = {
  params: {
    appPlanId: appPlan.outputs.planId
    namePrefix: namePrefix
    dockerImage: dockerImge
    dockerImageTag: dockerImageTag
  }
}
