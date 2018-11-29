#Persistent
#SingleInstance force

#include %A_scriptDir%\lib\ini.ahk
#include %A_scriptDir%\lib\cursor.ahk
#include %A_scriptDir%\lib\sequencial_letters.ahk
#include %A_scriptDir%\lib\sequencial_numbers.ahk
#include %A_scriptDir%\lib\printscreen.ahk
#include %A_scriptDir%\lib\preferences.ahk

; INIT
    cursor_wait()
    SetKeyDelay, 25, 25
    Menu, Tray, Icon,,, 1
    cursor_reset()
    ini_config()

; Sequencial letters
F10::
    sqcl_letras_sequenciais()
    return

; Sequencial numbers
^F10::
    sqcn_numeros_sequenciais()
    return
    
; Printscreen-to-paint
~PrintScreen::
    prts_printscreen()
    return
    
; Preferences
!F12::
    pref_preferences()
    return
 
GuiEscape:
{
	Gui Destroy
	return
}
Pause::Suspend
!ESC::ExitApp