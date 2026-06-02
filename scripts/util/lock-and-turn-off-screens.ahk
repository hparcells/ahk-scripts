lockAndTurnOffScreens() {
  Sleep, 200
  DllCall("LockWorkStation")
  Sleep, 200
  SendMessage, 0x112, 0xF170, 2,, Program Manager
}
