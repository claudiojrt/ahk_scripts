repl_replace(){
    Send ^a
    Send ^c
    AltTab()
    Send {Enter}
    Send ^a
    Send ^v
    Mouseclick, left, 712, 52, 1, 0
    Send ^a
    Send ^c
    AltTab()
    Send ^a
    Send ^v
    Send {esc}
    Send {enter}
}