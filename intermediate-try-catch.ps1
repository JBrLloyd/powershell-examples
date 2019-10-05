param (
    [string] $Username = "Fabio"
)

try {
    Get-Item -Path "C:\Should\Not\Exist"
} catch [Microsoft.PowerShell.Commands.SetLocalUserCommand] {
    Write-Warning "No user found with the username '$Username'"
} catch {
    # Throw is equivelent to writing:
    # Write-Error "Some Message"
    # Exit 1
    Throw $_.Exception.Message
}

try {
    Set-LocalUser -Name $Username -Description "User Example"
} catch {
    Throw "There was a problem updating the user '$Username'"
}
Get-Item -Path "C:\Should\Not\Exist"