; https://sharats.me/posts/the-magic-of-autohotkey-2/
; REQUIRES Explorer.ahk

createFolderHierarchy() {
	if(WinActive("ahk_group explorers")) {
		loc := Explorer_GetPath()
		WinGetPos, wx, wy
		ControlGetPos, cx, cy, cw, , DirectUIHWND3
		x := wx + cx + cw/2 - 200
		y := wy + cy
		InputBox, folder, Create Folder, Enter folder path to create:, , 400, 130
			, %x%, %y%
		if(ErrorLevel) {
			return
		}

		folder := StrReplace(folder, "/", "\")
		pos := RegExMatch(folder, "O)\{([^\{]+)\}", match)
		folders := []
		if(pos > 0) {
			parts := StrSplit(match.value(1), ",")
			prefix := SubStr(folder, 1, match.Pos(0) - 1)
			suffix := SubStr(folder, match.Pos(0) + match.Len(0))
			for i, part in parts {
				folders.Push(prefix . part . suffix)
			}
		}else {
			folders.Push(folder)
		}
		for i, folder in folders {
			FileCreateDir, %loc%\%folder%
		}
		
		Explorer_GetWindow().Navigate2(loc . "\" . folders[folders.Length()])
	}
}
