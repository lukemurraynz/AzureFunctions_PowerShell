# Input bindings are passed in via param block.
param($QueueItem, $TriggerMetadata)

# Write out the queue message and insertion time to the information log.
# Write out the queue message and metadata to the information log.
Write-Host "PowerShell queue trigger function processed work item: $QueueItem"
Write-Host "Queue item expiration time: $($TriggerMetadata.ExpirationTime)"
Write-Host "Queue item insertion time: $($TriggerMetadata.InsertionTime)"
Write-Host "Queue item next visible time: $($TriggerMetadata.NextVisibleTime)"
Write-Host "ID: $($TriggerMetadata.Id)"
Write-Host "Pop receipt: $($TriggerMetadata.PopReceipt)"
Write-Host "Dequeue count: $($TriggerMetadata.DequeueCount)"


$config = $QueueItem 

$storageAccountName = $config.StorageAccountName
$resourceGroupName = "rg-" + $config.ResourceGroupName

Write-Host "Storage Account Name: $storageAccountName"
Write-Host "Resource Group Name: $resourceGroupName"

$location = 'AustraliaEast'

# Check if the resource group exists, if not, create it
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if (-not $resourceGroup) {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Check if the storage account name is available
$nameAvailability = Get-AzStorageAccountNameAvailability -Name $storageAccountName

if ($nameAvailability.NameAvailable) {
    # The storage account name is available, create it
    $storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -Location $location -SkuName Standard_LRS -AllowBlobPublicAccess $false -AllowCrossTenantReplication $false
} else {
    Write-Host "The storage account name '$storageAccountName' is not available. Please choose a different name."
}

