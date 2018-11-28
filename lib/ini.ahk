ini_config(){
    inifile=%A_AppData%\Tondin\scripts.ini

    ; Create ini path
    IfNotExist, %A_AppData%\Tondin\
        FileCreateDir, %A_AppData%\Tondin\

    IniRead, initMessage, %inifile%, Main, initMessage , 0
    if(initMessage=0){
        MsgBox, , Aviso, Obrigado por usar meus scripts, espero que te ajudem. `r`n`r`n<ALT+ESC> para fechar o script`r`n<Pause> para interromper o script (play/pause)
        IniWrite, 1, %inifile%, Main, initMessage
    }

    ; Startup configs
    ;SplitPath, A_Scriptname, , , , OutNameNoExt
    ;LinkFile=%A_StartupCommon%\%OutNameNoExt%.lnk
    ;IfNotExist, %LinkFile%
    ;	FileCreateShortcut, %A_ScriptFullPath%, %LinkFile%
    ;SetWorkingDir, %A_ScriptDir%
}