SendTextPreserveClipboard(text) {
	savedClipboard := ClipboardAll
	Clipboard := text
	Sleep 1
	Send ^v
	Sleep 100
	Clipboard := savedClipboard
}
