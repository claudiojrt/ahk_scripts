fpar_formatParameter(){
    fpar_text=
    fpar_par= pr_
    
    Send ^c
    ClipWait
    
    ; Make all first letters uppercase
    fpar_text := RegExReplace(Clipboard, "([\s\/\.\_][a-z])","$U1")
    
    ; Remove all spaces, special characters and so
    fpar_text := RegExReplace(fpar_text, "\s|p_|pr_|r_|\_|\/|\.")
    
    ; Concat "pr_" on the left
    fpar_text := fpar_par fpar_text 
    
    ; Lowercase the first letter after "pr_"
    fpar_text := RegExReplace(fpar_text, "pr_([A-Z])","pr_$l1")

    SendInput %fpar_text%
}