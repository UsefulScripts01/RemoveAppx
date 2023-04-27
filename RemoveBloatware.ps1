
function Remove-Bloatware {
    <#
    .SYNOPSIS
    Remove all APPX bloatware from the operating system.

    .DESCRIPTION
    This script removes all useless APPX applications from the operating system.

    USAGE
    - Download RemoveBloatware.ps1 and StartScript.bat to the same location.
    - Run the StartScript.bat file as Administrator (context menu)

    You can restore APPX applications with the command below:
    Get-AppxPackage -AllUsers "*GetHelp*" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

    .EXAMPLE

    .NOTES

    .LINK

    #>

    $AppList = @(
        "Microsoft.BingWeather*"
        "Microsoft.Microsoft3DViewer*"
        "Microsoft.MicrosoftSolitaireCollection*"
        "Microsoft.MicrosoftStickyNotes*"
        "Microsoft.MixedReality.Portal*"
        "Microsoft.MSPaint*"
        "Microsoft.Office.OneNote*"
        "Microsoft.People*"
        "Microsoft.ScreenSketch*"
        "Microsoft.SkypeApp*"
        "Microsoft.StorePurchaseApp*"
        "Microsoft.Wallet*"
        "Microsoft.Windows.Photos*"
        "Microsoft.WindowsAlarms*"
        "Microsoft.WindowsCamera*"
        "Microsoft.windowscommunicationsapps*"
        "Microsoft.WindowsFeedbackHub*"
        "Microsoft.WindowsMaps*"
        "Microsoft.WindowsSoundRecorder*"
        "Microsoft.Xbox.TCUI*"
        "Microsoft.XboxApp*"
        "Microsoft.XboxGameOverlay*"
        "Microsoft.XboxGamingOverlay*"
        "Microsoft.XboxIdentityProvider*"
        "Microsoft.XboxSpeechToTextOverlay*"
        "Microsoft.YourPhone*"
        "Microsoft.ZuneMusic*"
        "Microsoft.ZuneMusic*"
        "Microsoft.ZuneVideo*"
    )
    
    <# delete APPX manifest from the registry
    ForEach ($Registry in $AppList) {
        Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\$Registry*" | Remove-Item -Recurse -Force
    } #>

    # delete biult-in Apps
    ForEach ($Appx in $AppList) {
        try {
            Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\$Appx*" | Remove-Item -Recurse -Force
            Get-AppxPackage -AllUsers -Name $Appx | Remove-AppxPackage -AllUsers
            Write-Host "$Appx - Removed" -ForegroundColor Green
        }
        catch {
            Write-Host "$Appx - Failed" -ForegroundColor Red
        }

        Get-AppxPackage -AllUsers -Name $Appx | Remove-AppxPackage -AllUsers
    }
       
    # Save error log
    if (!$Error.Count.Equals(0)) {
        $DateTime = Get-Date -Format "dd.MM.yyyy HH:mm"
        foreach ($Entry in $Error) {
            Add-Content -Value "$DateTime - $env:computername - $Entry" -Path "~\Desktop\ErrorLog.log" -Force
        }
    }
}

Remove-Bloatware
Pause
