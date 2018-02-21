Gui, Add, Radio, x26 y26 w50 h20 , Sale
Gui, Add, Radio, x86 y26 w50 h20 , Credit
Gui, Add, Text, x16 y66 w50 h20 , Account#
Gui, Add, Edit, x16 y86 w130 h20 , vAccount#
Gui, Add, Text, x16 y116 w30 h20 , PO#
Gui, Add, Edit, x16 y136 w130 h20 , vPO#
Gui, Add, Text, x16 y166 w60 h20 , Telephone#
Gui, Add, Edit, x16 y186 w130 h20 , vTelephone#
Gui, Add, Text, x16 y216 w80 h20 , Shipping Method
Gui, Add, DropDownList, x16 y236 w130 h20 , FEDEX|UPS
Gui, Add, GroupBox, x176 y6 w120 h50 , Sales Channel
Gui, Add, Radio, x186 y26 w50 h20 , Phone
Gui, Add, Radio, x246 y26 w40 h20 , Web
Gui, Add, GroupBox, x176 y66 w100 h110 , Freight Terms
Gui, Add, Radio, x186 y86 w60 h20 , Prepaid
Gui, Add, Radio, x186 y106 w80 h20 , Our Expense
Gui, Add, Radio, x186 y126 w80 h20 , OE Overrride
Gui, Add, Radio, x186 y146 w40 h20 , n/a
Gui, Add, GroupBox, x176 y186 w140 h50 , Warehouse Priority
Gui, Add, Radio, x186 y206 w70 h20 , Same Day
Gui, Add, Radio, x266 y206 w40 h20 , n/a
Gui, Add, GroupBox, x176 y236 w140 h120 , Credit Card Info
Gui, Add, Text, x186 y256 w80 h20 , Credit Card Type
Gui, Add, Text, x196 y306 w10 h10 , #
Gui, Add, Edit, x206 y306 w110 h20 , v#
Gui, Add, Edit, x236 y336 w70 h20 , vX
Gui, Add, Text, x226 y336 w10 h10 , X
Gui, Add, GroupBox, x16 y6 w130 h50 , OrderType
Gui, Add, Button, x26 y306 w120 h30 , Submit
Gui, Add, Edit, x106 y76 w10 h0 , Edit
Gui, Add, DropDownList, x186 y276 w80 h20 , VISA|MC|AMEX
; Generated using SmartGUI Creator 4.0
Gui, Show, x158 y100 h369 w334, New GUI Window
Return

GuiClose:
ExitApp