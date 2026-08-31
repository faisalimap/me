$ErrorActionPreference = "Stop"

# Points to your GitHub repo's latest release
$exeUrl = "https://github.com/faisalimap/kit/releases/latest/download/Kit-Setup.exe"
$tempExe = "$env:TEMP\Kit-Setup.exe"

Write-Host "Downloading Kit CLI..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $exeUrl -OutFile $tempExe

Write-Host "Installing Kit CLI silently..." -ForegroundColor Cyan
# Runs the Inno Setup installer without showing the wizard
Start-Process -FilePath $tempExe -ArgumentList "/VERYSILENT", "/SUPPRESSMSGBOXES", "/NORESTART" -Wait -NoNewWindow

Write-Host "Kit CLI installed successfully!" -ForegroundColor Green
Write-Host "Please restart your terminal to use the 'kit' command." -ForegroundColor Yellow
