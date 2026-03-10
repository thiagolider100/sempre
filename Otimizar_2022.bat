@echo off
:: Desativa Animações e Transparências
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f

:: Desativa Windows Update e Impressora
sc stop wuauserv
sc config wuauserv start= disabled
sc stop Spooler
sc config Spooler start= disabled

:: Desativa Defender
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

:: Reinicia Explorer para aplicar
taskkill /f /im explorer.exe
start explorer.exe
exit
