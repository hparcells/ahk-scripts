; REQUIRES https://www.npmjs.com/package/chromix-too
; REQUIRES StdOutToVar.ahk
; REQUIRES RunCmd.ahk

OpenOrFocus(url) {
	tabs := stdOutToVar("bash.exe -c ""chromix-too ls""")

	if(InStr(tabs, url)) {
		runBashCmd("chromix-too focus " url)
	} else {
		Run, %url%
	}	
}
