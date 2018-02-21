F6::
{
	send ^c
	ClipWait
	Stored = %clipboard%
	Converted := 
	MsgBox %Converted%
	
;	Loop, parse, Stored{
		
		
;	}
	return
}
ESC::ExitApp