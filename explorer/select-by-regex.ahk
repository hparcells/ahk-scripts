; https://sharats.me/posts/the-magic-of-autohotkey-2/

selectByRegEx() {
	if(WinActive("ahk_group explorers")) {
		static selectionPattern := ""
		WinGetPos, wx, wy
		ControlGetPos, cx, cy, cw, , DirectUIHWND3
		x := wx + cx + cw/2 - 200
		y := wy + cy
		InputBox, selectionPattern, Select by RegEx
			, Enter regex pattern to select files that contain it:
			, , 400, 140, %x%, %y%, , , %selectionPattern%
		if(ErrorLevel) {
			return
		}
		for window in ComObjCreate("Shell.Application").Windows {
			if(WinActive("ahk_id " . window.hwnd)) {
				pattern := "S)" . selectionPattern
				items := window.document.Folder.Items
				total := items.Count()
				i := 0
				for item in items {
					match := RegExMatch(item.Name, pattern) ? 17 : 0
					window.document.SelectItem(item, match)
				}
				Break
			}
		}
	}
}
