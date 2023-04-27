
function Remove-Appx {
    param(
        [Parameter(Mandatory = $false)] [switch]$Select
    )

    $All = @(
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
        "Microsoft.ZuneVideo*"
    )

    if ($Select) {
        $AppList = $All | Out-GridView -Title "Select Appx to remove:" -OutputMode Multiple
    }
    else {
        $AppList = $All
    }

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
    }
       
    # Save error log
    if ($Error.Count -ne 0) {
        $DateTime = Get-Date -Format "dd.MM.yyyy HH:mm"
        foreach ($Entry in $Error) {
            Add-Content -Value "$DateTime - $env:computername - $Entry" -Path "~\Desktop\ErrorLog.log" -Force
        }
    }
}
Remove-Appx
