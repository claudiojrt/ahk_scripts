#Persistent
#SingleInstance force

; autoexecute section

; 1 to activate debug messages
DEBUG_MODE = 0 

#include %A_scriptDir%\lib\ini.ahk
#include %A_scriptDir%\lib\cursor.ahk

cursor_wait()
SetKeyDelay, 25, 25
Menu, Tray, Icon,,, 1

enable_sqlc := ini_getPropriety("SequencialLetters")
enable_sqcn := ini_getPropriety("SequencialNumbers")
enable_prts := ini_getPropriety("PrintscreenToPaint")
enable_fdel := ini_getPropriety("FindDelete")
enable_repl := ini_getPropriety("Replace")
enable_ctpr := ini_getPropriety("ColumnToParameter")

if (DEBUG_MODE = 1){
    MsgBox, , Aviso, %enable_sqlc% SequencialLetters `r`n %enable_sqcn% SequencialNumbers `r`n %enable_prts% PrintscreenToPaint `r`n %enable_fdel% FindDelete `r`n
}

cursor_reset()
ini_config()
return

; the rest of the includes should be put here to avoid mess with the autoexecute section
#include %A_scriptDir%\lib\preferences.ahk
#include %A_scriptDir%\lib\sequencial_letters.ahk
#include %A_scriptDir%\lib\sequencial_numbers.ahk
#include %A_scriptDir%\lib\printscreen.ahk
#include %A_scriptDir%\lib\find_delete.ahk
#include %A_scriptDir%\lib\helper.ahk

;================================================================================================================

F10::
    if (enable_sqlc = 1){
        sqcl_letras_sequenciais()
    }
    return

^F10::
    if (enable_sqcn = 1){
        sqcn_numeros_sequenciais()
    }
    return

~PrintScreen::
    if (enable_prts = 1){
        prts_printscreen()
    }
    return

2::
    if (enable_fdel = 1){
        fdel_find()
    }
    else{
        SendText(2)
    }
    return

3::
    if (enable_fdel = 1){
        fdel_delete()
    }
    else{
        SendText(3)
    }
    return

!F12::
    pref_preferences()
    WinWaitClose Preferences
    LoadPreferences()
    return

;================================================================================================================
; GENERAL

LoadPreferences(){
    global enable_sqlc := ini_getPropriety("SequencialLetters")
    global enable_sqcn := ini_getPropriety("SequencialNumbers")
    global enable_prts := ini_getPropriety("PrintscreenToPaint")
    global enable_fdel := ini_getPropriety("FindDelete")
    global enable_repl := ini_getPropriety("Replace")
    global enable_ctpr := ini_getPropriety("ColumnToParameter")
    
    if (DEBUG_MODE = 1){
        MsgBox, , Aviso, %enable_sqlc% SequencialLetters `r`n %enable_sqcn% SequencialNumbers `r`n %enable_prts% PrintscreenToPaint `r`n %enable_fdel% FindDelete `r`n
    }
}

GuiEscape:
{
	Gui Destroy
	return
}
Pause::Suspend
!ESC::ExitApp
;================================================================================================================