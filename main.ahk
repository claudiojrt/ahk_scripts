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

if(DEBUG_MODE = 1){
    MsgBox, , Aviso, %enable_sqlc% SequencialLetters `r`n %enable_sqcn% SequencialNumbers `r`n %enable_prts% PrintscreenToPaint `r`n %enable_fdel% FindDelete `r`n
}

cursor_reset()
ini_config()
return

; the rest of the includes should be put here to avoid mess with the autoexecute section
#include %A_scriptDir%\lib\preferences.ahk
#include %A_scriptDir%\lib\helper.ahk
#include %A_scriptDir%\lib\sequencial_letters.ahk
#include %A_scriptDir%\lib\sequencial_numbers.ahk
#include %A_scriptDir%\lib\printscreen.ahk
#include %A_scriptDir%\lib\find_delete.ahk
#include %A_scriptDir%\lib\replace.ahk
#include %A_scriptDir%\lib\column_to_parameter.ahk

;================================================================================================================

#If enable_sqlc
    F10::
        sqcl_letras_sequenciais()
        return

#If enable_sqcn
    ^F10::
        sqcn_numeros_sequenciais()
        return

#If enable_prts    
    ~PrintScreen::
        prts_printscreen()
        return

#If enable_fdel
    2::
        fdel_find()
        return
    3::
        fdel_delete()
        return

#If enable_repl
    F2::
        repl_replace()
        return

#If enable_ctpr
    F2::
        ctpr_columnToParameter()
        return

; necessary to not inherit the 
#If 1=1
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