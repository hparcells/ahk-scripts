SendTextPreserveClipboard(text) {
	savedClipboard := ClipboardAll
	Clipboard := text
	Send ^v
	Sleep 100
	Clipboard := savedClipboard
}
