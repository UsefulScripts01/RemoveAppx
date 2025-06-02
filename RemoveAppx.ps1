
function Remove-Appx {
    <#
    .SYNOPSIS
        Removes built-in Appx packages from Windows 10/11.

    .DESCRIPTION
        This function removes built-in Appx packages from Windows 10/11. It allows you to select which Appx packages to remove, or removes all specified packages by default.
        The function also creates a backup of the registry keys related to Appx packages before making any changes.

    .PARAMETER Select
        If specified, a selection dialog will be presented to choose which Appx packages to remove. If not specified, all defined Appx packages will be removed.
    #>

    param(
        [Parameter(Mandatory = $false)] [switch]$Select
    )

    # create Temp
    [void][System.IO.Directory]::CreateDirectory("C:\Temp")

    # Backup registry keys
    reg export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications C:\Temp\AppxPackages.reg /y

    $AppxToRemove = @(
        "Microsoft.BingWeather*"
        "Microsoft.BingSearch*"
        "Microsoft.BingNews*"
        "Microsoft.Microsoft3DViewer*"
        "Microsoft.MicrosoftSolitaireCollection*"
        "Microsoft.MicrosoftStickyNotes*"
        "Microsoft.MixedReality.Portal*"
        "Microsoft.MSPaint*"
        "Microsoft.Paint*"
        "Microsoft.Office.OneNote*"
        "Microsoft.OutlookForWindows*"
        "Microsoft.MicrosoftOfficeHub*"
        "Microsoft.People*"
        "Microsoft.ScreenSketch*"
        "Microsoft.SkypeApp*"
        "Microsoft.StorePurchaseApp*"
        "Microsoft.Wallet*"
        "Microsoft.WindowsAlarms*"
        "Microsoft.WindowsCamera*"
        "Microsoft.windowscommunicationsapps*"
        "Microsoft.WindowsFeedbackHub*"
        "Microsoft.WindowsMaps*"
        "Microsoft.Windows.DevHome*"
        "MicrosoftWindows.CrossDevice*"
        "Microsoft.WindowsSoundRecorder*"
        "Microsoft.Xbox.TCUI*"
        "Microsoft.XboxApp*"
        "Microsoft.XboxGameOverlay*"
        "Microsoft.XboxGamingOverlay*"
        "Microsoft.XboxIdentityProvider*"
        "Microsoft.XboxSpeechToTextOverlay*"
        "Microsoft.YourPhone*"
        "Microsoft.ZuneMusic*"
        "Microsoft.ZuneVideo*"
        "Microsoft.GetHelp*"
        "Microsoft.Todos*"
        "Microsoft.Copilot*"
        "Microsoft.PowerAutomateDesktop*"
        "MicrosoftCorporationII.QuickAssist*"
        "*Clipchamp.Clipchamp*"
    )

    # Check if Appx is installed
    $AppxFound = @()
    foreach ($Entry in $AppxToRemove) {
        if (Get-AppxPackage -AllUsers -Name $Entry) {
            $Appx = Get-AppxPackage -AllUsers -Name $Entry
            $AppxFound += $Appx[0].Name
        }
    }

    # if -Select
    if ($Select) {
        $AppxList = $AppxFound | Out-GridView -Title "Select Appx to remove:" -OutputMode Multiple
    }
    else {
        $AppxList = $AppxFound
    }

    # delete biult-in Appx
    foreach ($Appx in $AppxList) {
        try {
            Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications\$Appx*" | Remove-Item -Recurse -Force
            Get-AppxPackage -AllUsers -Name $Appx | Remove-AppxPackage -AllUsers

            if (!(Get-AppxPackage -AllUsers -Name $Appx)) {
                Write-Host "$Appx - Removed" -ForegroundColor Green
            }
            else {
                Write-Host "$Appx - Failed" -ForegroundColor Red
            }
        }
        catch {
            Write-Host "$Appx - Failed" -ForegroundColor Red
        }
    }

    # Save error log
    if ($Error.Count -ne 0) {
        $DateTime = Get-Date -Format "dd.MM.yyyy HH:mm"
        foreach ($Entry in $Error) {
            Add-Content -Value "$DateTime - $env:computername - $Entry" -Path "~\Desktop\ErrorLog.log" -Force
            $Line = '-' * '60'
            Write-Output "`n$Line`n" | Out-Host
            Write-Output "AN ERROR OCCURED. SEE THE ERROR LOG ON THE DESKTOP" | Out-Host
            Write-Output "`n$Line`n" | Out-Host
        }
    }
}
Remove-Appx -Select

