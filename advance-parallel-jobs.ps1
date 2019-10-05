$BasePath = 'E:\temp\test'
$jobs = @()

foreach ($FileNum in 1..9)
{
    $id = [System.Guid]::NewGuid()
    $jobs += $id 
    $Script = {
        Param($AbsolutePath)

        Write-Output "`nStarting Job..."

        $stopwatch =  [system.diagnostics.stopwatch]::new()
        $stopwatch.Start()
        Write-Output "$($stopwatch.Elapsed)"
        Start-Sleep -Seconds 10 
        New-Item -Path $AbsolutePath -ItemType File -Force
        Write-Output "$($stopwatch.Elapsed)"
        $stopwatch.Stop()

        Write-Output "`n"

    }

    Start-Job -Name $id -ScriptBlock $Script -ArgumentList "${BasePath}\\test${FileNum}"
}

While (Get-Job -State "Running") {
    Start-Sleep 1 
}

foreach ($job in $jobs) { Receive-Job -Name $job }

Get-Job
Remove-Job *