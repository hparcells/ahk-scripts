newDoc() {
  WinGet, windowId, ID, A
  WinGetTitle, windowTitle, ahk_id %windowId%
  
  if(InStr(windowTitle, "Google Drive")) {
    Send +t;
    return
  }
  Run, "https://docs.google.com/document/u/0/create"
}
newSheet() {
  WinGet, windowId, ID, A
  WinGetTitle, windowTitle, ahk_id %windowId%

  if(InStr(windowTitle, "Google Drive")) {
    Send +s
    return
  }
  Run, "https://docs.google.com/spreadsheets/u/0/create"
}
