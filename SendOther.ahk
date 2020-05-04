; REQUIRES SendTextPreserveClipboard.ahk
; REQUIRES PasteImage.ahk

SendOther(fullFilePath) {
  RegExMatch(fullFilePath, "(.*)\\.*\\.*$", otherFolderFolder)
  SplitPath, fullFilePath,,, ext

  folderFileLocation := StrReplace(SubStr(fullFilePath, StrLen(otherFolderFolder1) + 2), "\", "/")

  if(ext = "png" || ext = "jpg" || ext = "jpeg" || ext = "webm") {
    PasteImage(fullFilePath)
  }else if(ext = "mp3" || ext = "wav") {
    ; Audio File
    ; TODO: Drag and drop file into Discord.
    if(FileExist("C:\Users\Hunter\Dropbox\" folderFileLocation)) {
      davecodeUrl := "https://davecode.me/other/" folderFileLocation
      davecodeUrl := StrReplace(davecodeUrl, "/other/other/", "/other/")
      SendTextPreserveClipboard(davecodeUrl)
    }
  }else if(FileExist("C:\Users\Hunter\Dropbox\" folderFileLocation)) {
    davecodeUrl := "https://davecode.me/other/" folderFileLocation
    davecodeUrl := StrReplace(davecodeUrl, "/other/other/", "/other/")
    SendTextPreserveClipboard(davecodeUrl)
  }
}
