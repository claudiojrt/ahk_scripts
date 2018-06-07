#Persistent
#SingleInstance force

IfNotExist, %A_AppData%\Tondin\
  FileCreateDir, %A_AppData%\Tondin\

IniWrite, 1, %A_AppData%\Tondin\script.ini, Main, initMessage

ExitApp
