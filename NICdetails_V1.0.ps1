$subscriptions = Get-AzSubscription

ForEach ($vsub in $subscriptions){
Select-AzSubscription $vsub.SubscriptionID
Write-Host
Write-Host “Working on “ $vsub
Write-Host

$nics = Get-AzNetworkInterface
$Output = @()
foreach($nic in $nics) {
write-host "Gathering NIC information :- $($nic.name)" -ForegroundColor Yellow
$NICname = ''
$IPaddress = ''
$VMname = ''

$NICname = $nic[0].Name
$VMname = $nic[0].VirtualMachine.Id.Split(‘/’)[8]
$IPaddress = $nic[0].IpConfigurations[0].PrivateIpAddress
$Output += [pscustomobject]@{                       
        'NICname' = $NICname
        'IPaddress' = $IPaddress
        'VMname' = $VMname
    }
}$Output | Export-Csv -Path "D:\Users\SNagaraju\Desktop\powershell\NIC.csv" -NoClobber -NoTypeInformation -Append -Encoding UTF8 -Force
}



