ClapText(text) {
  WinGet, windowId, ID, A
  WinGetTitle, windowTitle, ahk_id %windowId%

  if(WinActive("ahk_exe Discord.exe")) {
    text := StrReplace(text, " ", " :clap: ")
    text := ":clap: " text " :clap:"
  }else {
    text := StrReplace(text, " ", " 👏 ")
    text := "👏 " text " 👏"
  }

  Return text
}
