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

    $AppList = @(  
        "Microsoft.BingWeather",
        "Microsoft.GetHelp",
        "Microsoft.Getstarted",
        "Microsoft.Microsoft3DViewer",
        "Microsoft.MicrosoftOfficeHub",
        "Microsoft.MicrosoftSolitaireCollection",
        #"Microsoft.MicrosoftStickyNotes",
        "Microsoft.MixedReality.Portal",
        "Microsoft.MSPaint",
        "Microsoft.Office.OneNote",
        "Microsoft.People",
        "Microsoft.SkypeApp",
        "Microsoft.StorePurchaseApp",
        "Microsoft.Wallet",
        "Microsoft.WindowsAlarms",
        "Microsoft.WindowsCamera",
        "microsoft.windowscommunicationsapps",
        "Microsoft.WindowsFeedbackHub",
        "Microsoft.WindowsMaps",
        "Microsoft.WindowsSoundRecorder",
        "Microsoft.Xbox.TCUI",
        "Microsoft.XboxApp",
        "Microsoft.XboxGameOverlay",
        "Microsoft.XboxGamingOverlay",
        "Microsoft.XboxIdentityProvider",
        "Microsoft.XboxSpeechToTextOverlay",
        "Microsoft.YourPhone",
        "Microsoft.ZuneMusic",
        "Microsoft.ZuneVideo",
        "Microsoft.Todos",
        "Microsoft.ParentalControl",
        "Microsoft.Teams"
    )

    # delete APPX manifest from the registry
    ForEach ($Registry in $AppList) {
        Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\$Registry*" | Remove-Item -Recurse -Force
    }
   
    # delete biult-in Apps
    ForEach ($Appx in $AppList) {
        Get-AppxPackage -AllUsers -Name "$Appx*" | Remove-AppxPackage -AllUsers
    }

    # list of installed APPX
    (Get-AppxPackage -AllUsers).Name | Out-GridView

    # simple error log
    if ($Error.Count -ge "1" ) {
        $DateTime = Get-Date -Format "dd.MM.yyyy HH:mm"
        Add-Content -Value "$DateTime - $env:computername - $Error" -Path "~\desktop\RemoveBloatware-ErrorLog.log" -Force
    }
}

Remove-Bloatware
pause