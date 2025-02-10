# Powershell -ExecutionPolicy Bypass -command "iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/asko87/winget/blob/main/winget.ps1'))"
Start-Transcript -Path C:\apps.log

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
