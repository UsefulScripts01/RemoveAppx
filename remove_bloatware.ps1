#usuwa pakiety provisoned (te na przynete w START)
Get-AppXProvisionedPackage -Online | Remove-AppxProvisionedPackage -Online


Write-Host "TRWA USUWANIE NIEPOTRZEBNYCH APLIKACJI.." -BackgroundColor DarkBlue -ForegroundColor White
write-host "`n"

Get-AppxPackage -AllUsers -Name *BingNews* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *GetHelp* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *Getstarted* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *Messaging* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *Microsoft3DViewer* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *MicrosoftOfficeHub* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *News* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *Office.Lens* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *Office.OneNote* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *Office.Sway* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *OneConnect* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *Print3D* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *SkypeApp* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *Office.Todo.List* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *Whiteboard* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *WindowsAlarms* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *WindowsCamera* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *WindowsFeedbackHub* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *WindowsMaps* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *WindowsSoundRecorder* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *XboxApp* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *XboxIdentityProvider* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *XboxSpeechToTextOverlay* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *ZuneMusic* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *ZuneVideo* | Remove-AppxPackage 
Get-AppxPackage -AllUsers -Name *StorePurchaseApp* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *Paint3D* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *MicrosoftStickyNotes* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *MixedReality.Portal * | Remove-AppxPackage
#Get-AppxPackage -AllUsers -Name *Windows.Photos* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *Cortana* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *MSPaint* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *YourPhone* | Remove-AppxPackage
Get-AppxPackage -AllUsers -Name *Microsoft.People* | Remove-AppxPackage


Write-Host "GOTOWE!" -BackgroundColor DarkBlue -ForegroundColor White
write-host "`n"
Write-Host "POZOSTALE:" -BackgroundColor DarkBlue -ForegroundColor White
write-host "`n"
Get-AppXProvisionedPackage -Online | Select-Object PackageName

pause