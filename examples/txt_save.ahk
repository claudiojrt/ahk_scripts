csv := ", "   ; just for convenience use the variable 'csv' to replace a few characters

make_gui:
gui, add, text,xm,Date:
gui, add, edit, yp x+10 vdate, 03052014 ; I used example data to specify field width

gui, add, text,xm,Order:
gui, add, edit, yp x+10 vorder, 411090

gui, add, text,xm,Material:
gui, add, edit, yp x+10 vmaterial, 103841

gui, add, text,xm,Batch:
gui, add, edit, yp x+10 vbatch, 03052014

gui, add, text,xm,Quantity:
gui, add, edit, yp x+10 vquantity, 21000kg

gui, add, text,xm,Warehouse Location: 
gui, add, edit, yp x+10 vlocation, W3F2

gui, add, button,xm		gquit,	quit
gui, add, button,yp x+10	gadd,	add
gui, add, button,yp x+10 	gcancel,cancel

gui, show, x300 y100
gosub, cancel ; erase the data from all the fields
return


; cancel the data entry
cancel:
list = Date,Order,Material,Batch,Quantity,Location
  
loop, parse, list, ,
    guicontrol,,%a_loopfield%,    ; clear each field
return


; exit the script
quit:
exitapp


add:
gui, submit, nohide

; build a line of data
entry := Date csv Order csv Material csv Batch csv Quantity csv Location

; alternately you could build the line like this (only partial line done)
; entry = %Date%, %Order%, %Material%

fileappend, %entry%`r`n, results.txt ; write the data to a file.

return

#singleinstance force
#Persistent

;  hotkeys for script diagnostics
F11::listvars
+esc::exitapp
f12::reload