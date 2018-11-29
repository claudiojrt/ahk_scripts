ini_config(){
    inifile=%A_AppData%\Tondin\scripts.ini
    ; Create ini path
    IfNotExist, %A_AppData%\Tondin\
        FileCreateDir, %A_AppData%\Tondin\

    IniRead, Value, %inifile%, Main, initMessage , 0
    if(Value = 0){
        MsgBox, , Aviso, Obrigado por usar meus scripts, espero que te ajudem. `r`n`r`n<ALT+ESC> para fechar o script`r`n<Pause> para interromper o script (play/pause)
        IniWrite, 1, %inifile%, Main, initMessage
    }

    ; Startup configs
    ;SplitPath, A_Scriptname, , , , OutNameNoExt
    ;LinkFile=%A_StartupCommon%\%OutNameNoExt%.lnk
    ;IfNotExist, %LinkFile%
    ;	FileCreateShortcut, %A_ScriptFullPath%, %LinkFile%
    ;SetWorkingDir, %A_ScriptDir%
    return
}

ini_getPropriety(ProprietyName){
    inifile=%A_AppData%\Tondin\scripts.ini
    IniRead, Value, %inifile%, Preferences, %ProprietyName% , 0
    return Value
}

ini_setPropriety(ProprietyName, Value){
    inifile=%A_AppData%\Tondin\scripts.ini
    IniWrite, %Value%, %inifile%, Preferences, %ProprietyName%
    return
}