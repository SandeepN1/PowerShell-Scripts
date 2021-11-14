
$resources = Get-AzResource

$resInfo =@()

foreach ($resource in $resources) {

$OutObject = "" | Select- "Resource_Name","Resource_Type","RG_Name"
        $OutObject.Resource_Name = $resource.Name
        $OutObject.Resource_Type = $resource.resourcetype
        $OutObject.RG_Name = $resource.resourcegroupname

        $resInfo += $Outobject
 }

 $resInfo | export-csv D:\Users\SNagaraju\Desktop\powershell\MAFVentures\MAFV-Recovery1.csv -NoTypeInformation