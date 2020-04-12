; REQUIRES SendTextPreserveClipboard.ahk
; Change path on line 6 to your Discord installation.

NavigateDiscord(target) {
	if(!WinExist("ahk_exe Discord.exe")) {
		Run, C:\Users\Hunter\AppData\Local\Discord\Update.exe --processStart Discord.exe
		Sleep 500
	}
	if(!WinActive("ahk_exe Discord.exe")) {
		WinActivate ahk_exe Discord.exe
		Sleep 100
	}
	if(WinActive("ahk_exe Discord.exe")) {
		WinGetTitle, title, ahk_exe Discord.exe
		if(!InStr(title, target)) {
			Sleep 100
			SetKeyDelay, 50
			Send ^k
			Sleep 50
			SendTextPreserveClipboard(target)
			Send {Enter}
			SetKeyDelay, -1
		}
	}
}
