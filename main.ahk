; https://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html

#SingleInstance force
#MaxHotkeysPerInterval 42069

#include scripts/chrome/open-or-focus.ahk

#include scripts/cmd/run-cmd.ahk
#include scripts/cmd/std-out-to-var.ahk

#include scripts/discord/add-discord-reaction.ahk
#include scripts/discord/send-latest-discord-message.ahk
#include scripts/discord/navigate-discord.ahk

#include scripts/explorer/select-random-item-in-folder.ahk
#include scripts/explorer/upzip-latest.ahk
#include scripts/explorer/create-folder-hierarchy.ahk
#include scripts/explorer/explorer-getters.ahk
#include scripts/explorer/select-by-regex.ahk
#include scripts/explorer/change-explorer-icon-size.ahk
#include scripts/explorer/paste-image.ahk
#include scripts/explorer/change-explorer-sort.ahk
#include scripts/explorer/toggle-hidden-items.ahk
#include scripts/explorer/toggle-desktop-items.ahk
#include scripts/explorer/get-path-of-selected.ahk

#include scripts/game/google-crossword.ahk

#include scripts/gsuite/docs-hanging-indent.ahk
#include scripts/gsuite/sheets-clone-row.ahk
#include scripts/gsuite/gsuite-new.ahk

#include scripts/personal/send-other-config.ahk
#include scripts/personal/send-other.ahk

#include scripts/random/random-date.ahk
#include scripts/random/random-uuid.ahk
#include scripts/random/random-color.ahk

#include scripts/spotify/Spotify.ahk
#include scripts/spotify/spotify-ahk/Spotify.ahk

#include scripts/text/send-text-preserve-clipboard.ahk
#include scripts/text/gen-random-emoji-string.ahk
#include scripts/text/clap-text.ahk
#include scripts/text/mock-text.ahk
#include scripts/text/space-text.ahk

#include scripts/util/get-color-at-cursor.ahk
#include scripts/util/brightness-setter.ahk
#include scripts/util/tippy2.ahk
#include scripts/util/clipboard.ahk
#include scripts/util/clipstack.ahk
#include scripts/util/calc.ahk
#include scripts/util/desktop.ahk
#include scripts/util/lock-and-turn-off-screens.ahk
#include scripts/util/trim-video.ahk

#include lib/gdip.ahk

; Force run as admin.
; if(!A_IsAdmin) {
; 	Run *RunAs "%A_ScriptFullPath%"
; 	ExitApp
; }

SetCapsLockState, AlwaysOff
SetNumLockState, AlwaysOn
SetScrollLockState, AlwaysOff

; This console thing.
DllCall("AllocConsole")
console := DllCall("GetConsoleWindow")
WinHide % "ahk_id " console

; BrightnessSetter
Brightness := new BrightnessSetter()

; Virtual Desktop Accessor
hVirtualDesktopAccessor := DllCall("LoadLibrary", Str, "lib/virtual-desktop-accessor.dll", "Ptr") 
GoToDesktopNumberProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "GoToDesktopNumber", "Ptr")
GetCurrentDesktopNumberProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "GetCurrentDesktopNumber", "Ptr")
MoveWindowToDesktopNumberProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "MoveWindowToDesktopNumber", "Ptr")

; Create groups.
GroupAdd, explorers, ahk_class CabinetWClass
GroupAdd, chromes, ahk_exe chrome.exe
GroupAdd, codes, ahk_exe Code.exe
GroupAdd, notepads, ahk_exe notepad.exe

; Spotify
; THIS MUST RUN ON STARTUP
spotify := new Spotify

tippy2("Hello world!", 1000)

; ----- PLACE ALL AUTO-EXECUTE CODE  ^^^^^ABOVE THIS -----

; Handle Escape press in GUI
GuiEscape:
	Gui, Destroy
	return

; PLEASE DELETE THESE IF YOU ARE NOT USING THESE
#include kb/kb1.ahk
; #include kb/kb2.ahk
#include kb/kb3.ahk
