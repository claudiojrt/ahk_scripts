cursor_wait(){
	CursorHandle:=DllCall("LoadCursor",Uint,0,Int,32512)
	DllCall("SetSystemCursor",Uint,CursorHandle,Int,32514)
}

cursor_reset(){
	SPI_SETCURSORS:=0x57
	DllCall("SystemParametersInfo",UInt,SPI_SETCURSORS,UInt,0,UInt,0,UInt,0)
}