#Persistent
; MAIN
LA=
LB=
LC=
LD=
LE=


; HOTKEYS
F10::
{
	IfWinExist, Sequencial
	{
		WinActivate
	}
	else{
		Gui, New,, Sequencial
		Gui, Add,  GroupBox,	x13 y5 w143 h70,
		Gui, Add,  Text,		x22 y23 w70 h15, Letras iniciais:
		Gui, Add,  Text,		x22 y51 w50 h15, Iterações:
		Gui, Add,  Edit,		x95 y19 w50 h19  Uppercase Limit5 vLetras,
		Gui, Add,  Edit,		x95 y47 w50 h19  Number Limit4 vIter,
		Gui, Add,  Button,		x77 y82 w80 h23 gButton1, Ok
		Gui, Show, 				w169 h112,
	}
	return
}
F1::
{
	IfWinExist, Ajuda
	{
		WinActivate
	}
	else{
		Gui, New,, Ajuda
		Gui, Add,  GroupBox, y25 h238 w350
		Gui, Add,  Text, x153 y10, Ajuda do Script
		Gui, Add,  Text, x20 y45, Comandos:
		Gui, Add,  Text, x35 yp+15, - F10: Abre a tela de parametrizações do Script;
		Gui, Add,  Text, x35 yp+15, - Scroll Lock: Suspende o Script (libera o uso das teclas de atalho);
		Gui, Add,  Text, x35 yp+15, - Alt+ESC: Finaliza o Script.
		Gui, Add,  Text, x20 yp+20, Funcionamento:
		Gui, Add,  Text, x35 yp+15, - Campo 'Letras Iniciais': Informe a primeira variável a ser impressa
		Gui, Add,  Text, x34 yp+15,	(campo alfanumérico, porém, digite apenas LETRAS, 1 a 5);
		Gui, Add,  Text, x35 yp+15, - Campo 'Iterações': Informe o número de sequencias de variáveis
		Gui, Add,  Text, x34 yp+15,	(campo numérico, 1 a 4);
		Gui, Add,  Text, x20 yp+20, Uso:
		Gui, Add,  Text, x35 yp+15, - Digite o valor da primeira variável (ela será impressa);
		Gui, Add,  Text, x35 yp+15, - Posicione o cursor na primeira linha dos parâmetros;
		Gui, Add,  Text, x35 yp+15, - Feito isso, volte no programa e dê OK.
		Gui, Show, h275
	}
	return
}
GuiEscape:
{
	Gui Destroy
	Return
}
!ESC::ExitApp


; MACRO
Button1:
{
	Gui Submit
	Count := StrLen(Letras)
	LA=
	LB=
	LC=
	LD=
	LE=
	Loop, Parse, Letras
	{
		if(Count=5){
			LA=%A_LoopField%
			Count--
		}
		else if(Count=4){
			LB=%A_LoopField%
			Count--
		}
		else if(Count=3){
			LC=%A_LoopField%
			Count--
		}
		else if(Count=2){
			LD=%A_LoopField%
			Count--
		}
		else if(Count=1){
			LE=%A_LoopField%
		}
	}
	Loop, %Iter%
	{
		Send %LA%
		Send %LB%
		Send %LC%
		Send %LD%
		Send %LE%
		Send {Down}
		Calcula()
	}
	return
}


; FUNÇÕES
Calcula(){
	Global LA:=Asc(LA)
	Global LB:=Asc(LB)
	Global LC:=Asc(LC)
	Global LD:=Asc(LD)
	Global LE:=Asc(LE)
	if(++LE=91){
		LE=65
		if(LD=0){
			LD=66
		}
		else if(++LD=91){
			LD=65
			if(LC=0){
				LC=65
			}
			else if(++LC=91){
				LC=65
				if(LB=0){
					LB=65
				}
				else if(++LB=91){
					LB=65
					if(LA=0){
						LA=65
					}
					else if(++LA=91){
						LA=65
					}
				}
			}
		}
	}
	Global LA:=Chr(LA)
	Global LB:=Chr(LB)
	Global LC:=Chr(LC)
	Global LD:=Chr(LD)
	Global LE:=Chr(LE)
}
