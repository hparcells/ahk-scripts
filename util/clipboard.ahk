; https://www.autohotkey.com/boards/viewtopic.php?t=31473

copy(clipboardID) {
	global
	local oldClipboard := ClipboardAll
	
	Clipboard =
	Send ^c

	ClipWait, 2, 1
	if(ErrorLevel) {
		Clipboard := oldClipboard
		return
	}
	
	ClipboardData%clipboardID% := ClipboardAll
	
	Clipboard := oldClipboard
}

paste(clipboardID) {
	global
	local oldClipboard := ClipboardAll

	Clipboard := ClipboardData%clipboardID%
	Send ^v

	Sleep 100

	Clipboard := oldClipboard
	oldClipboard = 
}
