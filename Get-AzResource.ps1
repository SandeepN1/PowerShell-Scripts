$Resources = Get-AzResource
$Output = $Resources | ForEach-Object {
    [PSCustomObject]@{
        "Resource Group" = $_.ResourceGroupName
        "Resource Type" = $_.ResourceType
        "Resource" = $_.Name
    }
}
$Output | Export-Csv D:\Users\SNagaraju\Desktop\powershell\MAFVentures\MAFV-UAE-Production.csv -NoTypeInformation