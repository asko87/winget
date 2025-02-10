# Powershell -ExecutionPolicy Bypass -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/asko87/winget/refs/heads/main/winget.ps1'))"

Start-Transcript -Path C:\apps.log


# -------------------------------
# SYSTEM CHECK & INFO
# -------------------------------
Write-Host "Running system checks..." -ForegroundColor Cyan

# Detect Windows Edition
$windowsEdition = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").EditionID
Write-Host "Windows Edition: $windowsEdition"

# Determine if the system is Windows Home or Professional
$isPro = $windowsEdition -match "Professional"
$isHome = $windowsEdition -match "Home

# -------------------------------
# DISABLE TELEMETRY & DATA COLLECTION
# -------------------------------
Write-Host "Disabling telemetry and data collection..." -ForegroundColor Yellow

# Set telemetry level to lowest (Security)
if ($isPro) {
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Force
} else {
    Write-Host "Telemetry settings are limited on Windows Home." -ForegroundColor Red
}

# Disable telemetry services (applies to both Home and Pro)
Stop-Service -Name "DiagTrack" -Force -ErrorAction SilentlyContinue
Set-Service -Name "DiagTrack" -StartupType Disabled

Stop-Service -Name "dmwappushservice" -Force -ErrorAction SilentlyContinue
Set-Service -Name "dmwappushservice" -StartupType Disabled

# -------------------------------
# DISABLE ADS & IMPROVE PRIVACY
# -------------------------------
Write-Host "Disabling ads and improving privacy settings..." -ForegroundColor Yellow

# Disable ads in Windows
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Value 0 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0 -Force

# Disable inking and typing data collection
Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Value 1 -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Value 1 -Force

# Disable Cortana (Windows Pro only)
if ($isPro) {
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -Force
}

#uninstall
winget uninstall Microsoft.Teams
winget uninstall Microsoft.DevHome
winget uninstall Microsoft.BingNews_8wekyb3d8bbwe
winget uninstall Microsoft.BingSearch_8wekyb3d8bbwe
winget uninstall Microsoft.BingWeather_8wekyb3d8bbwe
winget uninstall Microsoft.Copilot_8wekyb3d8bbwe
winget uninstall Microsoft.GamingApp_8wekyb3d8bbwe
winget uninstall Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe
winget uninstall Microsoft.Xbox.TCUI_8wekyb3d8bbwe
winget uninstall Microsoft.XboxGamingOverlay_8wekyb3d8bbwe
winget uninstall Microsoft.XboxIdentityProvider_8wekyb3d8bbwe
winget uninstall Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe
winget uninstall Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe

#install
winget install --id=RIA.eIDsoftware -e -h --disable-interactivity --accept-source-agreements --accept-package-agreements
winget install --id=Brave.Brave -e -h --disable-interactivity --accept-source-agreements --accept-package-agreements --scope machine
winget install --id=VideoLAN.VLC -e -h --disable-interactivity --accept-source-agreements --accept-package-agreements --scope machine
winget install --id=Mozilla.Firefox.ESR -e -h --disable-interactivity --accept-source-agreements --accept-package-agreements --scope machine
winget install --id=Google.Chrome -e -h --disable-interactivity --accept-source-agreements --accept-package-agreements --scope machine
winget install --id=TheDocumentFoundation.LibreOffice -e -h --disable-interactivity --accept-source-agreements --accept-package-agreements
winget install --id=7zip.7zip -e -h --disable-interactivity --accept-source-agreements --accept-package-agreements --scope machine
exit
