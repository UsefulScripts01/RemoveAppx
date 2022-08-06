# RemoveBloatware

## USAGE

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/UsefulScripts01/RemoveBloatware/main/RemoveBloatware.ps1'))
```

Paste the above command in PowerShell Admin (one right click).