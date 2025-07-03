goToDesktop(desktop) {
  DllCall(GoToDesktopNumberProc, UInt, desktop)
  tippy2("Desktop " desktop + 1)
}

moveActiveToDesktop(desktop) {
  global MoveWindowToDesktopNumberProc, activeWindowByDesktop

  WinGet, activeHwnd, ID, A
  DllCall(MoveWindowToDesktopNumberProc, UInt, activeHwnd, UInt, desktop)

  tippy2("Moved to Desktop " desktop + 1, 1000)
}
