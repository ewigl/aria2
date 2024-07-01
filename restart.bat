@echo off

SET PROCESS_NAME=aria2c.exe

echo Restart aria2 ?
pause

tasklist | findstr "%PROCESS_NAME%"
if ERRORLEVEL 1 (
    echo Aria2 not running, Starting...
) else (
    echo Aria2 running, Killing...
    taskkill /F /T /im %PROCESS_NAME%
)

echo Restarting...
start aria2.vbs
timeout /t 2

tasklist | findstr "%PROCESS_NAME%"
if ERRORLEVEL 1 (
    echo Aria2 restart failed.
) else (
    echo Aria2 Restarted.
)

pause
