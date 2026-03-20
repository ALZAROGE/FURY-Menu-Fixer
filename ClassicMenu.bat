@echo off
:: ÇáÊÍÞÞ ãä ÕáÇÍíÇÊ ÇáãÓÄæá
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Please run this file as Administrator.
    pause
    exit
)

:menu
cls
title Windows 11 Context Menu Tool - FURY FAMILY
echo ===========================================
echo       Developer: FURYxZAROGE
echo       Community: FURY FAMILY
echo       Discord: https://discord.gg/fyly
echo ===========================================
echo [1] Enable Classic Menu (Windows 10 Style)
echo [2] Restore Default Menu (Windows 11 Style)
echo [3] Exit
echo ===========================================
set /p opt="Choose an option: "

if %opt%==1 goto enable
if %opt%==2 goto disable
if %opt%==3 exit
goto menu

:enable
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve >nul 2>&1
goto restart

:disable
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f >nul 2>&1
goto restart

:restart
echo Restarting Explorer to apply changes...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo Done! All changes applied.
pause
goto menu