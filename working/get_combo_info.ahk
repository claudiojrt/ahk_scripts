F10::
{
	WinTitle=
	Letter=
	WinGetTitle, WinTitle, A
	ControlGet, controlData, Choice,, Combobox1, %WinTitle%
	StringMid, Letter, controlData, 1, 1,
	MsgBox % Letter
	return
}

!ESC::ExitApp

GuiEscape:
{
	Gui Destroy
	return
}