# shell:startup

function New-StartupAhk {
    param ([string]$targetPath, [string]$shortcutPath)

    $WScriptShell = New-Object -ComObject WScript.Shell
    $shortcut = $WScriptShell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $targetPath
    $shortcut.Save()
}

$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
$startupFolder = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Startup"))

# Path to the folder containing .ahk files.
$ahkFolder = "$scriptDir\.ahk"

Get-ChildItem -Path $startupFolder -Filter "*.ahk.lnk" | ForEach-Object {
    Remove-Item -Path $_.FullName -Force
}
Write-Output "Deleted existing shortcuts"

Get-ChildItem -Path $ahkFolder -Filter "*.ahk" | ForEach-Object {
    $ahkFile = $_.FullName
    $shortcutPath = [System.IO.Path]::Combine($startupFolder, "$($_.BaseName).ahk.lnk")

    New-StartupAhk -targetPath $ahkFile -shortcutPath $shortcutPath
    Write-Output "Created shortcut for $($_.Name) in Startup folder"
}
