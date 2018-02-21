a::
{
	AA := "Teste Muleke"
	Loop, Parse, AA
	{
		SendInput %A_LoopField%
		Sleep 200
	}
	return
}