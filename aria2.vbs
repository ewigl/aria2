set WS = CreateObject("WScript.Shell")

WS.Run "D:\Apps\aria2\updateAria2TrackersInFile.bat",0

WS.Run "D:\Apps\aria2\aria2c.exe --conf-path=aria2.conf",0
