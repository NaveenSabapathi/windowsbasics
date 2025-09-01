@echo off
title Dustin-mods - RPC Printer Policy
setlocal ENABLEEXTENSIONS

:: --- Check for admin and self-elevate if needed ---
>nul 2>&1 net session
if NOT %errorlevel%==0 (
  echo Requesting administrative privileges...
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
  exit /b
)

echo.
echo [Breeze Computers] Applying Windows RPC printer policy...

set "RPCKEY=HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\RPC"

:: Create base keys
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers" /f >nul
reg add "%RPCKEY%" /f >nul

:: Set DWORD values inside ...\Printers\RPC
:: 0 = RpcOverTcp (default)
reg add "%RPCKEY%" /v RpcOverTcp /t REG_DWORD /d 0 /f

:: 1 = RpcOverNamedPipes
reg add "%RPCKEY%" /v RpcOverNamedPipes /t REG_DWORD /d 1 /f

:: 1 = RpcUseNamedPipeProtocol
reg add "%RPCKEY%" /v RpcUseNamedPipeProtocol /t REG_DWORD /d 1 /f

if %errorlevel% NEQ 0 (
  echo.
  echo [Error] Could not write to the registry. Please ensure you ran this as Administrator.
  echo Press any key to exit...
  pause >nul
  exit /b 1
)

echo.
echo [Success] Policy keys and values were created/updated.
echo.

:: Show friendly messages
powershell -NoProfile -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Thanks for your Trust in Breeze Computers','Breeze Computers')"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('You need to reboot your system and add the USB printer via network share.','Next Steps')"

echo Thanks for your Trust......
echo You need to reboot your system and add the USB printer via network share.
echo.
echo Press any key to close...
pause >nul
endlocal
