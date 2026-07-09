param namePrefix string
param location string = resourceGroup().location
param appPlanId string
param dockerImage string = 'nginxdemos/hello'
param dockerImageTag string = 'latest'

resource webApp 'Microsoft.Web/sites@2025-03-01' = {
    name: '${namePrefix}-site'
    location:  location
    properties: {
        serverFarmId: appPlanId
        httpsOnly: true
        siteConfig: {
            appSettings: [
                {
                    name: 'DOCKER_REGISTRY_SERVICE_URL'
                    value: 'https://index.docker.io'
                 }
                 {
                    name: 'DOCKER_REGISTRY_SERVER_USERNAME'
                    value: ''
                }
                {
                    name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
                    value: ''
                }
                {
                    name: 'WEBSITE_ENABL_APP_SERVICE_STORAGE'
                    value: 'false'
                }  
            ]
            linuxFxVersion: 'DOCKER|${dockerImage}:${dockerImageTag}'

        }
    }
       
}
output siteUrl string = webApp.properties.hostNames[0]

