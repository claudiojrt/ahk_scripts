prts_printscreen(){
	Input, prtscncopy, L1
	if prtscncopy = c
	{
		Send {Ctrl Down}{c}{Ctrl Up}
		Run %windir%\System32\mspaint.exe
		WinWaitActive Untitled - Paint
		Send {Ctrl Down}{v}{Ctrl Up}
    }
}