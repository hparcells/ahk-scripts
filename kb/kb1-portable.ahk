#SingleInstance force

SetKeyDelay, 1

SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
	
; Create groups.
GroupAdd, explorers, ahk_class CabinetWClass
GroupAdd, notepads, ahk_exe notepad.exe

hVirtualDesktopAccessor := DllCall("LoadLibrary", Str, "VirtualDesktopAccessor.dll", "Ptr") 
GoToDesktopNumberProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "GoToDesktopNumber", "Ptr")
GetCurrentDesktopNumberProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "GetCurrentDesktopNumber", "Ptr")
MoveWindowToDesktopNumberProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "MoveWindowToDesktopNumber", "Ptr")

tippy2(tipsHere, wait:=500) {
	ToolTip, %tipsHere%,,,8
	SetTimer, CloseToolTip, %wait%
}
closeToolTip() {
	ToolTip,,,,8
}

selectByRegEx() {
	if(WinActive("ahk_group explorers")) {
		static selectionPattern := ""
		WinGetPos, wx, wy
		ControlGetPos, cx, cy, cw, , DirectUIHWND3"name":\W"([A-Z][a-z]*)
		x := wx + cx + cw/2 - 200
		y := wy + cy
		InputBox, selectionPattern, Select by RegEx
			, RegEx pattern:
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

toggleDesktopItems() {
	ControlGet, hwnd, Hwnd, , SysListView321, ahk_class Progman
	ControlSend, , {F5}, ahk_id %hwnd%
	If DllCall("IsWindowVisible", UInt,hwnd)
		WinHide, ahk_id %hwnd%
	Else
		WinShow, ahk_id %hwnd%
}

GetDesktopIShellFolderViewDual() {
	IShellWindows := ComObjCreate("{9BA05972-F6A8-11CF-A442-00A0C90A8F39}")
	desktop := IShellWindows.Item(ComObj(19, 8)) ; VT_UI4, SCW_DESKTOP                

	; Retrieve top-level browser object.
	if ptlb := ComObjQuery(desktop
		, "{4C96BE40-915C-11CF-99D3-00AA004AE837}"  ; SID_STopLevelBrowser
		, "{000214E2-0000-0000-C000-000000000046}") ; IID_IShellBrowser
	{
		; IShellBrowser.QueryActiveShellView -> IShellView
		if DllCall(NumGet(NumGet(ptlb+0)+15*A_PtrSize), "ptr", ptlb, "ptr*", psv) = 0
		{
			; Define IID_IDispatch.
			VarSetCapacity(IID_IDispatch, 16)
			NumPut(0x46000000000000C0, NumPut(0x20400, IID_IDispatch, "int64"), "int64")
			
			; IShellView.GetItemObject -> IDispatch (object which implements IShellFolderViewDual)
			DllCall(NumGet(NumGet(psv+0)+15*A_PtrSize), "ptr", psv
				, "uint", 0, "ptr", &IID_IDispatch, "ptr*", pdisp)
			
			IShellFolderViewDual := ComObjEnwrap(pdisp)
			ObjRelease(psv)
		}
		ObjRelease(ptlb)
	}
	return IShellFolderViewDual
}

getPathOfSelected() {
	WinGetClass, winClass, % "ahk_id" . hWnd := WinExist("A")
	if (winClass ~= "Progman|WorkerW")
		oShellFolderView := GetDesktopIShellFolderViewDual()
	else if (winClass ~= "(Cabinet|Explore)WClass") {
		for window in ComObjCreate("Shell.Application").Windows
			if (hWnd = window.HWND) && (oShellFolderView := window.document)
			break
	}
	else
		return

	for item in oShellFolderView.SelectedItems
		result .= (result = "" ? "" : "`n") . item.path
	if !result
		result := oShellFolderView.Folder.Self.Path
	return result
}

sendTextPreserveClipboard(text) {
	SavedClipboard := ClipboardAll
	Clipboard := text
	Send ^v
	Sleep 100
	Clipboard := SavedClipboard
}

goToDesktop(desktop) {
  DllCall(GoToDesktopNumberProc, UInt, desktop)
  tippy2("Desktop " desktop + 1, 1000)
}

moveActiveToDesktop(desktop) {
  global MoveWindowToDesktopNumberProc, activeWindowByDesktop

  WinGet, activeHwnd, ID, A
  DllCall(MoveWindowToDesktopNumberProc, UInt, activeHwnd, UInt, desktop)

  tippy2("Moved to Desktop " desktop + 1)
}

getColorAtCursor() {
  MouseGetPos x, y
  PixelGetColor color, %x%, %y%, RGB
  
  color := SubStr(color, 3)
  color := "#" color

  StringLower, color, color

  return color
}

tippy2("Hello world!", 1000)

#if (getKeyState("CapsLock", "P"))	
	*CapsLock::return

	F1::
		FormatTime, date,, yyyy-MM-dd
		sendTextPreserveClipboard(date)

		return
	F2::
		FormatTime, date,, LongDate
		sendTextPreserveClipboard(date)
		return
	F3::
		FormatTime, time,, HH:mm
		sendTextPreserveClipboard(time)
		return
	^F3::
		FormatTime, time,, HH:mm:ss
		sendTextPreserveClipboard(time)
		return
	F4::
		FormatTime, longDate,, LongDate
		FormatTime, date,, yyyy-MM-dd
		FormatTime, time,, HH:mm:ss
		FormatTime, week,, YWeek
		FormatTime, day,, WDay
		FormatTime, era,, gg

		unix := A_NowUTC
		EnvSub, unix, 19700101000000, Seconds
		unix := unix * 1000 + A_MSec

		sendTextPreserveClipboard(date ": "longDate " " era " (Day " A_YDay " of 365) (Week " SubStr(week, 5) " of 52) at " time ":" A_MSec " EST (" unix ")")
		return

	SC29::
		selected := getPathOfSelected()
		Clipboard := selected
		tippy2(selected)
		return
	1::goToDesktop(0)
	!1::moveActiveToDesktop(0)
	2::goToDesktop(1)
	!2::moveActiveToDesktop(1)
	3::goToDesktop(2)
	!3::moveActiveToDesktop(2)
	4::goToDesktop(3)
	!4::moveActiveToDesktop(3)
	5::goToDesktop(4)
	!5::moveActiveToDesktop(4)
	6::goToDesktop(5)
	!6::moveActiveToDesktop(5)
	7::goToDesktop(6)
	!7::moveActiveToDesktop(6)
	8::goToDesktop(7)
	!8::moveActiveToDesktop(7)
	9::goToDesktop(8)
	!9::moveActiveToDesktop(8)

	Q::WinMinimize, A
	W::Send #{Up}
	E::
		color := getColorAtCursor()
		tippy2(color)
		Clipboard := color
		return
	R::
		tippy2("Reloading AHK...")
		Reload
		return
	T::
		if(!WinActive("ahk_exe chrome.exe")) {
			return
		}
		Send !x
		tippy2("Splitting...")
		return
	Y::Send ​
	O::
		tippy2("Stopping AHK...")
		ExitApp
		return
	P::toggleDesktopItems()

	S::Send +#{Left}
	D::Send +#{Right}
	F::selectByRegEx()
	G::Run, calc
	Enter::
		SavedClipboard := Clipboard
		Clipboard := ""
		Send ^c
		ClipWait

		searchUrl = https://www.google.com/search?q=%Clipboard%
		Run %searchUrl%

		Sleep 50
		Clipboard := SavedClipboard
		return

	Z::Run, notepad.exe
	X::
		global MoveWindowToDesktopNumberProc, GoToDesktopNumberProc, activeWindowByDesktop
		current := DllCall(GetCurrentDesktopNumberProc, UInt)

		WinGet, activeHwnd, ID, A
		DllCall(MoveWindowToDesktopNumberProc, UInt, activeHwnd, UInt, current - 1)
		DllCall(GoToDesktopNumberProc, UInt, current - 1)

		current := DllCall(GetCurrentDesktopNumberProc, UInt)
		tippy2("Desktop " current + 1)
		return
	C::
		global MoveWindowToDesktopNumberProc, GoToDesktopNumberProc, activeWindowByDesktop
		current := DllCall(GetCurrentDesktopNumberProc, UInt)

		WinGet, activeHwnd, ID, A
		DllCall(MoveWindowToDesktopNumberProc, UInt, activeHwnd, UInt, current + 1)
		DllCall(GoToDesktopNumberProc, UInt, current + 1)

		current := DllCall(GetCurrentDesktopNumberProc, UInt)
		tippy2("Desktop " current + 1)
		
		return
	B::
		Winset, AlwaysOnTop, Toggle, A
		tippy2("Toggling AoT...")
		return
	N::
		WinGet, transparency, Transparent, A
		if (transparency = 255) {
			Winset, Transparent, 190, A
		} else if (transparency = 190) {
			Winset, Transparent, 125, A
		} else if (transparency = 125) {
			Winset, Transparent, 255, A
		}else {
			Winset, Transparent, 190, A
		}
		tippy2("Toggling transparency...")
		return

	Up::Send ✅
	^Up::Send ✓
	Down::Send ❌
	^Down::Send ✗
	Left::Send ←
	Right::Send →

  Numpad8::Send ∆
#if
