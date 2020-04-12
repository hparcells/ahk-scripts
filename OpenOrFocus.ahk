; REQUIRES https://www.npmjs.com/package/chromix-too
; REQUIRES StdOutToVar.ahk

OpenOrFocus(url) {
	tabs := StdOutToVar("bash.exe -c ""chromix-too ls""")

	if(InStr(tabs, url)) {
		Run, bash.exe -c "chromix-too focus %url%",, Hide
	} else {
		Run, %url%
	}	
}
