createHangingIndent() {
  MouseGetPos x, y
  MouseMove, 0, 0

  SetKeyDelay, 200
  Send !o
  Send a
  Send {Up}
  Send {Enter}
  SetKeyDelay, 10
  Send {Tab 4}
  Send {Up 2}
  Send {Enter}
  Send {Tab}
  Send {Enter}

  MouseMove, x, y, 0
}
