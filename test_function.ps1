Function Get-ServiceInfo {
    param ($svc, $computer, [switch]$state)
    
    if ($svc -ne "Spooler") {
        Throw "How dare you check anything but spooler"
    }

       Get-Service -Name $svc -RequiredServices -ComputerName $computer
}
#Get-ServiceInfo -svc spooler -computer localhost