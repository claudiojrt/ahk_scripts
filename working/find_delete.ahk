#Persistent
#SingleInstance force

SetKeyDelay, 20, 20

Menu, Tray, Icon,,, 1

2::
    send ^f
    send {Enter}
    return
    
3::
    send {F3}
    send {left}
    return

!ESC::ExitApp

Pause::Suspend