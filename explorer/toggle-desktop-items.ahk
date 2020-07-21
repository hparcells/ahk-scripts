toggleDesktopItems() {
  ControlGet, hwnd, Hwnd, , SysListView321, ahk_class Progman
  ControlSend, , {F5}, ahk_id %hwnd%
  If DllCall("IsWindowVisible", UInt,hwnd)
    WinHide, ahk_id %hwnd%
  Else
    WinShow, ahk_id %hwnd%
}
