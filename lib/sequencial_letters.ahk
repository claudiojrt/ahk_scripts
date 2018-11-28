sqcl_LA=
sqcl_LB=
sqcl_LC=
sqcl_LD=
sqcl_LE=

sqcl_letras_sequenciais(){
	IfWinExist, Sequencial
	{
		WinActivate
	}
	else{
		Gui, New,, Sequencial
		Gui, Add,  GroupBox,	x13 y5 w143 h70,
		Gui, Add,  Text,		x22 y23 w70 h15, Letras iniciais:
		Gui, Add,  Text,		x22 y51 w50 h15, Iterações:
		Gui, Add,  Edit,		x95 y19 w50 h19  Uppercase Limit5 vsqcl_Letras,
		Gui, Add,  Edit,		x95 y47 w50 h19  Number Limit4 vsqcl_Iter,
		Gui, Add,  Button,		x77 y82 w80 h23 gsqcl_Button1, Ok
		Gui, Show, 				w169 h112,
	}
	return
}

sqcl_Button1:
{
	Gui Submit
	Count := StrLen(sqcl_Letras)
	sqcl_LA=
	sqcl_LB=
	sqcl_LC=
	sqcl_LD=
	sqcl_LE=
	Loop, Parse, sqcl_Letras
	{
		if(Count=5){
			sqcl_LA=%A_LoopField%
			Count--
		}
		else if(Count=4){
			sqcl_LB=%A_LoopField%
			Count--
		}
		else if(Count=3){
			sqcl_LC=%A_LoopField%
			Count--
		}
		else if(Count=2){
			sqcl_LD=%A_LoopField%
			Count--
		}
		else if(Count=1){
			sqcl_LE=%A_LoopField%
		}
	}
	Loop, %sqcl_Iter%
	{
		Send %sqcl_LA%
		Send %sqcl_LB%
		Send %sqcl_LC%
		Send %sqcl_LD%
		Send %sqcl_LE%
		Send {Down}
		calcula_letras()
	}
	return
}

calcula_letras(){
	Global sqcl_LA:=Asc(sqcl_LA)
	Global sqcl_LB:=Asc(sqcl_LB)
	Global sqcl_LC:=Asc(sqcl_LC)
	Global sqcl_LD:=Asc(sqcl_LD)
	Global sqcl_LE:=Asc(sqcl_LE)
	if(++sqcl_LE=91){
		sqcl_LE=65
		if(sqcl_LD=0){
			sqcl_LD=66
		}
		else if(++sqcl_LD=91){
			sqcl_LD=65
			if(sqcl_LC=0){
				sqcl_LC=65
			}
			else if(++sqcl_LC=91){
				sqcl_LC=65
				if(sqcl_LB=0){
					sqcl_LB=65
				}
				else if(++sqcl_LB=91){
					sqcl_LB=65
					if(sqcl_LA=0){
						sqcl_LA=65
					}
					else if(++sqcl_LA=91){
						sqcl_LA=65
					}
				}
			}
		}
	}
	Global sqcl_LA:=Chr(sqcl_LA)
	Global sqcl_LB:=Chr(sqcl_LB)
	Global sqcl_LC:=Chr(sqcl_LC)
	Global sqcl_LD:=Chr(sqcl_LD)
	Global sqcl_LE:=Chr(sqcl_LE)
}
