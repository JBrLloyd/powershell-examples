#Requires -RunAsAdministrator

<#
  .Synopsis
  .Description
  .Parameter Param1
  .Parameter Param2
  .Parameter Param3
  .Parameter Param4
  .Example
  .Example
#>

function Advance-Function
{
    [CmdletBinding(
        DefaultParameterSetName=”Param2”,
        SupportsShouldProcess=$True,
        ConfirmImpact=’High’
    )]


    Param(
        [Parameter(Mandatory = $true,
            HelpMessage="This Help Message will display when you type !?"
        )]
        [ValidateNotNullOrEmpty()]
        [string[]]$Param1,

        [Parameter(Mandatory = $false,
            HelpMessage="This Help Message will display when you type !?"
        )]
        [string[]]$Param2 = ”Default Value”,

        [Parameter(Mandatory = $true,
            HelpMessage="This Help Message will display when you type !?"
        )]
        [ValidateSet(1, 2, 3)]
        [string[]]$Param3
    )

    If ($PSCmdlet.ShouldProcess(“Message“))
    {
        # Add the common parameter `-Debug` to display the message below
        Write-Debug "Getting Start-Sleep Help manual"
        Get-Help Start-Sleep
    }

    switch ($ConfirmPreference)
    {
        'High' { Write-Host "`-Confirm` passed in and set to $ConfirmPreference" -ForegroundColor Cyan }
        'Medium' { Write-Host "`-Confirm` passed in and set to $ConfirmPreference" -ForegroundColor Cyan }
        'Low' { Write-Host "`-Confirm` passed in and set to $ConfirmPreference" -ForegroundColor Cyan }
        default { Write-Host "No common parameter switch `-Confirm` passed in" }
    }
}