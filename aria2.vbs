set WS = CreateObject("WScript.Shell")

WS.Run "updateTrackers.bat",0

WS.Run "aria2c.exe --conf-path=aria2.conf",0
