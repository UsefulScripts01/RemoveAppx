# RemoveBloatware

## Synopsis
Remove all APPX bloatware from the operating system.

## Description
    This script removes all useless APPX applications from the operating system.
    USAGE
    - Download RemoveBloatware.ps1 and StartScript.bat to the same location.
    - Run the StartScript.bat file as Administrator (context menu)
    
    APPX applications can be restored with the command below:
    Get-AppxPackage -AllUsers "Microsoft.GetHelp*" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

## Usage

Paste the below command in PowerShell Admin (one right click).

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/UsefulScripts01/RemoveBloatware/main/RemoveBloatware.ps1'))
```

