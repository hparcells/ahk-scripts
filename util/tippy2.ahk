; https://github.com/TaranVH/2nd-keyboard/blob/9ee39aaccf9c58df9c4a7c19eb7d12ab5223872c/Almost_All_Windows_Functions.ahk

tippy2(tipsHere, wait:=500) {
	ToolTip, %tipsHere%,,,8
	SetTimer, CloseToolTip, %wait%
}
closeToolTip() {
	ToolTip,,,,8
}
