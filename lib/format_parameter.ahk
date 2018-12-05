fpar_formatParameter(){
    fpar_text=
    fpar_par= pr_
    fpar_p= p_
    fpar_r= r_

    Send ^a
    Send ^c
    ClipWait

    ; Make all first letters uppercase
    fpar_text := RegExReplace(Clipboard, "([\s\/\.\_][a-z])","$U1")

    ; Remove all spaces, special characters and so (only removes _ if isnt preceded by a p, P, r, R, pr, or PR)
    fpar_text := RegExReplace(fpar_text, "\s|(?<!^[prPR])(?<!^(pr|PR))_|\/|\.|v_|V_")

    ; Concat "pr_" on the left, if doesn't find p_ or r_.
    found := RegExMatch(fpar_text, "^(p_|r_|pr_|P_|R_|PR_)")
    if (%found% = 0){
        found := RegExMatch(fpar_text, "[0-9]")
        if (%found% = 0) {
            fpar_text := fpar_par fpar_text
        }else{
            ; If finds any number, it's a config/table/right/... parameter, so p_
            fpar_text := fpar_p fpar_text
        }
    ; If finds something, uppercase, lowercase it.
    }else{
        fpar_text := RegExReplace(fpar_text, "^(P_|R_|PR_)","$L1")
    }
    
    ; Insert a _ after a number
    fpar_text := RegExReplace(fpar_text, "([0-9])([^0-9])", "$1_$2")
    
    ; Lowercase all the first letters after a _
    fpar_text := RegExReplace(fpar_text, "_([A-Z])","_$L1")

    SendInput %fpar_text%
}