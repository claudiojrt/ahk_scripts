myGui("x300 y200", "gui example 1")
myGui("x300 y400", "gui example 2")
myGui("x300 y600", "gui example 1")

myGui(position, title)
   {
   static thisVar, thatVar
   gui, new
   gui, Default
   gui, +LastFound +LabelMyGui
   gui, add, groupbox, w250 h130,example
   gui, add, text, xm12 ym30 section, this Label
   gui, add, text, xm12 yp+30, that label
   gui, add, button, yp+30 gDone, Ok
   gui, add, edit, ys ym30 vthisVar,
   gui, add, edit, yp+30  vthatVar,
   gui, add, button, yp+30  gmyguiclose, cancel
   gui, show, % position, % title
   return winexist()
   
   Done:
      {
      gui,submit,nohide
      ; ListVars
      msgbox your values `nthisVar :%thisVar%`nthatVar :%thatVar%
      return
      }
   
GuiEscape:
{
   Gui Destroy
   Return
}
   myguiclose:
      {
      gui,destroy
      return
      }
   }