# RemoveBloatware

### Description

This script removes all useless APPX applications from the operating system.

List of deleted applications

```
BingWeather
Microsoft3DViewer
MicrosoftSolitaireCollection
MicrosoftStickyNotes
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

Copy the code from the area below and paste it into PowerShell Admin (or Windows Terminal) and press Enter.

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/UsefulScripts01/RemoveAppx/main/RemoveAppx.ps1'))
```

<br>

Select Appx Packages to remove

![Select Appx](res/SelectAppx.png)
