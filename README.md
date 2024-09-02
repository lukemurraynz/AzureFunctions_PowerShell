# AzureFunctions_PowerShell
Azure PowerShell Azure Functions

## Development Container for Azure Functions (PowerShell)

This configuration sets up a development environment for Azure Functions using PowerShell, with necessary tools and extensions pre-installed. It uses Docker Compose to manage multiple services, including a local Azure Storage emulator (Azurite). The environment is tailored for use with Visual Studio Code, providing a seamless development experience. 

Before you can run or debug the functions in your project, you need to start the Functions host from the root directory of your project. The host enables triggers for all functions in the project. Use this command to start the local runtime:

```
func start
```

After the function has started, you should see: 

* Your Functions 4.0 app is up and running navigating to the open 7071 port.

## Queue demo

```
{
    "StorageAccountName": "sds",
    "ResourceGroupName": "asdasd"
}
```

## Notes

* [DefaultAzureCredential](https://azuresdkdocs.blob.core.windows.net/$web/dotnet/Azure.Identity/1.4.1/index.html)
* [Azure Queue storage trigger for Azure Functions]https://learn.microsoft.com/azure/azure-functions/functions-bindings-storage-queue-trigger?tabs=python-v2%2Cisolated-process%2Cnodejs-v4%2Cextensionv5&pivots=programming-language-powershell&WT.mc_id=AZ-MVP-5004796)