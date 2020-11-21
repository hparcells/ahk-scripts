sendTextPreserveClipboard(text) {
	savedClipboard := ClipboardAll
	Clipboard := text
	Sleep 100
	Send ^v
	Sleep 100
	Clipboard := savedClipboard
}
