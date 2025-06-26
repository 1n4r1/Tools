param (
    [string]$HostListPath = "hosts.txt"
)

if (-Not (Test-Path $HostListPath)) {
    Write-Error "ホスト一覧ファイルが見つかりません: $HostListPath"
    exit 1
}

$hosts = Get-Content $HostListPath

foreach ($host in $hosts) {
    if (-not [string]::IsNullOrWhiteSpace($host)) {
        Write-Host "`n=== $host の共有一覧 ===" -ForegroundColor Cyan
        try {
            net view \\$host
        } catch {
            Write-Warning "$host に接続できませんでした。"
        }
    }
}