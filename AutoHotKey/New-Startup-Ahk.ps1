#Requires -Version 5.1

# Root folder of this script
$workRoot = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
$ahkFolder = Join-Path $workRoot ".ahk"

# Path to AutoHotkey v2 executable
# !!! Change this if your path is different !!!
$ahkExe = "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"

function New-LoginAhkTask {
    param(
        [string]$TaskName,
        [string]$ScriptPath
    )

    # Remove existing task with the same name
    $existing = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
    if ($existing) {
        Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
        Write-Output "Removed existing task: $TaskName"
    }

    # Create new scheduled task that runs at logon with highest privileges
    $action = New-ScheduledTaskAction -Execute $ahkExe -Argument "`"$ScriptPath`""
    $trigger = New-ScheduledTaskTrigger -AtLogOn -User $env:USERNAME
    $principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -RunLevel Highest -LogonType Interactive
    $task = New-ScheduledTask -Action $action -Trigger $trigger -Principal $principal

    Register-ScheduledTask -TaskName $TaskName -InputObject $task -Force | Out-Null
    Write-Output "Created task: $TaskName  ->  $ScriptPath"
}

function Update-AhkScheduledTasks {
    if (-not (Test-Path $ahkFolder)) {
        Write-Error "AHK folder not found: $ahkFolder"
        return
    }

    # Remove old tasks with prefix AHK_ for this user
    Get-ScheduledTask -ErrorAction SilentlyContinue |
    Where-Object { $_.TaskName -like "AHK_*" -and $_.Principal.UserId -eq $env:USERNAME } |
    Unregister-ScheduledTask -Confirm:$false

    Write-Output "Deleted old AHK_ tasks for user $env:USERNAME"

    # Create tasks for each .ahk file
    Get-ChildItem -Path $ahkFolder -Filter "*.ahk" | ForEach-Object {
        $taskName = "AHK_$($_.BaseName)"
        $scriptPath = $_.FullName
        New-LoginAhkTask -TaskName $taskName -ScriptPath $scriptPath
    }
}

Update-AhkScheduledTasks
