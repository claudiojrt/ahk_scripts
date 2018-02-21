;F7::
;clipboard =
;Send ^c
;ClipWait
;MsgBox Control-C copied the following contents to the clipboard:`n`n%clipboard%

Gui 1:Add, CheckBox, w115 y10		vOptDM, Checkbox 1
Gui 1:Add, CheckBox, w115 			vOptBS, Checkbox 2
Gui 1:Add, CheckBox, w115			vOptDS Checked, Checkbox 3
Gui 1:Add, CheckBox, w115			vOptDX, Checkbox 4
Gui 1:Add, CheckBox, w115 y10 x+5	vOptFD, Checkbox 5
Gui 1:Add, CheckBox, w115 y+6		vOptRUS, Checkbox 6
Gui 1:Add, CheckBox, w115 y+6		vOptAll, Checkbox 7
Gui 1:Add, CheckBox, w115 y+6		vOptAllRUS, Checkbox 1

Gui 1:Add, Button, w90 y10 vStartSearch Default, Botão 1
Gui 1:Add, Button, w90 y+10, Botão 2
Gui 1:Add, Button, w90 y+10, Botão 3
Gui 1:Add, Button, w90 y+10, Botão 4
Gui 1:Add, Text, x10 yp-15, Texto para o label abaixo:

Gui 1:Add, DropDownList, vDirSpec w75, C:\|D:\||E:\
Gui 1:Add, Text, , Texto para o label aqui:
Gui 1:Add, Edit, vSearch w335, Texto Padrão
Gui 1:Add, CheckBox, x10 vReBuild, Checkbox doidão aqui embaixo
Gui 1:Add, CheckBox, x10 vNoCache Checked, xekbox aqui mlk
Gui 1:Add, Button, x+150 yp-10 w50 gQuitter, Quit

Gui 1:Show

Return

GuiEscape:
GuiClose:
Quitter:
ExitApp