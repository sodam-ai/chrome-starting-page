@echo off
cd /d "%~dp0"

:: Use local portable node if available, else system node
if exist "node\node.exe" (
    powershell -WindowStyle Hidden -Command "Start-Process 'node\node.exe' -ArgumentList 'server.js' -WorkingDirectory '%~dp0' -WindowStyle Hidden"
) else (
    powershell -WindowStyle Hidden -Command "Start-Process 'node' -ArgumentList 'server.js' -WorkingDirectory '%~dp0' -WindowStyle Hidden"
)
