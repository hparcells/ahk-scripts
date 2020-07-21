GetColorAtCursor() {
  MouseGetPos x, y
  PixelGetColor color, %x%, %y%, RGB
  
  color := SubStr(color, 3)
  color := "#" color

  StringLower, color, color

  Return color
}
