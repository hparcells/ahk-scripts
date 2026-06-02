cloneRow() {
  MouseGetPos x, y
  MouseMove, 0, 0

  SetKeyDelay, 100
  Send ^{Left}
  Send +{Space}
  Send ^c
  Send !i
  Send b
  Send ^v
  SetKeyDelay, 10

  MouseMove, x, y, 0
}