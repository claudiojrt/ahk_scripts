#Persistent
#SingleInstance force
#include %A_scriptDir%\lib\ini.ahk
#include %A_scriptDir%\lib\cursor.ahk
#include %A_scriptDir%\lib\sequencial_letters.ahk
#include %A_scriptDir%\lib\sequencial_numbers.ahk

; INIT
    cursor_wait()
    SetKeyDelay, 25, 25
    Menu, Tray, Icon,,, 1
    cursor_reset()
    ini_config()

F10::
    sqcl_letras_sequenciais()
    return
    
^F10::
    sqcn_numeros_sequenciais()
    return
 
GuiEscape:
{
	Gui Destroy
	return
}
Pause::Suspend
!ESC::ExitApp