@echo off
:: Desativa animações para o RDP não travar
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f

:: Remove o papel de parede (fundo preto = mais velocidade)
reg add "HKCU\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d "" /f

:: Prioridade total do processador para tarefas (Performance)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f

:: Desativa o Defender para liberar RAM e CPU
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

exit
