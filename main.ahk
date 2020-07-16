; https://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html

#SingleInstance force
#MaxHotkeysPerInterval 42069

#include chrome/OpenOrFocus.ahk

#include cmd/RunCmd.ahk
#include cmd/StdOutToVar.ahk

#include discord/AddDiscordReaction.ahk
#include discord/SendLatestDiscordMessage.ahk
#include discord/NavigateDiscord.ahk

#include explorer/SelectRandomItemInFolder.ahk
#include explorer/UnzipLatest.ahk
#include explorer/CreateFolderHierarchy.ahk
#include explorer/Explorer.ahk
#include explorer/SelectByRegEx.ahk
#include explorer/ChangeExplorerView.ahk
#include explorer/PasteImage.ahk

#include game/GoogleCrossword.ahk

#include lib/Gdip.ahk

#include personal/SendOther.ahk

#include random/RandomDate.ahk

#include text/SendTextPreserveClipboard.ahk
#include text/GenRandomEmojiString.ahk
#include text/ClapText.ahk
#include text/MockText.ahk
#include text/SpaceText.ahk

#include util/GetColorAtCursor.ahk
#include util/BrightnessSetter.ahk
#include util/Tippy2.ahk
#include util/Clipboard.ahk
#include util/Calc.ahk

; Force run as admin.
if(!A_IsAdmin) {
	Run *RunAs "%A_ScriptFullPath%"
	ExitApp
}

; Hide the console.
DllCall("AllocConsole")
WinHide % "ahk_id " DllCall("GetConsoleWindow", "ptr")

; BrightnessSetter
Brightness := new BrightnessSetter()

; Virtual Desktop Accessor
hVirtualDesktopAccessor := DllCall("LoadLibrary", Str, "lib/VirtualDesktopAccessor.dll", "Ptr") 
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
