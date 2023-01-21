#if (getKeyState("F23", "P"))	
	F1::
		if(WinActive("ahk_class CabinetWClass")) {
			sortByName()
		}
		return
	F2::
		if(WinActive("ahk_class CabinetWClass")) {
			sortByDate()
		}
		return
	F3::
		if(WinActive("ahk_class CabinetWClass")) {
			changeExplorerIconSize()
		}
		return
	F4::createFolderHierarchy()
	F5::selectByRegEx()
	F6::Run, "batch-rename.ahk", explorer
	F7::toggleHiddenItems()
	F8::toggleDesktopItems()
	F9::newDoc()
	F10::newSheet()

	SC29::
		selected := getPathOfSelected()
		Clipboard := selected
		tippy2(selected)
		return
	SC0D::Run, "C:\Program Files\AutoHotkey\WindowSpy.ahk"
	Backspace::lockAndTurnOffScreens()

	Tab::OpenOrFocus("http://localhost:8000/")
	^Tab::Run, "http://localhost:8000/"
	!Tab::RunBashCmd("chromix-too rm localhost:8000")

	R::
		Send ^v
		Send {Enter}
		return
	O::other()
	P::sendTextPreserveClipboard(randomUuid())
	SC1A::Reload
	SC1B::runCmd("code ""C:\2nd Keyboard""")
	^SC1B::OpenOrFocus("https://www.figma.com/file/4w2FsghkycPTEyNEiv06RE/Macro?node-id=606%3A2")
	SC2B::trimVideo()

	CapsLock::
		color := getColorAtCursor()

		tippy2(color)
		Clipboard := color

		return
	SC28::unzipLatest()
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

	Z::
		WinGet, windowId, ID, A
		WinGetTitle, windowTitle, ahk_id %windowId%
		
		if(InStr(windowTitle, "ShareX")) {
			Send !{F4}
			return
		}
		Run, "C:\Program Files\ShareX\ShareX.exe"
		return
	X::
		Send ^c
		Sleep 50
		expression := Clipboard
		Sleep 100
		Clipboard := SavedClipboard		

		sendTextPreserveClipboard(calc(expression))

		return
	^X::
		Send ^c
		Sleep 50
		expression := Clipboard
		Sleep 100
		Clipboard := SavedClipboard		

		sendTextPreserveClipboard(expression " = " calc(expression))

		return
	C::
		if(!WinExist("ahk_exe chrome.exe")) {
			Run, C:\Program Files\Google\Chrome\Application\chrome.exe
		}
		if(WinActive("ahk_exe chrome.exe")) {
			Send ^{Tab}
		}else {
			WinActivate ahk_exe chrome.exe
		}
		return
	^C::
		Run, C:\Program Files\Google\Chrome\Application\chrome.exe
		return
	+C::GroupActivate, chromes, r
	!C::WinClose, ahk_group chromes
	V::
		if(!WinExist("ahk_exe Code.exe")) {
			Run, C:\Users\Hunter\AppData\Local\Programs\Microsoft VS Code/Code.exe
		}
		if(WinActive("ahk_exe Code.exe")) {
			GroupActivate, codes, r
		}else {
			WinActivate ahk_exe Code.exe
		}
		return
	^V::Run, C:\Users\Hunter\AppData\Local\Programs\Microsoft VS Code/Code.exe
	!V::WinClose, ahk_group codes
	B::OpenOrFocus("https://www.youtube.com/")
	^B::Run, "https://www.youtube.com/"
	!B::runBashCmd("chromix-too rm https://www.youtube.com/")
	+B::OpenOrFocus("https://studio.youtube.com/")
	^+B::Run, "https://studio.youtube.com/"
	+!B::runBashCmd("chromix-too rm https://studio.youtube.com/")
	N::OpenOrFocus("https://www.figma.com/")
	^N::Run, "https://www.figma.com/"
	!N::runBashCmd("chromix-too rm https://www.figma.com/")
	M::OpenOrFocus("https://mail.google.com/mail/u/0/")
	^M::Run "https://mail.google.com/mail/u/0/"
	!M::runBashCmd("chromix-too rm https://mail.google.com/mail/u/0/")
	,::OpenOrFocus("https://calendar.google.com/")
	^,::Run, "https://calendar.google.com/"
	!,::runBashCmd("chromix-too rm https://calendar.google.com/")
	.::
		sendTextPreserveClipboard("git add . && git commit -m """"")
		Send {Left}
		return
	SC7D::Winset, AlwaysOnTop, Toggle, A

	; SC72::
	; 	WinGetTitle, title, ahk_exe vlc.exe
	; 	tippy2(stdOutToVar("vlc-song -p password"))
	; 	return
	Space::
		WinGet, xPID, PID, A
		Process, Close, %xPID%
		return

	SC7B::
		if(WinActive("ahk_class CabinetWClass")) {
			Send +{AppsKey}
			Send w
			Send {Enter}
		}
		return

	; Clipboards
	Insert::copy(0)
	Home::copy(1)
	PgUp::copy(2)
	Del::paste(0)
	End::paste(1)
	PgDn::paste(2)

	; Folders
	Up::Run, E:\0. Pool
	Left::Run, C:\Users\Hunter\Desktop
	Down::Run, C:\Users\Hunter\Downloads
	Right::Run, C:\Users\Hunter\Documents

	; OBS
	; Changing keydelay to 50ms because OBS doesn't like instant keys.
	NumLock::
		SetKeyDelay, -1, 50
		ControlSend, , ^+!{NumLock}, ahk_exe obs64.exe
		SetKeyDelay, 10
		return
	NumpadDiv::
		SetKeyDelay, -1, 50
		ControlSend, , ^+!{NumpadDiv}, ahk_exe obs64.exe
		SetKeyDelay, 10
		return
	NumpadMult::
		SetKeyDelay, -1, 50
		ControlSend, , ^+!{NumpadMult}, ahk_exe obs64.exe
		SetKeyDelay, 10
		return
	NumpadSub::
		SetKeyDelay, -1, 50
		ControlSend, , ^+!{NumpadSub}, ahk_exe obs64.exe
		SetKeyDelay, 10
		return
	NumpadAdd::
		SetKeyDelay, -1, 50
		ControlSend, , ^+!{NumpadAdd}, ahk_exe obs64.exe
		SetKeyDelay, 10
		return
	NumpadEnter::
		SetKeyDelay, -1, 50
		ControlSend, , ^+!{NumpadEnter}, ahk_exe obs64.exe
		SetKeyDelay, 10
		return

	; VoiceMeeter
	Numpad1::Send ^{Numpad1}
	Numpad2::Send ^{Numpad2}
	Numpad3::Send ^{Numpad3}
	Numpad4::Send ^{Numpad4}
	Numpad5::Send ^{Numpad5}
	Numpad6::Send ^{Numpad6}
	Numpad7::Send ^{Numpad7}
	Numpad8::Send ^{Numpad8}
	Numpad9::Send ^{Numpad9}
	NumpadDot::Send ^{Numpad0}
	Numpad0::
		if(!WinExist("ahk_exe voicemeeterpro.exe")) {
			Run, C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe
			return
		}
		if(WinActive("ahk_exe voicemeeterpro.exe")) {
			Send !{F4}
			return
		}
		WinActivate ahk_exe voicemeeterpro.exe
		return
#if
