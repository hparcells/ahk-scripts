; REQUIRES Gdip.ahk

pasteImage(filePath) {
  savedClipboard := ClipboardAll

  pToken := Gdip_Startup()
  
  Gdip_SetBitmapToClipboard(pBitmap := Gdip_CreateBitmapFromFile(filePath))
  Gdip_DisposeImage(pBitmap)
  Gdip_Shutdown(pToken)
  Send ^v

  Sleep 50
  Clipboard := savedClipboard
}
