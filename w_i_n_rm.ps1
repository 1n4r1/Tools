$server = "target.example.com"
$username = "DOMAIN\User"

# 実行時にパスワードを入力（クリアテキストを画面に表示しない）
$securePwd = Read-Host "Enter password for $username" -AsSecureString
$cred = New-Object System.Management.Automation.PSCredential($username, $securePwd)

# セッションを作成してコマンドを実行
$s = New-PSSession -ComputerName $server -Credential $cred
Invoke-Command -Session $s -ScriptBlock { hostname; whoami }
# 必要ならInteractively Enter-PSSession
# Enter-PSSession -Session $s

# 終了時は必ずセッションを閉じる
Remove-PSSession -Session $s
