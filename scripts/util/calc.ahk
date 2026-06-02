; REQUIRES: apcalc
; sudo apt get apcalc

calc(expression) {
  StringReplace, expression, expression, %A_Space%,, All

  answer := bashStdOutToVar("calc '" expression "' | tr -d '[:space:]'")

  return answer
}
