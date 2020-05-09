; REQUIRES SendTextPreserveClipboard.ahk
; REQUIRES PasteImage.ahk

SendOther(fullFilePath) {
  RegExMatch(fullFilePath, "(.*)\\.*\\.*$", otherFolderFolder)
  SplitPath, fullFilePath,,, ext

  folderFileLocation := StrReplace(SubStr(fullFilePath, StrLen(otherFolderFolder1) + 2), "\", "/")
  folderFileLocation := StrReplace(folderFileLocation, "other/") 

  if(ext = "png" || ext = "jpg" || ext = "jpeg" || ext = "webp" || ext = "gif") {
    if(FileExist("C:\Users\Hunter\Box Sync\other\" folderFileLocation)) {
      davecodeUrl := "https://davecode.me/other/" folderFileLocation
      SendTextPreserveClipboard(davecodeUrl)
    }else {
      PasteImage(fullFilePath)
    }
  }else if(FileExist("C:\Users\Hunter\Box Sync\other\" folderFileLocation)) {
    davecodeUrl := "https://davecode.me/other/" folderFileLocation
    SendTextPreserveClipboard(davecodeUrl)
  }else if(ext = "txt") {
    FileRead, text, %fullFilePath%
    SendTextPreserveClipboard(text)
  }
}
