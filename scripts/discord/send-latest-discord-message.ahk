; REQUIRES: Better Discord
; REQUIRES: Message Utilities (Better Discord Plugin)

; Copy raw text in Message Utilities must be set to double click for this script to work unmodified.
; You may have to change the coords on line 12.

sendLatestDiscordMessage() {
  if(WinActive("ahk_exe Discord.exe")) {
    SavedClipboard := ClipboardAll

    MouseGetPos x, y
    MouseMove, 286, 947, 0

    Send {Click, 2}
    MouseMove, x, y, 0

    Send ^v
    Sleep 100
    Clipboard := SavedClipboard
  }
}
