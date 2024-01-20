#if (getKeyState("CapsLock", "P"))	
	; e.preventDefault()
	*CapsLock::return

	; For Spanish stuff. Probably no longer needed anymore.
	!::Send ¡
	E::Send é
	+E::Send É
	U::Send ú
	+U::Send Ú
	I::Send í
	+I::Send Í
	O::Send ó
	+O::Send Ó
	A::Send á
	+A::Send Á
	N::Send ñ
	+N::Send Ñ
	?::Send ¿

	; Quick insert date and time stuff.
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

	; Text generation.
	F5::sendTextPreserveClipboard(StrReplace(stdOutToVar("lorem-ipsum 1 sentence"), "`n"))
	F6::sendTextPreserveClipboard(StrReplace(stdOutToVar("lorem-ipsum 1 paragraph"), "`n"))
	F8::randomColor()
	F9::
		Random, result, 1, 2
		if(result = 1) {
			if(WinActive("ahk_exe Discord.exe")) {
				sendTextPreserveClipboard(":red_circle: You Flipped **Heads** :red_circle:")
				Send {Enter}
			}else {
				sendTextPreserveClipboard("🔴 You Flipped Heads 🔴")
			}
		}else {
			if(WinActive("ahk_exe Discord.exe")) {
				sendTextPreserveClipboard(":blue_circle: You Flipped **Tails** :blue_circle:")
				Send {Enter}
			}else {
				sendTextPreserveClipboard("🔵 You Flipped Tails 🔵")
			}
		}

		return
	F10::
		Random, result, 1, 6
	
		if(WinActive("ahk_exe Discord.exe")) {
			sendTextPreserveClipboard(":game_die: You Rolled **" result "** :game_die:")
			Send {Enter}
		}else {
			sendTextPreserveClipboard("🎲 You Rolled " result " 🎲")
		}

		return

	1::
		DllCall(GoToDesktopNumberProc, UInt, 0)
		tippy2("Desktop 1")
		return
	2::
		DllCall(GoToDesktopNumberProc, UInt, 1)
		tippy2("Desktop 2")
		return
	3::
		DllCall(GoToDesktopNumberProc, UInt, 2)
		tippy2("Desktop 3")
		return
	4::
		DllCall(GoToDesktopNumberProc, UInt, 3)
		tippy2("Desktop 4")
		return
	+4::Send §
	5::
		DllCall(GoToDesktopNumberProc, UInt, 4)
		tippy2("Desktop 5")
		return
	6::
		DllCall(GoToDesktopNumberProc, UInt, 5)
		tippy2("Desktop 6")
		return
	7::
		DllCall(GoToDesktopNumberProc, UInt, 6)
		tippy2("Desktop 7")
		return

	Q::WinMinimize, A
	W::Send #{Up}
	T::Send !x
	Y::Send ​

	; Cycles the currently focused window between monitors.
	S::Send +#{Left}
	D::Send +#{Right}
	
	G::Run, calc

	Z::Run, notepad.exe
	!Z::WinClose, ahk_group notepads

	; My most used hotkeys. Transfers the currently focused window to the next/previous workspace/virtual desktop.
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
	Space::Send ^!{Right}

	Up::Send ✓
	Down::Send ✗
	Left::Send ←
	Right::Send →

	; I don't have a 100% anymore so these are useless to me.
	; Numpad8::Send ∆
	; Numpad0::Send ₀
#if
