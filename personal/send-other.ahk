; REQUIRES SendTextPreserveClipboard.ahk
; COPY INCLUDED HERE FOR EASY DISTRIBUTION!!!

global selectedFile

; Send text while preserving clipboard content.
sendTextPreserveClipboard2(text) {
	savedClipboard := ClipboardAll
	Clipboard := text
	Sleep 100
	Send ^v
	Sleep 100
	Clipboard := savedClipboard
}

; Join an array with characters.
; https://www.autohotkey.com/boards/viewtopic.php?t=25918
StrJoin(obj, delimiter := "", OmitChars := ""){
	string := obj[1]
	Loop % obj.MaxIndex() - 1
		string .= delimiter Trim(obj[A_Index+1], OmitChars)
	return string
}

sendOther(file) {
  sendTextPreserveClipboard2("https://otherzone.net/" file)
}

submit() {
  Gui, Submit
  sendOther(selectedFile)
}

; CALL THIS FUNCTION IN YOUR SCRIPT
other() {
  ; Input box.
  InputBox, searchTerm, Other, Enter file., , 200, 130
  searchTerm := StrReplace(searchTerm, " ", "-")

  global matchedFiles := []

  if(ErrorLevel) {
    return
  }

  ; Get list of other files.
  whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
  ; URL to list of other files. One file per line, only file name and extension.
  whr.Open("GET", "https://otherzone.net/list.txt", true)
  whr.Send()
  whr.WaitForResponse()
  otherList := StrSplit(whr.ResponseText, "`r`n")

  ; Find any that match the search.
  for i, otherItem in otherList {
    match := RegExMatch(otherItem, searchTerm)

    if(match > 0) {
      matchedFiles.Push(otherItem)
    }
  }

  ; If only one exists, send immediately.
  if(matchedFiles.MaxIndex() = 1) {
    foundFile := matchedFiles[1]
    sendOther(foundFile)

    return
  }

  ; If more than one match...
  if(matchedFiles.MaxIndex() > 1) {
    Gui, New,, Select File
    filesSeparated := StrJoin(matchedFiles, "|")
    rows := matchedFiles.Length()

    if(rows > 50) {
      rows := 50
    }

    ; ...add to ListBox.
    Gui, Add, ListBox, r%rows% vselectedFile, %filesSeparated%
    Gui, Add, Button, default h0 w0 gsubmit,
    Gui, Show

    return
  }

  ; If nothing is found.
  MsgBox, "%searchTerm%" not found.
}
