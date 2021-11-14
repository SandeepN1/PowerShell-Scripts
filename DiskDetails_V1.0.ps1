$subscriptions = Get-AzSubscription

ForEach ($vsub in $subscriptions){
    Select-AzSubscription $vsub.SubscriptionID
    Write-Host
    Write-Host “Working on “ $vsub
    Write-Host

    $diskdetails = `
    Get-AzDisk `
    | Select-Object @{ label = "Property Name"; Expression = { $_.Name }},
    @{ label = "AttachedTo"; Expression = { $_.DiskState}};

    $diskdetails | Export-Csv -Path "D:\Users\SNagaraju\Desktop\powershell\disk.csv" -NoClobber -NoTypeInformation -Append -Encoding UTF8 -Force
}
