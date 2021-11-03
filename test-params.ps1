

function Test-Function {
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = "None",
        DefaultParameterSetName = "Parameter Set 1",
        HelpUri = "http://aka.ms/help",
        SupportsPaging = $false,
        PositionalBinding = $false 
    )]
    [OutputType([int])]
    param (
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)][ValidateNotNullOrEmpty()][string]$param,
        [Parameter(Mandatory = $false, Position = 1)][ValidateSet("Green", "Red", "Blue")][string]$color = "Green",
        [Parameter(Mandatory = $false, Position = 2)][switch]$BGColor,
        [Parameter(Mandatory = $true)][ValidateRange(0, 10)][int]$num
    )
    
    begin {
        #. .\test_classes.ps1
        Clear-Host

    }
    
    process {
        trap [System.DivideByZeroException] {
            Write-Host -BackgroundColor Yellow -ForegroundColor Red "I got one!"
            Continue
        }
        if ($PSCmdlet.ShouldProcess($param, "Displaying")) {
            if ($BGColor) {
                Write-Host "$param $num" -ForegroundColor $color -BackgroundColor Yellow
            }
            else {
                Write-Host "$param $num" -ForegroundColor $color
                1 / $null
            }
        }
        else { Write-Host "Operation aborted!" }
        Write-Host "Did the code continue?"
        
    }
    
    end {
        
    }
}

Test-Function -param "testing" -color "Green" -num 4
