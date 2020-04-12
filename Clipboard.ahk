; https://www.autohotkey.com/boards/viewtopic.php?t=31473

Copy(clipboardID) {
	global
	local oldClipboard := ClipboardAll
	
	Clipboard =
	Send ^c

	ClipWait, 2, 1
	if(ErrorLevel) {
		Clipboard := oldClipboard
		Return
	}
	
	ClipboardData%clipboardID% := ClipboardAll
	
	Clipboard := oldClipboard
}

Paste(clipboardID) {
	global
	local oldClipboard := ClipboardAll

	Clipboard := ClipboardData%clipboardID%
	Send ^v

	Clipboard := oldClipboard
	oldClipboard = 
}
