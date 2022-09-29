@echo off
@REM CMD限制变量字符长度1024，故放弃

@REM aria2.conf位置、要下载的trackers文件
@REM set CONF_FILE=D:\Apps-CLI\aria2\aria2.conf
@REM set TRACKER_FILE=trackers_all.txt
@REM set DOWNLOAD_LINK=https://raw.githubusercontent.com/ngosang/trackerslist/master/%TRACKER_FILE%

@REM set RPC_URL=http://localhost:6800/jsonrpc
@REM set RPC_SECRET=992017


@REM aria2c --dir=%~dp0 --allow-overwrite=true "%DOWNLOAD_LINK%"

@REM sed -i ":a;N;s/\n/ /; ta;" %~dp0%TRACKER_FILE%
@REM sed -i "1s/^//g; s/  /,/g; s/ $//;" %~dp0%TRACKER_FILE%

@REM set /P TRACKERS_DATA=< %TRACKER_FILE%

@REM echo %TRACKERS_DATA%

@REM curl %RPC_URL% -H "Content-Type: text/plain" -v -d "{\"id\":\"updatetrackers\",\"jsonrpc\":\"2.0\",\"method\":\"aria2.changeGlobalOption\",\"params\":[\"token:%RPC_SECRET%\",{\"bt-tracker\":\"%TRACKERS_DATA%\"}]}"

node updateAria2TrackersByRPC.js

pause