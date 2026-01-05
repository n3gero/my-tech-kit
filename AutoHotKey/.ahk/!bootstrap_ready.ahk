#Requires AutoHotkey v2.0
#SingleInstance Force

maxAttempts := 60
intervalMs := 1000

loop maxAttempts {
    if ProcessExist("explorer.exe") {
        break
    }
    Sleep intervalMs
}

; ---- Optional: create a ready flag file (can be removed if not needed)
localAppData := EnvGet("LOCALAPPDATA")
if (localAppData != "") {
    flagDir := localAppData "\AhkBootstrap"
    flagFile := flagDir "\ahk-bootstrap.ready.flag"
    try {
        if !DirExist(flagDir) {
            DirCreate(flagDir)
        }
        if FileExist(flagFile) {
            FileDelete(flagFile)
        }
        FileAppend("ready=1`n", flagFile, "UTF-8")
    } catch {
        ; Ignore flag errors
    }
}

; ---- Run other scripts in this folder
ahkExe := A_AhkPath
ahkDir := A_ScriptDir

loop files, ahkDir "\*.ahk", "F" {
    name := A_LoopFileName
    full := A_LoopFileFullPath

    if RegExMatch(name, "^\!") {
        continue
    }

    ; Launch: AutoHotkey64.exe /force "script.ahk"
    Run '"' ahkExe '" /force "' full '"'
}

ExitApp(0)