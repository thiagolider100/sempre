@echo off
net stop wuauserv /y >nul 2>&1
sc config wuauserv start= disabled >nul 2>&1
net stop bits /y >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Terminal Server Client\Default" /v DesktopWidth /t REG_DWORD /d 1200 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Terminal Server Client\Default" /v DesktopHeight /t REG_DWORD /d 720 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v FontSmoothing /t REG_SZ /d 0 /f >nul 2>&1
powercfg /hibernate off >nul 2>&1
exit
