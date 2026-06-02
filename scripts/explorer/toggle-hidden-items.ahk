toggleHiddenItems() {
  VarSetCapacity(SHELLSTATE, 32, 0)
  DllCall("Shell32\SHGetSetSettings", "Ptr", &SHELLSTATE, "UInt", SSF_SHOWALLOBJECTS := 0x0001, "Int", false)
  NumPut(NumGet(SHELLSTATE) ^ (1 << 0), SHELLSTATE,, "Int")
  DllCall("Shell32\SHGetSetSettings", "Ptr", &SHELLSTATE, "UInt", SSF_SHOWALLOBJECTS, "Int", true)
  DllCall("Shell32\SHChangeNotify", "Int", SHCNE_ASSOCCHANGED := 0x8000000, "UInt", 0, "Ptr", 0, "Ptr", 0)
}
