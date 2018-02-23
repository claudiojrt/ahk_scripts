#Persistent
#SingleInstance force
#NoTrayIcon

; MAIN
LA=0


IfWinExist, `log Formatter
{
	WinActivate
}
else{
	Gui, New, , Magic `Log parser
	Gui, Add, GroupBox, x13 y6 w614 h50,
	Gui, Add, Text, x26 y27 w70 h19, Caminho:
	Gui, Add, Edit, x81 y24 w534 h19 Limit256 v_caminho,
	Gui, Add, Button, x528 y65 w100 h23 gButton1, Converter
	Gui, Show, w640 h98,
}
return

GuiEscape:
{
	Gui Destroy
	ExitApp
}
GuiClose:
{
	ExitApp
}

Button1:
{
	ExitApp
}