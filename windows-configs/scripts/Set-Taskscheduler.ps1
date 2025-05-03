# scripts/Set-Taskscheduler.ps1

$workRoot = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
$ps1Path = Join-Path $workRoot "OnBootTask.ps1"

if (!(Test-Path $ps1Path)) {
  Write-Error "OnBootTask.ps1 not found: $ps1Path"
  exit 1
}

# ファイル名からタスク名を取得
$taskName = [System.IO.Path]::GetFileName($ps1Path)

# タスクアクション（PowerShellでスクリプト実行）
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"$ps1Path`""

# トリガー（ログオン時）
$trigger = New-ScheduledTaskTrigger -AtLogOn

# 実行ユーザーの情報を取得
$user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

# タスク設定（最高権限なし）
$principal = New-ScheduledTaskPrincipal -UserId $user

# タスクを作成
$task = New-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -Settings (New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries)

try {
  if (Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) {
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false -ErrorAction Stop
  }
} catch {
  Write-Warning "Failed to unregister existing task '$taskName'. Continuing. Error: $_"
}

try {
  Register-ScheduledTask -TaskName $taskName -InputObject $task -ErrorAction Stop
  Write-Host "Task '$taskName' registered successfully."
} catch {
  Write-Error "Failed to register task '$taskName'. Error: $_"
  exit 1
}
