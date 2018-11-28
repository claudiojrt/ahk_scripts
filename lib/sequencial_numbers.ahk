sqcn_NA=0

sqcn_numeros_sequenciais(){
	IfWinExist, Sequencial
	{
		WinActivate
	}
	else{
		Gui, New,, Sequencial
		Gui, Add,  GroupBox,	x13 y5 w143 h70,
		Gui, Add,  Text,		x22 y23 w70 h15, Numero inicial:
		Gui, Add,  Text,		x22 y51 w70 h15, Iterações:
		Gui, Add,  Edit,		x95 y19 w50 h19  Number Limit5 vsqcn_Numero,
		Gui, Add,  Edit,		x95 y47 w50 h19  Number Limit4 vsqcn_Iter,
		Gui, Add,  Button,		x77 y82 w80 h23 gsqcn_Button1, Ok
		Gui, Show, 				w169 h112,
	}
	return
}

sqcn_Button1:
{
	Gui Submit
	sqcn_NA = %sqcn_Numero%	
	Loop, %sqcn_Iter%
	{
		Send %sqcn_NA%
		Send {Down}
		sqcn_NA++
	}
	return
}









