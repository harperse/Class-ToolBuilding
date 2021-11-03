$runspacePool = [runspacefactory]::CreateRunspacePool(1, 3)                                                        
$runspacePool.Open()                                                                                              
$runspacePool.GetAvailableRunspaces()                                                                             
[System.Collections.ArrayList]$RunspaceList = @()

foreach ($RunspaceInstance in 1..100) {
    $PowerShellInstance = [powershell]::Create()
    $PowerShellInstance.RunspacePool = $runspacePool

    [void]$PowerShellInstance.AddScript( { Get-ChildItem -Path C:\Windows\System32\drivers -Recurse })
    [void]$PowerShellInstance.AddArgument($RunspaceInstance)
    $RunspaceList.Add([pscustomobject]@{
            RunspaceInstance = $RunspaceInstance
            PowerShell       = $PowerShellInstance
            AsyncResult      = $PowerShellInstance.BeginInvoke()
        }
    )
}