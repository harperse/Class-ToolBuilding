function ServiceStuff {
$service = Get-Service -Name Spooler
$services = Get-Service

$services

if ($service.Status -eq "Stopped") {
    Write-Host "$($service.Name) is Running"
}
elseif ($service.StartType -eq "Automatic") {
    Write-Host "$($service.Name) is Stopped"
}
else {
    Write-Host "$($service.Name) is NOT Running" -BackgroundColor Red
}
}
