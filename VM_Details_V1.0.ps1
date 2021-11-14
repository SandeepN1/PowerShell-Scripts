$subscriptions = Get-AzSubscription

ForEach ($vsub in $subscriptions){
Select-AzSubscription $vsub.SubscriptionID
Write-Host
Write-Host “Working on “ $vsub
Write-Host

    $VMs = Get-AzVM -Status 

        $vmOutput = $VMs | ForEach-Object {
            [PSCustomObject]@{
                "VM Name" = $_.Name
                "VM Status" = $_.PowerState
                "VM Type" = $_.StorageProfile.ImageReference.Publisher
                "VM Profile" = $_.HardwareProfile.VmSize
                "VM OS Disk Size" = $_.StorageProfile.OsDisk.DiskSizeGB
                "VM Data Disk Size" = ($_.StorageProfile.DataDisks.DiskSizeGB) -join ','
            }
        }
        
    $vmOutput | export-csv D:\Users\SNagaraju\Desktop\powershell\VM\VMdetails.csv -NoClobber -NoTypeInformation -Append -Encoding UTF8 -Force
}
