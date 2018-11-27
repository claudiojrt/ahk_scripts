#Persistent
#SingleInstance force

SetKeyDelay, 50, 50

Menu, Tray, Icon,,, 1

F2::
    send ^a
    send ^c
    send {LWin down}1{LWin up}
    send {Enter}
    send ^a
    send ^v
    mouseclick, left, 712, 52, 1, 0
    send ^a
    send ^c
    send {LWin down}3{LWin up}
    send ^a
    send ^v
    send {esc}
    send {enter}
    return

!ESC::ExitApp

Pause::Suspend