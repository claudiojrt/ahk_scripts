#Persistent

; MAIN
LA=0

; HOTKEYS
F10::
{
	IfWinExist, Sequencial
	{
		WinActivate
	}
	else{
		Gui, New,, Sequencial
		Gui, Add,  GroupBox,	x13 y5 w143 h70,
		Gui, Add,  Text,		x22 y23 w70 h15, Numero inicial:
		Gui, Add,  Text,		x22 y51 w70 h15, Iterações:
		Gui, Add,  Edit,		x95 y19 w50 h19  Number Limit5 vNumero,
		Gui, Add,  Edit,		x95 y47 w50 h19  Number Limit4 vIter,
		Gui, Add,  Button,		x77 y82 w80 h23 gButton1, Ok
		Gui, Show, 				w169 h112,
	}
	return
}


GuiEscape:
{
	Gui Destroy
	Return
}
!ESC::ExitApp


; MACRO
Button1:
{
	Gui Submit
	LA = %Numero%	
	Loop, %Iter%
	{
		Send %LA%
		Send {Down}
		LA++
	}
	return
}









