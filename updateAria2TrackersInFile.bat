@echo off
chcp 65001

@REM aria2.conf位置、要下载的trackers文件，在这里修改
@REM set CONF_FILE=D:\Apps-CLI\aria2\aria2Copy.conf
set CONF_FILE=D:\Apps-CLI\aria2\aria2.conf
set TRACKER_FILE=trackers_all.txt
set DOWNLOAD_LINK=https://raw.githubusercontent.com/ngosang/trackerslist/master/%TRACKER_FILE%

@REM 下载 trackerlist
@REM 下载文件到bat执行目录
aria2c --dir=%~dp0 --allow-overwrite=true "%DOWNLOAD_LINK%"

@REM 用 sed 整理 trackerlist 格式
echo 整理格式...
sed -i ":a;N;s/\n/ /; ta;" %~dp0%TRACKER_FILE%
sed -i "1s/^/bt-tracker=/g; s/  /,/g; s/ $//;" %~dp0%TRACKER_FILE%

@REM 删除当前 aria2 配置 中的 trackerlist
sed -i "/^bt-tracker=/d" %CONF_FILE%
type %~dp0%TRACKER_FILE% >> %CONF_FILE%

echo 更新成功...
@REM 删除已下载的trackers文件
@REM echo 清理...
@REM del .\%TRACKER_FILE%

pause