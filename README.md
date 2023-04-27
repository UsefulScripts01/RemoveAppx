# RemoveBloatware

### Description

This script removes all useless APPX applications from the operating system.

List of deleted applications

```
BingWeather
Microsoft3DViewer
MicrosoftSolitaireCollection
MixedReality.Portal
MSPaint
Office.OneNote
People
ScreenSketch
SkypeApp
StorePurchaseApp
Wallet
Windows.Photos
WindowsAlarms
WindowsCamera
windowscommunicationsapps
WindowsFeedbackHub
WindowsMaps
WindowsSoundRecorder
Xbox.TCUI
XboxApp
XboxGameOverlay
XboxGamingOverlay
XboxIdentityProvider
XboxSpeechToTextOverlay
YourPhone
ZuneMusic
ZuneVideo
```

### Usage

- Download RemoveBloatware.ps1 and StartScript.bat to the same location.
- Run the StartScript.bat file as Administrator (context menu)

Or

- Copy the code from the area below and paste it into PowerShell Admin (or Windows Terminal).

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/UsefulScripts01/RemoveBloatware/main/RemoveBloatware.ps1'))
```

