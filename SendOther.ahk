; REQUIRES SendTextPreserveClipboard.ahk
; REQUIRES PasteImage.ahk

SendOther(fullFilePath) {
  RegExMatch(fullFilePath, "(.*)\\.*\\.*$", otherFolderFolder)

  folderFileLocation := StrReplace(SubStr(fullFilePath, StrLen(otherFolderFolder1) + 2), "\", "/")

  if(FileExist("C:\Users\Hunter\Dropbox\" folderFileLocation)) {
    davecodeUrl := "https://davecode.me/other/" folderFileLocation
    davecodeUrl := StrReplace(davecodeUrl, "/other/other/", "/other/")
    SendTextPreserveClipboard(davecodeUrl)
  }else {
    PasteImage(fullFilePath)
  }
}
