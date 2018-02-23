#Persistent
#SingleInstance force
#NoTrayIcon
#Include tf.ahk

;@TODO
;- All replaces
;- Fix cursor change animation
;- Combo box to select which version of Magic to use
;- Checkboxes to select what replaces to do (all true by default)

;GUI
IfWinExist, Formatter
{
	WinActivate
}
else{
	CursorReset()
	Gui, New, , `Log formatter
	Gui, Add, GroupBox, x13 y6 w614 h50,
	Gui, Add, Text, x26 y27 w70 h19, Caminho:
	Gui, Add, Edit, x81 y24 w534 h19 Limit256 vPath,
	Gui, Add, Button, x528 y65 w100 h23 gButton1, Converter
	Gui, Show, w640 h98,
}
return

;EXIT
GuiEscape:
{
	Gui Destroy
	ExitApp
}
GuiClose:
{
	ExitApp
}

;SCRIPT
Button1:
{
	CursorWait()
	Gui Submit, NoHide

	F=!%Path%
	log_format(F)

	Run, %Path%
	CursorReset()
}

CursorWait(){
	CursorHandle:=DllCall("LoadCursor",Uint,0,Int,32512)
	DllCall("SetSystemCursor",Uint,CursorHandle,Int,32514)
}

CursorReset(){
	SPI_SETCURSORS:=0x57
	DllCall("SystemParametersInfo",UInt,SPI_SETCURSORS,UInt,0,UInt,0,UInt,0)
}

log_format(log_path){
	line_counter:=TF_CountLines(log_path)

	;Remove unecessary execution codes
	TF_RegExReplaceInLines(log_path,0,line_counter,"^\s<\d{18}>\s","")

	;Remove unecessary enters
	TF_RegExReplaceInLines(log_path,0,line_counter,"\n^\t","\t")

	;Remove CGData from table names
	TF_ReplaceInLines(log_path,0,line_counter,"{CGData}.","")

	;New line for SELECT
	TF_RegExReplaceInLines(log_path,0,line_counter,"STMT: SELECT","STMT:\nSELECT")

	;Simplification
	TF_ReplaceInLines(log_path,0,line_counter,"Flow - Variable Column","Column")
	TF_ReplaceInLines(log_path,0,line_counter,"Flow - Variable Virtual","Virtual")
	TF_ReplaceInLines(log_path,0,line_counter,"Flow - Variable Parameter","Parameter")
	TF_ReplaceInLines(log_path,0,line_counter,"Fast Forward","FF")
	TF_ReplaceInLines(log_path,0,line_counter,">>  Processing Event",">> Event")
	TF_ReplaceInLines(log_path,0,line_counter,"{CGData}.","")2
}