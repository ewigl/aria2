set WS = CreateObject("WScript.Shell")

WS.Run "aria2c.exe --conf-path=aria2.conf",0
