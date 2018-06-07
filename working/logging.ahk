#Persistent
#SingleInstance force

;@TODO
;- IfWinActive uniPaaS/XPA

!ESC::ExitApp

SetKeyDelay, 25, 25

!n::
{
	open_log()
	set_log(false)
	return
}

!y::
{
	open_log()
	set_log(true)
	return
}

;FUNCTIONS

set_log(state){
	Loop 12	{
		if state
			SendInput y
		else
			SendInput n
		SendInput {down}
	}
	SendInput {enter}
}

open_log(){
	Send {ALT}
	Send oso
}