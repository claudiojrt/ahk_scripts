repl_replace(){
    send ^a
    send ^c
    AltTab()
    send {Enter}
    send ^a
    send ^v
    mouseclick, left, 712, 52, 1, 0
    send ^a
    send ^c
    AltTab()
    send ^a
    send ^v
    send {esc}
    send {enter}
}