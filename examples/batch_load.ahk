Gui, Add, CheckBox, x26 y20 vcomlife , FireFox
Gui, add, checkbox, x26 y45 vDunno, Chrome
Gui, Add, Button, default gOk, Load Checked programs ; contains gLabel (gOk) if the user presses the load checked programs button, then the Ok label will tirgger
Gui, Show, x131 y91 h172 w168, New GUI Window
Return 

Ok: ; label triggered by the button
{
Gui, submit, nohide ; hide or nohide depends on what you want
If comlife = 1
	Run, FireFox.exe

If dunno = 1
	Run, Chrome.exe
}
return

GuiClose:
ExitApp