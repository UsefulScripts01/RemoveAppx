<#
    .SYNOPSIS
    Remove all APPX bloatware from the operating system.

    .DESCRIPTION
    This script removes all useless APPX applications from the operating system.

    USAGE
    - Download RemoveBloatware.ps1 and StartScript.bat to the same location.
    - Run the StartScript.bat file as Administrator (context menu)

    You can restore APPX applications with the command below:
    Get-AppxPackage -AllUsers "Microsoft.GetHelp*" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

    .EXAMPLE

    .NOTES

    .LINK

#>

function Remove-Bloatware {
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.BingWeather*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.GetHelp*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.Getstarted*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.Microsoft3DViewer*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.MicrosoftOfficeHub*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.MicrosoftSolitaireCollection*" | Remove-Item -Recurse -Force
    #HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.MicrosoftStickyNotes*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.MixedReality.Portal*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.MSPaint*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.Office.OneNote*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.People*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.SkypeApp*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.StorePurchaseApp*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.Wallet*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.WindowsAlarms*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.WindowsCamera*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\microsoft.windowscommunicationsapps*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.WindowsFeedbackHub*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.WindowsMaps*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.WindowsSoundRecorder*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.Xbox.TCUI*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.XboxApp*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.XboxGameOverlay*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.XboxGamingOverlay*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.XboxIdentityProvider*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.XboxSpeechToTextOverlay*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.YourPhone*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.ZuneMusic*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.ZuneVideo*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.Todos*" | Remove-Item -Recurse -Force
    Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\Microsoft.ParentalControl*" | Remove-Item -Recurse -Force

    Get-AppxPackage -AllUsers -Name "Microsoft.BingWeather*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.GetHelp*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.Getstarted*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.Microsoft3DViewer*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.MicrosoftOfficeHub*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.MicrosoftSolitaireCollection*" | Remove-AppxPackage -AllUsers
    #Get-AppxPackage -AllUsers -Name "Microsoft.MicrosoftStickyNotes*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.MixedReality.Portal*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.MSPaint*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.Office.OneNote*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.People*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.SkypeApp*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.StorePurchaseApp*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.Wallet*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.WindowsAlarms*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.WindowsCamera*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "microsoft.windowscommunicationsapps*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.WindowsFeedbackHub*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.WindowsMaps*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.WindowsSoundRecorder*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.Xbox.TCUI*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.XboxApp*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.XboxGameOverlay*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.XboxGamingOverlay*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.XboxIdentityProvider*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.XboxSpeechToTextOverlay*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.YourPhone*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.ZuneMusic*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.ZuneVideo*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.Todos*" | Remove-AppxPackage -AllUsers
    Get-AppxPackage -AllUsers -Name "Microsoft.ParentalControl*" | Remove-AppxPackage -AllUsers

    (Get-AppxPackage -AllUsers).Name | Out-GridView

    # simple error log
    if ($Error.Count -ge "1" ) {
        $DateTime = Get-Date -Format "dd.MM.yyyy HH:mm"
        Add-Content -Value "$DateTime - $env:computername - $Error" -Path "~\desktop\RemoveBloatware-ErrorLog.log" -Force
    }
}
Remove-Bloatware
pause