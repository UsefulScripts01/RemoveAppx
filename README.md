# RemoveBloatware

## Description

This script removes all useless APPX applications from the operating system.

List of deleted applications

```
Microsoft.BingWeather
Microsoft.GetHelp
Microsoft.Getstarted
Microsoft.Microsoft3DViewer
Microsoft.MicrosoftOfficeHub
Microsoft.MicrosoftSolitaireCollection
Microsoft.MixedReality.Portal
Microsoft.MSPaint
Microsoft.Office.OneNote
Microsoft.People
Microsoft.SkypeApp
Microsoft.StorePurchaseApp
Microsoft.Wallet
Microsoft.WindowsAlarms
Microsoft.WindowsCamera
microsoft.windowscommunicationsapps
Microsoft.WindowsFeedbackHub
Microsoft.WindowsMaps
Microsoft.WindowsSoundRecorder
Microsoft.Xbox.TCUI
Microsoft.XboxApp
Microsoft.XboxGameOverlay
Microsoft.XboxGamingOverlay
Microsoft.XboxIdentityProvider
Microsoft.XboxSpeechToTextOverlay
Microsoft.YourPhone
Microsoft.ZuneMusic
Microsoft.ZuneVideo
Microsoft.Todos
Microsoft.ParentalControl
```

## Usage

- Download RemoveBloatware.ps1 and StartScript.bat to the same location.
- Run the StartScript.bat file as Administrator (context menu)

Or

- Paste the command below in PowerShell (Admin).

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/UsefulScripts01/RemoveBloatware/main/RemoveBloatware.ps1'))
```

## Restore APPX

All APPX applications can be restored with the command below:

```powershell
Get-AppxPackage -AllUsers "Microsoft.GetHelp*" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
```