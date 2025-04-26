# shell:startup

$workRoot = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
$ahkFolder = "$workRoot\.ahk"
$scriptsFolder = "$workRoot\scripts"

function Invoke-RustBuilds {
    $scriptsProjects = Get-ChildItem -Path $scriptsFolder -Recurse -Filter Cargo.toml | ForEach-Object {
        Split-Path -Parent $_.FullName
    }
    
    foreach ($project in $scriptsProjects) {
        $name = Split-Path -Leaf $project
        Write-Host "Building $name"
        cargo build --release --manifest-path "$project\Cargo.toml"
    
        $exePath = "$workRoot\target\release\$name.exe"
        if (Test-Path $exePath) {
            Write-Host "Built $exePath"
        } else {
            Write-Warning "Build succeeded but $exePath not found"
        }
    }

    Write-Host "All Rust projects built!"
}

function New-StartupAhk {
    param ([string]$targetPath, [string]$shortcutPath)

    $WScriptShell = New-Object -ComObject WScript.Shell
    $shortcut = $WScriptShell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $targetPath
    $shortcut.Save()
}

function Update-StartupShortcuts {
    $startupFolder = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Startup"))

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
}

Invoke-RustBuilds
Update-StartupShortcuts
