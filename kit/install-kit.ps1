$ErrorActionPreference = "Stop"

$installDir = "$env:LOCALAPPDATA\Programs\Kit"
$exeUrl = "https://github.com/faisalimap/kit/releases/latest/download/kit.exe"

Write-Host ""
Write-Host "🚀 Starting Kit CLI Installation..." -ForegroundColor Cyan

# 1. Create the Directory
if (-not (Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir | Out-Null
}

# 2. Download the Binary
Write-Host "⬇️ Downloading latest release from GitHub..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $exeUrl -OutFile "$installDir\kit.exe"

# 3. Add to PATH
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$installDir*") {
    Write-Host "🔧 Adding Kit to Environment PATH..." -ForegroundColor Cyan
    [Environment]::SetEnvironmentVariable("Path", "$userPath;$installDir", "User")
    
    Write-Host ""
    Write-Host "✅ Kit CLI installed successfully!" -ForegroundColor Green
    Write-Host "⚠️ IMPORTANT: Close this terminal and open a new one to use the 'kit' command." -ForegroundColor Yellow
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "✅ Kit CLI updated successfully! You are ready to go." -ForegroundColor Green
    Write-Host ""
}