@echo off
title Otimizador
cls

net stop wuauserv /y >nul 2>&1
sc config wuauserv start= disabled >nul 2>&1
net stop bits /y >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1

echo @echo off > "C:\Users\runneradmin\Desktop\ATIVAR_UPDATE.bat"
echo title Ativador Update >> "C:\Users\runneradmin\Desktop\ATIVAR_UPDATE.bat"
echo sc config wuauserv start= auto >> "C:\Users\runneradmin\Desktop\ATIVAR_UPDATE.bat"
echo net start wuauserv >> "C:\Users\runneradmin\Desktop\ATIVAR_UPDATE.bat"
echo sc config bits start= auto >> "C:\Users\runneradmin\Desktop\ATIVAR_UPDATE.bat"
echo net start bits >> "C:\Users\runneradmin\Desktop\ATIVAR_UPDATE.bat"
echo echo Windows Update Ativado! >> "C:\Users\runneradmin\Desktop\ATIVAR_UPDATE.bat"
echo pause >> "C:\Users\runneradmin\Desktop\ATIVAR_UPDATE.bat"
echo exit >> "C:\Users\runneradmin\Desktop\ATIVAR_UPDATE.bat"

net stop DiagTrack /y >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
net stop dmwappushservice /y >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1
net stop WbioSrvc /y >nul 2>&1
sc config WbioSrvc start= disabled >nul 2>&1
net stop bthserv /y >nul 2>&1
sc config bthserv start= disabled >nul 2>&1
net stop spooler /y >nul 2>&1
sc config spooler start= disabled >nul 2>&1
net stop SysMain /y >nul 2>&1
sc config SysMain start= disabled >nul 2>&1
net stop WSearch /y >nul 2>&1
sc config WSearch start= disabled >nul 2>&1
net stop MapsBroker /y >nul 2>&1
sc config MapsBroker start= disabled >nul 2>&1

reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 122 /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d 58 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Accessibility" /v Configuration /t REG_SZ /d "" /f >nul 2>&1

powershell -command "Get-Printer | Remove-Printer" >nul 2>&1
powershell -command "Get-AppxPackage *FeedbackHub* | Remove-AppxPackage" >nul 2>&1
powershell -command "Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage" >nul 2>&1
powershell -command "Get-AppxPackage *Microsoft.XboxGamingOverlay* | Remove-AppxPackage" >nul 2>&1

reg add "HKCU\Software\Microsoft\Terminal Server Client\Default" /v DesktopWidth /t REG_DWORD /d 1200 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Terminal Server Client\Default" /v DesktopHeight /t REG_DWORD /d 720 /f >nul 2>&1

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v FontSmoothing /t REG_SZ /d 0 /f >nul 2>&1

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1

powercfg /hibernate off >nul 2>&1
powercfg /x -monitor-timeout-ac 0 >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v MouseSpeed /t REG_SZ /d 2 /f >nul 2>&1

powershell -command "[System.GC]::Collect()" >nul 2>&1

set "LOG_FILE=D:\a\monitor10\monitor10\v_log.txt"
set "DESKTOP_FILE=C:\Users\runneradmin\Desktop\LINK_ACESSO.txt"
powershell -command "$log = Get-Content '%LOG_FILE%' -ErrorAction SilentlyContinue; if ($log) { $link = $log | Select-String -Pattern 'https://.*\.trycloudflare\.com' | ForEach-Object { $_.Matches.Value }; if ($link) { $link | Out-File -FilePath '%DESKTOP_FILE%' } }"

taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

timeout /t 1
exit
