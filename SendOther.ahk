; REQUIRES SendTextPreserveClipboard.ahk
; REQUIRES PasteImage.ahk

SendOther(fullFilePath) {
  SplitPath, fullFilePath, fileName,, ext

  if(ext = "png" || ext = "jpg" || ext = "jpeg" || ext = "webp" || ext = "gif") {
    if(FileExist("C:\Users\Hunter\Box Sync\meme.imfast.io\" fileName)) {
      SendTextPreserveClipboard("https://meme.imfast.io/" fileName)
    }else {
      PasteImage(fullFilePath)
    }
  }else if(FileExist("C:\Users\Hunter\Box Sync\meme.imfast.io\" fileName)) {
    SendTextPreserveClipboard("https://meme.imfast.io/" fileName)
  }else if(ext = "txt") {
    FileRead, text, %fullFilePath%
    SendTextPreserveClipboard(text)
  }
}
