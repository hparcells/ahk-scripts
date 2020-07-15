; REQUIRES https://www.npmjs.com/package/chromix-too
; REQUIRES StdOutToVar.ahk
; REQUIRES RunCmd.ahk

OpenOrFocus(url) {
	tabs := StdOutToVar("bash.exe -c ""chromix-too ls""")

	if(InStr(tabs, url)) {
		RunBashCmd("chromix-too focus " url)
	} else {
		Run, %url%
	}	
}
