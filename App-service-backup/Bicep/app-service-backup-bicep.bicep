@description('Name of web app')
param webAppName string

@description('SAS URL to the container.')
param storageAccountUrl string
@description('Schedule for the backup')
param backupSchedule object

resource webApp 'Microsoft.Web/sites@2022-03-01' existing = {
  name: webAppName
}

resource symbolicname 'Microsoft.Web/sites/config@2022-03-01' = {
  name: 'backup'
  parent: webApp
  kind: 'backup'
  properties: {
    backupName: 'backup-ppaszek'
    backupSchedule: {
      frequencyInterval: backupSchedule.frequencyInterval
      frequencyUnit: backupSchedule.frequencyUnit
      keepAtLeastOneBackup: backupSchedule.keepAtLeastOneBackup
      retentionPeriodInDays: backupSchedule.retentionPeriodInDays
      startTime: backupSchedule.startTime
    }
    databases: [
      {
        connectionString: 'Server=tcp:ppaszek123-server.database.windows.net,1433;Initial Catalog=SampleDB;Persist Security Info=False;User ID=ppaszek1234;Password=SDF#$@&hjk;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;'
        connectionStringName: 'connection123'
        databaseType: 'SqlAzure'
        name: 'ppaszek123-server'
      }
    ]
    enabled: true
    storageAccountUrl: storageAccountUrl
  }
}
