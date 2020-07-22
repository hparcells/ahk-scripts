StdOutToVar(command) {
  shell := ComObjCreate("WScript.Shell")
  exec := shell.Exec(ComSpec " /C " command)

  result := exec.StdOut.ReadAll()

  return result
}
BashStdOutToVar(command) {   
  shell := ComObjCreate("WScript.Shell")
  exec := shell.Exec("bash.exe -c """ command """")

  result := exec.StdOut.ReadAll()

  return result
}
