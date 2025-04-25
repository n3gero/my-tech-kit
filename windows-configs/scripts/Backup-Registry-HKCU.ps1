$backupFolderPath = Join-Path -Path $env:USERPROFILE -ChildPath "Documents\RegBackup"
if (-not (Test-Path -Path $backupFolderPath)) {
    New-Item -Path $backupFolderPath -ItemType Directory
}

$backupFilePath = Join-Path -Path $backupFolderPath -ChildPath "${env:USERNAME}-HKCU-$(Get-Date -Format 'yyyyMMddHHmmss').reg"
reg export "HKCU" $backupFilePath