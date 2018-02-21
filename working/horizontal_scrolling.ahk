~LShift & WheelUp::
 ControlGetFocus, fcontrol, A
 Loop 12{
	SendMessage, 0x114, 0, 0, %fcontrol%, A		; 0x114 = WM_HSCROLL / 0 = SB_LINELEFT
 }
return

~LShift & WheelDown::
 ControlGetFocus, fcontrol, A
 Loop 12{
	SendMessage, 0x114, 1, 0, %fcontrol%, A		; 0x114 = WM_HSCROLL / 1 = SB_LINERIGHT
 }
return
