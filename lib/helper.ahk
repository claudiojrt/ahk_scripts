SendText(Text){
    ClipBoard = %Text%
    ClipWait
    Send ^v
}

AltTab(){
	Send {Alt Down}{Tab}{Alt Up}
}