@echo off

SET PROCESS_NAME=aria2c.exe

@REM taskkill /F /T /im %PROCESS_NAME%
taskkill /F /im %PROCESS_NAME%

start aria2.vbs

echo Restarting...
timeout /t 2

tasklist | find "%PROCESS_NAME%"

echo Aria2 Restarted.

pause
