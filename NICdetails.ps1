$NICDetails = `
Get-AzNetworkInterface `
| Select-Object @{ label = "AdapterName"; Expression = { $_.Name }},
@{ label = "VMname"; Expression = { $_.VirtualMachine.Id.Split(‘/’)[8] }},
@{ label = "PrivateIpAddress"; Expression = { $_.IpConfigurations.PrivateIpAddress }},
@{ label = "PrivateIpAllocMethod"; Expression = { $_.IpConfigurations.PrivateIpAllocationMethod }};
$NICDetails | export-csv D:\Users\SNagaraju\Desktop\powershell\NIC.csv -NoTypeInformation