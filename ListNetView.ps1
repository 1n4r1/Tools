set-executionpolicy -scope Process -ExecutionPolicy bypass

$ipListFile = "ip_list.txt"

if (-Not (Test-Path $ipListFile)) {
    Write-Error "File '$ipListFile' is not found"
    exit 1
}

Get-Content $ipListFile | ForEach-Object {
    $ip = $_.Trim()
    if ($ip) {
        Write-Warning "===== list of $ip ====="
        Write-Host "===== list of $ip ====="
        try {
            net view "\\$ip"
        }
        catch {
            Write-Warning "couldn't connect to $ip "
        }
        Write-Host ""
    }
}