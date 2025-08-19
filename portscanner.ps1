$subnet = "192.168.1"       # ← スキャン対象のサブネット（必要に応じて変更）
$start = 1
$end = 254

foreach ($i in $start..$end) {
    $ip = "$subnet.$i"
    Write-Host "Scanning $ip..." -ForegroundColor Cyan
    $result = Test-NetConnection -ComputerName $ip -Port 445 -InformationLevel Quiet
    if ($result) {
        Write-Host "Port 445 open on $ip" -ForegroundColor Green
    }
}