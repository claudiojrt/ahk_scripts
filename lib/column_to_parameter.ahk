#Persistent
#SingleInstance force

SetKeyDelay, 20, 20

Menu, Tray, Icon,,, 1

F2::
    send ^c
    send +{tab}
    send +{tab}
    send p
    send ^v
    send {tab}
    return

!ESC::ExitApp

Pause::Suspend