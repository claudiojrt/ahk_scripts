pref_preferences(){
    sqcl := ini_getPropriety("SequencialLetters")
    sqcn := ini_getPropriety("SequencialNumbers")
    prts := ini_getPropriety("PrintscreenToPaint")
    fdel := ini_getPropriety("FindDelete")
    repl := ini_getPropriety("Replace")
    ctpr := ini_getPropriety("ColumnToParameter")

    IfWinExist, Preferences
	{
		WinActivate
	}
	else{    
        Gui, New, , Preferences
        Gui, Add, GroupBox, x12 y6 w400 h162,
        Gui, Add, Checkbox, x24 y18 w300 h24 vpref_sqcl checked%sqcl%, Enable "Sequencial letters" (F10)
        Gui, Add, Checkbox, x24 y42 w300 h24 vpref_sqcn checked%sqcn%, Enable "Sequencial numbers" (CTRL+F10)
        Gui, Add, Checkbox, x24 y66 w300 h24 vpref_prts checked%prts%, Enable "Printscreen-to-paint" (PrtScn - C)
        Gui, Add, Checkbox, x24 y90 w300 h24 vpref_fdel checked%fdel%, Enable "Find-Delete" (2/3)
        Gui, Add, Checkbox, x24 y114 w300 h24 vpref_repl checked%repl%, Enable "Replace" (F2)
        Gui, Add, Checkbox, x24 y138 w300 h24 vpref_ctpr checked%ctpr%, Enable "Column-to-parameter" (F2)
        Gui, Add, Button, x317 y178 w96 h24 gpref_Button1, Ok
        Gui, Show, w425 h211,
        
        ;GuiControl, Disable, pref_fdel
        GuiControl, Disable, pref_repl
        GuiControl, Disable, pref_ctpr
        return
	}
	return
}

pref_Button1:
{
	Gui Submit
    ; Necessário testar, pois ao dar o #include deste arquivo os comandos estão disparando como se fizessem parte do autorun, limpando o ini.
    if (pref_sqcl != "") {
        ini_setPropriety("SequencialLetters", pref_sqcl)
        ini_setPropriety("SequencialNumbers", pref_sqcn)
        ini_setPropriety("PrintscreenToPaint", pref_prts)
        ini_setPropriety("FindDelete", pref_fdel)
        ini_setPropriety("Replace", pref_repl)
        ini_setPropriety("ColumnToParameter", pref_ctpr)
    }
    return
}