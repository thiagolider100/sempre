@echo off
title Otimizacao Extrema Windows 2022
echo Aplicando ajustes de performance...

:: 1. DESATIVAR WINDOWS UPDATE (Evita picos de CPU)
sc stop wuauserv
sc config wuauserv start= disabled
sc stop bits
sc config bits start= disabled

:: 2. DESATIVAR IMPRESSORA E BLUETOOTH
sc stop Spooler
sc config Spooler start= disabled
sc stop bthserv
sc config bthserv start= disabled

:: 3. DESATIVAR ANIMACOES E TRANSPARENCIAS (RDP Fluido)
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f

:: 4. REMOVER PAPEL DE PAREDE (Fundo preto economiza banda)
reg add "HKCU\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d "" /f

:: 5. DESATIVAR DEFENDER (Libera RAM e CPU)
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

:: 6. PRIORIDADE DE PERFORMANCE
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f

:: 7. REINICIAR EXPLORER PARA APLICAR TUDO
taskkill /f /im explorer.exe
start explorer.exe

echo Otimizacao Concluida!
exit
