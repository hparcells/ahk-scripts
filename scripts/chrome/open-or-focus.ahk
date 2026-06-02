; REQUIRES https://www.npmjs.com/package/chromix-too
; REQUIRES StdOutToVar.ahk
; REQUIRES RunCmd.ahk

openOrFocus(url) {
	tabs := bashStdOutToVar("chromix-too ls")

	if(InStr(tabs, url)) {
		runBashCmd("chromix-too focus " url)
	} else {
		Run, %url%
	}	
}
