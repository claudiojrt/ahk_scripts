!n::
{
	SetKeyDelay, 75, 20
	Loop 11
	{
		Sendinput n
		SendInput {down}
	}
	Sendinput n
	return
}

!y::
{
	SetKeyDelay, 75, 20
	Loop 11
	{
		Sendinput y
		SendInput {down}
	}
	Sendinput y
	return
}

!ESC::ExitApp