; REQUIRES SendTextPreserveClipboard.ahk
; Change path on line 6 to your Discord installation.

navigateDiscord(target) {
	if(!WinExist("ahk_exe Discord.exe")) {
		Run, C:\Users\Hunter\AppData\Local\Discord\Update.exe --processStart Discord.exe
		WinWait, ahk_exe Discord.exe,, 5
	}
	if(!WinActive("ahk_exe Discord.exe")) {
		WinActivate ahk_exe Discord.exe
		WinWait, ahk_exe Discord.exe,, 5
	}
	if(WinActive("ahk_exe Discord.exe")) {
		WinGetTitle, title, ahk_exe Discord.exe
		if(!InStr(title, target)) {
			Send ^k
			Sleep 100
			sendTextPreserveClipboard(target)
			Sleep 100
			Send {Enter}
		}
	}
}
