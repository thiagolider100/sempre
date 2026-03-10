@echo off
title Otimizacao Extrema Windows 2022
echo Aplicando ajustes de performance...

:: 1. DESATIVAR ANIMACOES, TRANSPARENCIAS E SOMBRAS
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d 9012038010000000 /f

:: 2. DESATIVAR SERVICOS (Update e Impressora)
sc stop wuauserv
sc config wuauserv start= disabled
sc stop Spooler
sc config Spooler start= disabled

:: 3. REMOVER PAPEL DE PAREDE
reg add "HKCU\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d "" /f

:: 4. DESATIVAR DEFENDER (Ganho de CPU)
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

:: 5. REINICIAR EXPLORER (Aplica as mudanças visuais na hora)
taskkill /f /im explorer.exe
start explorer.exe

echo Otimizacao Concluida!
exit
