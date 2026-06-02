randomColor() {
  Random, vRand, 0, 0xFFFFFF
	color := Format("{:06X}", vRand)
  StringLower, color, color

  sendTextPreserveClipboard("#" + color)
}