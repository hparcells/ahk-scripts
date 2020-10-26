; REQUIRES SendTextPreserveClipboard.ahk
; REQUIRES PasteImage.ahk

sendOther(fullFilePath) {
  SplitPath, fullFilePath, fileName,, ext

  if(ext = "png" || ext = "jpg" || ext = "jpeg" || ext = "webp" || ext = "gif") {
    if(FileExist("E:\Meme Library\Other\public\" fileName)) {
      sendTextPreserveClipboard("https://davecode.me/other/" fileName)
    }else {
      pasteImage(fullFilePath)
    }
  }else if(FileExist("E:\Meme Library\Other\public\" fileName)) {
    sendTextPreserveClipboard("https://davecode.me/other/" fileName)
  }else if(ext = "txt") {
    FileRead, text, %fullFilePath%
    sendTextPreserveClipboard(text)
  }
}
