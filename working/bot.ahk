IfWinExist, Bot
	{
		WinActivate
	}
	else{
		Gui, New,, Bot
		Gui, Add, Text, w160, Quantos parâmetros deseja criar?
		Gui, Add, Edit, w160 vCount3,
		Gui, Add, Button, w160 gButton3, Ok
		Gui, Show
	}
	return