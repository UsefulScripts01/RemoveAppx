# RemoveBloatware

## Description

This script removes all useless APPX applications from the operating system.

## Usage

- Download RemoveBloatware.ps1 and StartScript.bat to the same location.
- Run the StartScript.bat file as Administrator (context menu)

OR

Paste the command below in PowerShell (Admin).

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/UsefulScripts01/RemoveBloatware/main/RemoveBloatware.ps1'))
```

## Restore APPX

All APPX applications can be restored with the command below:

```powershell
Get-AppxPackage -AllUsers "Microsoft.GetHelp*" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
```