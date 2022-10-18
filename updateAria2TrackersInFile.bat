@echo off

@REM aria2.conf位置
set CONF_FILE=D:\Apps-CLI\aria2\aria2.conf

@REM Trackers下载目录
set TRACKER_FILE_FOLDER=temp

@REM Trackers文件名
set TRACKER_FILE=trackers_all.txt
@REM set TRACKER_FILE=trackers_all_ip.txt
@REM set TRACKER_FILE=trackers_best.txt
@REM set TRACKER_FILE=trackers_best_ip.txt

@REM Trackers下载链接
@REM Github链接
set DOWNLOAD_LINK=https://raw.githubusercontent.com/ngosang/trackerslist/master/%TRACKER_FILE%
@REM Mirror1
@REM set DOWNLOAD_LINK=https://ngosang.github.io/trackerslist/%TRACKER_FILE%
@REM Mirror2
@REM set DOWNLOAD_LINK=https://cdn.jsdelivr.net/gh/ngosang/trackerslist@master/%TRACKER_FILE%


@REM 下载 trackerlist 到 temp 目录
echo Downloading...
aria2c --dir=%~dp0/%TRACKER_FILE_FOLDER% --allow-overwrite=true "%DOWNLOAD_LINK%"
echo Downloaded.

@REM 用 sed 整理 trackerlist 格式
echo Formatting...
sed -i ":a;N;s/\n/ /; ta;" %~dp0/%TRACKER_FILE_FOLDER%/%TRACKER_FILE%
sed -i "1s/^/bt-tracker=/g; s/  /,/g; s/ $//;" %~dp0/%TRACKER_FILE_FOLDER%/%TRACKER_FILE%
echo Formatted.

@REM 删除当前 aria2 配置 中的 trackerlist
echo Updating...
sed -i "/^bt-tracker=/d" %CONF_FILE%
type %~dp0%TRACKER_FILE% >> %CONF_FILE%
echo Updated.

echo Done.

pause
