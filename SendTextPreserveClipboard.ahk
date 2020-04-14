SendTextPreserveClipboard(text) {
	savedClipboard := ClipboardAll
	Sleep 100
	Clipboard := text
	Sleep 1
	Send ^v
	Sleep 100
	Clipboard := savedClipboard
}
