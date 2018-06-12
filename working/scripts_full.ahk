#Persistent
#SingleInstance force
;#Sendmode Input

; F10:					Letras sequenciais
; F11:					Números sequenciais
; F12:					Contagem de caracteres selecionados
; CTRL+F9:				Cria Parâmetros
; CTRL+F10:				Copia Parâmetros
; CTRL+F11:				Copia Modelos
; CTRL+F12:				Exclui Registros
; ALT+1:				Autotype GetParam('x'CFG)
; ALT+2:				Autotype DbName('x'DSOURCE)
; ALT+Y:				Ativa log
; ALT+N:				Desativa Log
; PrintScreen / C:		Cola automaticamente o print selecionado (com lightshot) no paint

/*TODO:
	- Melhorar códigos e nomes das virtuais
	- Integrar "Letras Sequenciais"
	- Configuração de linguagem de sistema (automático?)
	- Configuração de versão do windows
	- Configuração de startup
		%appdata%\Microsoft\Windows\Start Menu\Programs\Startup
		Pesquisar como criar automaticamente um atalho para o executável
	- Painel de configurações do script
		Desativar determinadas macros
		Método de printscreen (print salva diretamente / selecionar área com Lightshot e pressionar "c")
	- Melhorar ícone
*/

SetKeyDelay, 25, 25

LA=
LB=
LC=
LD=
LE=

NumSeq=0

inifile=%A_AppData%\Tondin\scripts.ini

;================================================================================
; INIT

; Freeze the icon
Menu, Tray, Icon,,, 1 

; Create ini path
IfNotExist, %A_AppData%\Tondin\
	FileCreateDir, %A_AppData%\Tondin\

;Removido: <F1> para abrir o help (em desenvolvimento)`r`n
IniRead, initMessage, %inifile%, Main, initMessage , 0
if(initMessage=0){
	MsgBox, , Aviso, Obrigado por usar meus scripts, espero que te ajudem. `r`n`r`n<ALT+ESC> para fechar o script`r`n<ScrollLock> para interromper o script (play/pause)
	IniWrite, 1, %inifile%, Main, initMessage
}

; Startup configs
;SplitPath, A_Scriptname, , , , OutNameNoExt 
;LinkFile=%A_StartupCommon%\%OutNameNoExt%.lnk 
;IfNotExist, %LinkFile% 
;	FileCreateShortcut, %A_ScriptFullPath%, %LinkFile% 
;SetWorkingDir, %A_ScriptDir%

;================================================================================
; Letras sequenciais
/*
F10::
{
	IfWinExist, Sequencial Letras
	{
		WinActivate
	}
	else{
		Gui, New,, Sequencial Letras
		Gui, Add, GroupBox, x13 y5 w143 h70,
		Gui, Add, Text, x22 y23 w70 h15, Letras iniciais:
		Gui, Add, Text, x22 y51 w50 h15, Iterações:
		Gui, Add, Edit, x95 y19 w50 h19 Uppercase Limit5 vLetras,
		Gui, Add, Edit, x95 y47 w50 h19 Number Limit4 vIterLetras,
		Gui, Add, Button, x77 y82 w80 h23 gButton1, Ok
		Gui, Show, w169 h112,
	}
	return
}

Button1:
{
	Gui Submit
	Count := StrLen(Letras)
	LA=
	LB=
	LC=
	LD=
	LE=
	Loop, Parse, Letras
	{
		if(Count=5){
			LA=%A_LoopField%
			Count--
		}
		else if(Count=4){
			LB=%A_LoopField%
			Count--
		}
		else if(Count=3){
			LC=%A_LoopField%
			Count--
		}
		else if(Count=2){
			LD=%A_LoopField%
			Count--
		}
		else if(Count=1){
			LE=%A_LoopField%
		}
	}
	Loop, %IterLetras%
	{
		Send %LA%
		Send %LB%
		Send %LC%
		Send %LD%
		Send %LE%
		Send {Down}
		Calcula()
	}
	return
}

Calcula(){
	Global LA:=Asc(LA)
	Global LB:=Asc(LB)
	Global LC:=Asc(LC)
	Global LD:=Asc(LD)
	Global LE:=Asc(LE)
	if(++LE=91){
		LE=65
		if(LD=0){
			LD=66
		}
		else if(++LD=91){
			LD=65
			if(LC=0){
				LC=65
			}
			else if(++LC=91){
				LC=65
				if(LB=0){
					LB=65
				}
				else if(++LB=91){
					LB=65
					if(LA=0){
						LA=65
					}
					else if(++LA=91){
						LA=65
					}
				}
			}
		}
	}
	Global LA:=Chr(LA)
	Global LB:=Chr(LB)
	Global LC:=Chr(LC)
	Global LD:=Chr(LD)
	Global LE:=Chr(LE)
}
*/
;================================================================================
; Números sequenciais

F11::
{
	IfWinExist, Sequencial Numeros
	{
		WinActivate
	}
	else{
		Gui, New,, Sequencial Numeros
		Gui, Add, GroupBox,	x13 y5 w143 h70,
		Gui, Add, Text, x22 y23 w70 h15, Numero inicial:
		Gui, Add, Text, x22 y51 w70 h15, Iterações:
		Gui, Add, Edit, x95 y19 w50 h19 Number Limit5 vNumero,
		Gui, Add, Edit, x95 y47 w50 h19 Number Limit4 vIterNumeros,
		Gui, Add, Button, x77 y82 w80 h23 gButton2, Ok
		Gui, Show, w169 h112,
	}
	return
}

Button2:
{
	Gui Submit
	NumSeq = %Numero%	
	Loop, %IterNumeros%
	{
		Send %NumSeq%
		Send {Down}
		NumSeq++
	}
	return
}

;================================================================================
; Conta caracteres

F12::
{
	Send ^c
	ClipWait
	Count := StrLen(Clipboard)
	MsgBox, , Aviso, Texto copiado: %clipboard%`n`nTamanho: %Count%
	return
}

;================================================================================
; Log

!n::
{
	open_log()
	set_log(false)
	return
}

!y::
{
	open_log()
	set_log(true)
	return
}

set_log(state){
	Loop 12	{
		if state
			SendInput y
		else
			SendInput n
		SendInput {down}
	}
	SendInput {enter}
}

open_log(){
	SendInput {ALT down}{o}{s}{o}{ALT up}
}

;================================================================================
; Autotype	

!+1::
{
	IfWinExist, Config
	{
		WinActivate
	}
	else{
		Gui, New,, Config
		Gui, Add, GroupBox, x11 y6 w150 h50,
		Gui, Add, Text, x21 y27 w30 h13, Config
		Gui, Add, Edit, x88 y23 w60 h21 Number Limit5 vConfig,
		Gui, Add, Button, x82 y66 w80 h25 gButton3, Ok
		Gui, Show, w174 h101,
		return
	}
	return
}

Button3:
{
	Gui Submit
	Send {=}
	Send GetParam('CFG_
	Send %Config%
	Send ')
	Send {Enter}
	return
}

!+2::
{
	IfWinExist, Dsource
	{
		WinActivate
	}
	else{
		Gui, New,, Dsource
		Gui, Add, GroupBox, x11 y6 w150 h50,
		Gui, Add, Text, x21 y27 w45 h13, Dsource
		Gui, Add, Edit, x88 y23 w60 h21 Number Limit5 vDsource,
		Gui, Add, Button, x82 y66 w80 h25 gButton4, Ok
		Gui, Show, w174 h101,
		return
	}
	return
}

Button4:
{
	Gui Submit
	Send {=}
	Send DbName('
	Send %Dsource%
	Send 'DSOURCE)
	Send {Enter}
	return
}

;================================================================================
; Cria parâmetros

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
		Gui, Add, Button, w160 gButton5, Ok
		Gui, Show
	}
	return
}

Button5:
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

;================================================================================
; Copia parâmetros

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
		Gui, Add, Button, x123 w100 gButton6, Ok
		Gui, Show
	}
	return
}

Button6:
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

;================================================================================
; Copia modelos

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
		Gui, Add, Button, w155 gButton7, Ok
		Gui, Show
	}
	return
}

Button7:
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

;================================================================================
; Exclui registros

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
		Gui, Add, Button, W150 gButton8, Ok
		Gui, Show
	}
	return
}

Button8:
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

;================================================================================
; PrintScreen-To-Paint

~PrintScreen::
	Input, prtscncopy, L1
	if prtscncopy = c
	{
		Send {Ctrl Down}{c}{Ctrl Up}
		Run %windir%\System32\mspaint.exe
		WinWaitActive Untitled - Paint
		Send {Ctrl Down}{v}{Ctrl Up}
		return
    }

;================================================================================
; Global

AltTab(){
	Send {Alt Down}{Tab}{Alt Up}
}

GuiEscape:
{
	Gui Destroy
	Return
}

!ESC::ExitApp

ScrollLock::Suspend
