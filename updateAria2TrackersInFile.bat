@echo off

@REM aria2.conf path
set CONF_FILE=D:\Apps\aria2\aria2.conf

@REM Trackers download dir
set TRACKER_FILE_FOLDER=temp

@REM Trackers file name
set TRACKER_FILE=trackers_all.txt
@REM set TRACKER_FILE=trackers_all_ip.txt
@REM set TRACKER_FILE=trackers_best.txt
@REM set TRACKER_FILE=trackers_best_ip.txt

@REM Trackers down link
@REM Github 
@REM set DOWNLOAD_LINK=https://raw.githubusercontent.com/ngosang/trackerslist/master/%TRACKER_FILE%
@REM Mirror1 GitHub io
@REM set DOWNLOAD_LINK=https://ngosang.github.io/trackerslist/%TRACKER_FILE%
@REM Mirror2 JsDeliver
set DOWNLOAD_LINK=https://cdn.jsdelivr.net/gh/ngosang/trackerslist@master/%TRACKER_FILE%


@REM down trackerlist to temp
echo Downloading...
aria2c --dir=%~dp0/%TRACKER_FILE_FOLDER% --allow-overwrite=true "%DOWNLOAD_LINK%"
echo Downloaded.

@REM sed trackerlist format
echo Formatting...
sed -i ":a;N;s/\n/ /; ta;" %~dp0/%TRACKER_FILE_FOLDER%/%TRACKER_FILE%
sed -i "1s/^/bt-tracker=/g; s/  /,/g; s/ $//;" %~dp0/%TRACKER_FILE_FOLDER%/%TRACKER_FILE%
echo Formatted.

@REM delete old trackerlist
echo Updating...
sed -i "/^bt-tracker=/d" %CONF_FILE%
@REM append trackerlist
type %~dp0\%TRACKER_FILE_FOLDER%\%TRACKER_FILE% >> %CONF_FILE%
echo Updated.

echo Done.

@REM pause
