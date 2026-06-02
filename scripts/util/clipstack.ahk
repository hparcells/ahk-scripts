clipStackSize := 0

clipStackPush() {
	global
	local oldClipboard := ClipboardAll
	Clipboard =

	Send ^c
	ClipWait, 2, 1
	if (ErrorLevel) {
		Clipboard := oldClipboard
		return
	}

	clipStackSize++
	clipStack%clipStackSize% := ClipboardAll
	tippy2("Clip Stack size: " clipStackSize, 1000)

	Clipboard := oldClipboard
}

clipStackPop() {
	global
	if (clipStackSize = 0) {
		tippy2("Clip Stack is empty.", 1000)
		return
	}

	local oldClipboard := ClipboardAll
	Clipboard := clipStack%clipStackSize%
	Send ^v

	Sleep, 100
	Clipboard := oldClipboard
	clipStack%clipStackSize% =
	clipStackSize--
	tippy2("Clip Stack size: " clipStackSize, 1000)
}

clipStackShift() {
	global
	if (clipStackSize = 0) {
		tippy2("Clip Stack is empty.", 1000)
		return
	}

	local oldClipboard := ClipboardAll
	Clipboard := clipStack1
	Send ^v

	Sleep, 100
	Clipboard := oldClipboard
	Loop % clipStackSize - 1 {
		next := A_Index + 1
		clipStack%A_Index% := clipStack%next%
	}
	clipStack%clipStackSize% =
	clipStackSize--
	tippy2("Clip Stack size: " clipStackSize, 1000)
}

clipStackUnshift() {
	global
	local oldClipboard := ClipboardAll

	Clipboard =
	Send ^c
	ClipWait, 2, 1
	if (ErrorLevel) {
		Clipboard := oldClipboard
		return
	}

	local newItem := ClipboardAll
	Clipboard := oldClipboard
	Loop % clipStackSize {
		i := clipStackSize - A_Index + 1
		next := i + 1
		clipStack%next% := clipStack%i%
	}
	clipStackSize++
	clipStack1 := newItem
	tippy2("Clip Stack size: " clipStackSize, 1000)
}

clipStackDump() {
	global
	if (clipStackSize = 0) {
		MsgBox, Clip Stack is empty.
		return
	}

	local oldClipboard := ClipboardAll
	local dump := ""
	Loop % clipStackSize {
		Clipboard := clipStack%A_Index%
		dump .= A_Index ": " Clipboard "`n"
	}

	Clipboard := oldClipboard

	MsgBox, % dump
}

clipStackClear() {
	global
	Loop % clipStackSize {
		clipStack%A_Index% =
	}
	clipStackSize := 0
	tippy2("Clip Stack cleared.", 1000)
}
