# Customize my PC with AutoHotKey

## Install AutoHotKey

[AutoHotkey](https://www.autohotkey.com/)

## Configure VSCode for AutoHotkey

### Install the Extension

Install the AutoHotkey extension, [AHK++ (AutoHotkey Plus Plus)](https://marketplace.visualstudio.com/items?itemName=mark-wiemer.vscode-autohotkey-plus-plus), in VSCode. This can be done from the Visual Studio Marketplace.

### Costomize settings.json

Adjust the `helpPath` and `interpreterPath` based on your system.

```json:./vscode/settings.json
{
  "AHK++.v2.file": {
    "compileBaseFile": "",
    "helpPath": "C:/Program Files/AutoHotkey/v2/AutoHotkey.chm",
    "interpreterPath": "C:/Program Files/AutoHotkey/v2/AutoHotkey.exe",
    "maxScanDepth": 2,
    "templateSnippetName": "AhkTemplateV2"
  }
}
```

## Automatically Build AHK on Startup

Use `New-Startup-Ahk.ps1` PowerShell script to automate AHK-related tasks on startup.
