; MAIN


; HOTKEYS
F11::
{
	Send ^c
	ClipWait
	Count := StrLen(Clipboard)
	MsgBox, , Atenção, Texto copiado: %clipboard%`n`nTamanho: %Count%
	return
}
^F9::
{
	IfWinExist, Cria Parâmetros
	{
		WinActivate
	}
	else{
		Gui, New,, Cria Parâmetros
		Gui, Add, Text, w160, Quantos parâmetros deseja criar?
		Gui, Add, Edit, w160 vCount3,
		Gui, Add, Button, w160 gButton3, Ok
		Gui, Show
	}
	return
}
^F10::
{
	IfWinExist, Copia Parametros
	{
		WinActivate 
	}
	else{
		Gui, New,, Copia Parametros
		Gui, Add, Text, x15 y7 w150, Quantos valores deseja copiar?
		Gui, Add, Edit, x170 y5 w30 vCount1,
		Gui, Add, Text, x205 y7 w20, (+1)
		Gui, Add, Button, x123 w100 gButton1, Ok
		Gui, Show
	}
	return
}
^F11::
{
	IfWinExist, Copia Modelos
	{
		WinActivate 
	}
	else{
		Gui, New,, Copia Modelos
		Gui, Add, Text, w155, Quantos modelos deseja copiar?
		Gui, Add, Edit, w155 vCount4,
		Gui, Add, Button, w155 gButton4, Ok
		Gui, Show
	}
	return
}
^F12::
{
	IfWinExist, Exclui Registros
	{
		WinActivate 
	}
	else{
		Gui, New,, Exclui Registros
		Gui, Add, Text, W150, Quantas linhas deseja excluir?
		Gui, Add, Edit, w150 vCount2,
		Gui, Add, Button, W150 gButton2, Ok
		Gui, Show
	}
	return
}
ScrollLock::Suspend
!ESC::ExitApp
GuiEscape:
{
	Gui Destroy
	Return
}


; MACROS
Button1:	; Copia Parâmetros
{
	Gui, Submit
	Sleep 100
	Loop, %Count1%
	{
		clipboard=
		Send ^c
		ClipWait
		Sleep 30
		Send {Down}
		Sleep 30
		AltTab()
		Sleep 30
		SendInput %Clipboard%
		Sleep 30
		Send {Down}
		Sleep 30
		AltTab()
	}	
	clipboard=
	Send ^c
	ClipWait
	Sleep 30
	AltTab()
	Sleep 30
	SendInput %Clipboard%
	Sleep 30
	Send {Tab}
	return
}
Button2:	; Exclui linhas
{
	Gui, Submit
	Sleep 100
	Loop, %Count2%
	{
		SendInput {F3}
		Sleep 25
		SendInput y
		Sleep 50
	}
	return
}
Button3:	; Cria Parâmetros
{
	Gui, Submit
	Sleep 100
	Loop, %Count3%
	{
		SendInput {F4}
		Sleep 40
	}
	return
}
Button4:	; Copia modelos
{
	Gui, Submit
	Sleep 100
	Loop, %Count4%
	{
		clipboard=
		Send ^c
		ClipWait
		Sleep 30
		Var:=clipboard
		if(Var=0){
			CopiaSemModelo()
		}
		else{
			if(var>700){
				Var:=Var-700
			}
			Send {Down}
			Sleep 30
			AltTab()
			Sleep 30
			SendInput %Var%
			Sleep 30
			Send {Down}
			Sleep 30
			AltTab()
		}
	}
	return
}


; FUNÇÕES
CopiaSemModelo(){
	WinTitle=
	NVar=
	Send {Tab}
	Sleep 50
	WinGetTitle, WinTitle, A
	ControlGet, controlData, Choice,, Combobox1, %WinTitle%
	StringMid, NVar, controlData, 1, 1,
	Sleep 50
	Send {Tab}
	Send ^c
	ClipWait
	Send +{tab}
	Sleep 50
	Send +{tab}
	Sleep 50
	Send {Down}
	Sleep 50
	AltTab()
	Sleep 50
	Send {Tab}
	Sleep 50
	Send %NVar%
	Sleep 50
	Send {Tab}
	SendInput %clipboard%
	Sleep 50
	Send +{tab}
	Sleep 50
	Send +{tab}
	Sleep 50
	Send {Down}
	Sleep 50
	AltTab()
}
AltTab(){
	Run, "L:\Cláudio\Macros\Switch.lnk"
	Sleep 40
	Send {Enter}
	Sleep 40
}