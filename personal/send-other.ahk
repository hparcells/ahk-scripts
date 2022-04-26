; REQUIRES SendTextPreserveClipboard.ahk
; REQUIRES PasteImage.ahk

sendOther(file) {
  if(ext = "png" || ext = "webp" || ext = "gif") {
      sendTextPreserveClipboard("https://otherzone.net/" file)
    if(FileExist("Z:\otherzone\" file)) {
    }else {
      pasteImage(fullFilePath)
    }
  }else if(FileExist("Z:\otherzone\" file)) {
    sendTextPreserveClipboard("https://otherzone.net/" file)
  }else if(ext = "txt") {
    FileRead, text, %fullFilePath%
    sendTextPreserveClipboard(text)
  }
}
