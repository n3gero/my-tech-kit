$WshShell = New-Object -ComObject WScript.Shell

$shortcutPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\VALORANT - High Priority.lnk"
$target = "$env:WINDIR\System32\WindowsPowerShell\v1.0\powershell.exe"
$scriptPath = Join-Path $PSScriptRoot "LaunchValorant.ps1"
$workingDir = $PSScriptRoot
$iconPath = "$env:SystemDrive\ProgramData\Riot Games\Metadata\valorant.live\valorant.live.ico"

if (!(Test-Path $scriptPath)) {
    Write-Error "Missing: $scriptPath"
    exit 1
}

$shortcut = $WshShell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $target
$shortcut.Arguments = "-ExecutionPolicy Bypass -File `"$scriptPath`""
$shortcut.WorkingDirectory = "$workingDir"
$shortcut.WindowStyle = 1
$shortcut.IconLocation = $iconPath
$shortcut.Description = "Launch VALORANT with High Priority"

try {
    $shortcut.Save()
    Write-Host "Shortcut created at: $shortcutPath"
}
catch [System.UnauthorizedAccessException] {
    Write-Error "❌ Failed to create shortcut: This script must be run as Administrator."
    exit 1
}
catch {
    throw
}
