c_keyDelay=40 ; em mS

; HOTKEYS
Down::
{
	Send {Down}
	Sleep %c_keyDelay%
	AltTab()
	Sleep %c_keyDelay%
	Send {Down}
	Sleep %c_keyDelay%
	AltTab()
	Sleep %c_keyDelay%
	return
}
Up::
{
	Send {Up}
	Sleep %c_keyDelay%
	AltTab()
	Sleep %c_keyDelay%
	Send {Up}
	Sleep %c_keyDelay%
	AltTab()
	Sleep %c_keyDelay%
	return
}

PgUp::
{
	Send {PgUp}
	Sleep %c_keyDelay%
	AltTab()
	Sleep %c_keyDelay%
	Send {PgUp}
	Sleep %c_keyDelay%
	AltTab()
	Sleep %c_keyDelay%
	return
}
PgDn::
{
	Send {PgDn}
	Sleep %c_keyDelay%
	AltTab()
	Sleep %c_keyDelay%
	Send {PgDn}
	Sleep %c_keyDelay%
	AltTab()
	Sleep %c_keyDelay%
	return
}

WheelUp::
{
	Send {WheelUp}
	Sleep %c_keyDelay%
	AltTab()
	Sleep %c_keyDelay%
	Send {WheelUp}
	Sleep %c_keyDelay%
	AltTab()
	Sleep %c_keyDelay%
	return
}
WheelDown::
{
	Send {WheelDown}
	Sleep %c_keyDelay%
	AltTab()
	Sleep %c_keyDelay%
	Send {WheelDown}
	Sleep %c_keyDelay%
	AltTab()
	Sleep %c_keyDelay%
	return
}

ScrollLock::Suspend
!ESC::ExitApp

; FUNÇÕES
AltTab(){
	Run, "C:\Users\claudio.tondin\Desktop\Switch.lnk"
	Sleep %c_keyDelay%+40
	Send {Enter}
	Sleep %c_keyDelay%+40
}