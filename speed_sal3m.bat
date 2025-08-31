@echo off
title Windows Deep Cleaner

echo Press ENTER to start cleaning...
pause >nul

:: Temp - النظام
del /f /s /q "C:\Windows\Temp\*.*" >nul 2>&1
for /d %%x in ("C:\Windows\Temp\*") do rd /s /q "%%x"

:: Temp - المستخدم
del /f /s /q "%temp%\*.*" >nul 2>&1
for /d %%x in ("%temp%\*") do rd /s /q "%%x"

:: Prefetch
del /f /s /q "C:\Windows\Prefetch\*.*" >nul 2>&1

:: Windows Update Cache
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>&1
for /d %%x in ("C:\Windows\SoftwareDistribution\Download\*") do rd /s /q "%%x"

:: Delivery Optimization
del /f /s /q "C:\Windows\SoftwareDistribution\DeliveryOptimization\*.*" >nul 2>&1
for /d %%x in ("C:\Windows\SoftwareDistribution\DeliveryOptimization\*") do rd /s /q "%%x"

:: Recycle Bin
rd /s /q %systemdrive%\$Recycle.Bin

:: Recent files
del /f /s /q "%AppData%\Microsoft\Windows\Recent\*.*" >nul 2>&1

:: Crash dumps
del /f /s /q "C:\Windows\Minidump\*.*" >nul 2>&1
del /f /s /q "C:\Windows\LiveKernelReports\*.*" >nul 2>&1

:: Browser cache (Edge/IE)
del /f /s /q "%LocalAppData%\Microsoft\Windows\INetCache\*.*" >nul 2>&1

:: Thumbs.db و IconCache
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*" >nul 2>&1
del /f /s /q "%UserProfile%\AppData\Local\IconCache.db" >nul 2>&1

:: Installer temp
del /f /s /q "C:\Windows\Installer\*.tmp" >nul 2>&1

:: .log و .bak
for /r C:\ %%x in (*.log *.bak) do del /f /q "%%x"

echo Done.
pause >nul
