. .\test_function.ps1

function Test-Pipe {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0, HelpMessage = "Required parameter P1")][string]$Status,
        [Parameter(Mandatory = $true, Position = 1, HelpMessage = "Help me...")]$p1,
        [Parameter(Mandatory = $true, Position = 2, HelpMessage = "CSV list of properties to ouput. ")][ValidatePattern('(?:^\S+$)|(?:^\"\w+(?:(?:\,\s?\w+)+)?\"$)')][String]$Properties,
        [Parameter(Mandatory = $false, Position = 3)]$p4

    )
    process {
        Write-Host "P1 is $($DIsplayname.Status)" -ForegroundColor Yellow
        Write-Host "P2 is $($DisplayName.DisplayName)" -ForegroundColor Cyan
        Write-Host "`$_ is $_" -ForegroundColor Green
        Write-Host "----------------------------"
    }
    
}

#Test-Pipe -p1 @(9,1,0) -p2 "b"
Get-ServiceInfo -svc spooler -computer localhost |  Test-Pipe