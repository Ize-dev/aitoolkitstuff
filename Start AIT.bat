@echo off
REM ==============================
REM AI Toolkit Starter
REM ==============================

set "BASEDIR=%~dp0"
set "VENV_PATH=%BASEDIR%venv"
set "UI_PATH=%BASEDIR%ui"
set "DASHBOARD_URL=http://192.168.178.38:8675/dashboard"

echo [AI TOOLKIT] Starting...

REM --- venv activate ---
if not exist "%VENV_PATH%\Scripts\activate.bat" (
    echo [ERROR] venv not found: %VENV_PATH%
    pause
    exit /b 1
)

call "%VENV_PATH%\Scripts\activate.bat"

REM --- UI dir ---
cd /d "%UI_PATH%"

REM --- npm start in new window ---
del /q favicon.ico 2>nul
curl.exe -s --output favicon.ico --url "%DASHBOARD_URL%/favicon.ico"

if exist favicon.ico (
    echo [Server up]
    start "" "%DASHBOARD_URL%"
    del /q favicon.ico 2>nul
    exit /b 0
) else (
    echo [Server down]
    start "AI Toolkit UI" cmd /k npm start
)

del /q favicon.ico 2>nul

REM --- wait a sec ---
timeout /t 1 /nobreak >nul

REM --- Open Dashboard ---
start "" "%DASHBOARD_URL%"

echo [AI TOOLKIT] Dashboard opened.
exit /b 0
