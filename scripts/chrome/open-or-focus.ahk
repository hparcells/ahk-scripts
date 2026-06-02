; REQUIRES https://www.npmjs.com/package/chromix-too
; REQUIRES StdOutToVar.ahk
; REQUIRES RunCmd.ahk

openOrFocus(url) {
	tabs := stdOutToVar("chromix-too ls")

	if(InStr(tabs, url)) {
		runCmd("chromix-too focus " url)
	} else {
		Run, %url%
	}	
}
