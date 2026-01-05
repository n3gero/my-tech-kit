# Logon-Check.ps1
# Purpose: Verify this script runs at logon (writes a log + drops a marker file)

$ErrorActionPreference = "Stop"

$dir = Join-Path $env:LOCALAPPDATA "RemapLogonTest"
New-Item -ItemType Directory -Path $dir -Force | Out-Null

$stamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff"
$pidInfo = "PID=$PID"
$userInfo = "User=$env:USERNAME"
$sessionInfo = "SessionName=$env:SESSIONNAME"

$logPath = Join-Path $dir "logon-check.log"
$markerPath = Join-Path $dir "logon-check.ok"

"$stamp  Logon-Check.ps1 ran  $pidInfo  $userInfo  $sessionInfo" | Out-File -FilePath $logPath -Encoding UTF8 -Append
"OK $stamp" | Out-File -FilePath $markerPath -Encoding UTF8 -Force
