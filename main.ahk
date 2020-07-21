; https://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html

#SingleInstance force
#MaxHotkeysPerInterval 42069

#include chrome/open-or-focus.ahk

#include cmd/run-cmd.ahk
#include cmd/std-out-to-var.ahk

#include discord/add-discord-reaction.ahk
#include discord/send-latest-discord-message.ahk
#include discord/navigate-discord.ahk

#include explorer/select-random-item-in-folder.ahk
#include explorer/upzip-latest.ahk
#include explorer/create-folder-hierarchy.ahk
#include explorer/explorer-getters.ahk
#include explorer/select-by-regex.ahk
#include explorer/change-explorer-icon-size.ahk
#include explorer/paste-image.ahk
#include explorer/change-explorer-sort.ahk
#include explorer/toggle-hidden-items.ahk
#include explorer/toggle-desktop-items.ahk
#include explorer/get-path-of-selected.ahk

#include game/google-crossword.ahk

#include gsuite/docs-hanging-indent.ahk
#include gsuite/sheets-clone-row.ahk
#include gsuite/gsuite-new.ahk

#include lib/gdip.ahk

#include personal/send-other.ahk

#include random/random-date.ahk
#include random/random-uuid.ahk
#include random/random-color.ahk

#include text/send-text-preserve-clipboard.ahk
#include text/gen-random-emoji-string.ahk
#include text/clap-text.ahk
#include text/mock-text.ahk
#include text/space-text.ahk

#include util/get-color-at-cursor.ahk
#include util/brightness-setter.ahk
#include util/tippy2.ahk
#include util/clipboard.ahk
#include util/calc.ahk
#include util/lock-and-turn-off-screens.ahk
#include util/trim-video.ahk

; Force run as admin.
if(!A_IsAdmin) {
	Run *RunAs "%A_ScriptFullPath%"
	ExitApp
}

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

; Handle Escape press in GUI
GuiEscape:
	Gui, Destroy
	Return

; PLEASE DELETE THESE IF YOU ARE NOT USING THESE
#include kb/kb1.ahk
#include kb/kb2.ahk
#include kb/kb3.ahk
