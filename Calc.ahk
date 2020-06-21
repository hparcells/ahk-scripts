; REQUIRES: apcalc

Calc(expression) {
    StringReplace, expression, expression, %A_Space%,, All

		answer := BashStdOutToVar("calc '" expression "' | tr -d '[:space:]'")

    Return answer
}
