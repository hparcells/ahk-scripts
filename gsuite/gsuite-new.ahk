newDoc() {
  WinGet, windowId, ID, A
  WinGetTitle, windowTitle, ahk_id %windowId%
  
  if(InStr(windowTitle, "Google Drive")) {
    Send +t;
    Return
  }
  Run, "https://docs.google.com/document/u/0/create"
}
newSheet() {
  WinGet, windowId, ID, A
  WinGetTitle, windowTitle, ahk_id %windowId%

  if(InStr(windowTitle, "Google Drive")) {
    Send +s
    Return
  }
  Run, "https://docs.google.com/spreadsheets/u/0/create"
}
