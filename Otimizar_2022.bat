@echo off
title Otimizacao Extrema GitHub Actions
echo Aplicando ajustes de performance...

:: 1. DESATIVAR WINDOWS UPDATE (Evita picos de CPU e disco)
sc stop wuauserv
sc config wuauserv start= disabled
sc stop bits
sc config bits start= disabled
sc stop dosvc
sc config dosvc start= disabled

:: 2. DESATIVAR IMPRESSORA (Spooler)
sc stop Spooler
sc config Spooler start= disabled

:: 3. DESATIVAR BLUETOOTH (Inútil em VM)
sc stop bthserv
sc config bthserv start= disabled

:: 4. DESATIVAR ANIMAÇÕES E TRANSPARÊNCIAS (RDP Fluido)
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f

:: 5. REMOVER PAPEL DE PAREDE (Fundo preto = Menos lag)
reg add "HKCU\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d "" /f

:: 6. PRIORIDADE DE PERFORMANCE E CPU
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f

:: 7. DESATIVAR DEFENDER (Ganho real de RAM)
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

:: 8. REINICIAR EXPLORER PARA APLICAR TUDO
taskkill /f /im explorer.exe
start explorer.exe

echo Otimizacao Concluida!
exit
