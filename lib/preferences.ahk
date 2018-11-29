#include %A_scriptDir%\lib\ini.ahk

pref_preferences(){
    IfWinExist, Preferences
	{
		WinActivate
	}
	else{
        Gui,New,,Preferences
        Gui,Add,GroupBox,x12 y6 w400 h162,
        Gui,Add,Checkbox,x24 y18 w300 h24,Enable "Sequencial letters" (F10)
        Gui,Add,Checkbox,x24 y42 w300 h24,Enable "Sequencial numbers" (CTRL+F10)
        Gui,Add,Checkbox,x24 y66 w300 h24,Enable "Printscreen-to-paint" (PrtScn - C)
        Gui,Add,Checkbox,x24 y90 w300 h24,Enable "Find-Delete" (2/3)
        Gui,Add,Checkbox,x24 y114 w300 h24,Enable "Replace" (F2)
        Gui,Add,Checkbox,x24 y138 w300 h24,Enable "Column-to-parameter" (F2)
        Gui,Add,Button,x317 y178 w96 h24,Ok
        Gui,Show,w425 h211,
        return
	}
	return
}

