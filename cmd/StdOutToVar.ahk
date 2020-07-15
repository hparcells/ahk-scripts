StdOutToVar(command) {
    shell := ComObjCreate("WScript.Shell")
    exec := shell.Exec(ComSpec " /C " command)
    return exec.StdOut.ReadAll()
}
BashStdOutToVar(command) {
    shell := ComObjCreate("WScript.Shell")
    exec := shell.Exec("bash.exe -c """ command """")
    return exec.StdOut.ReadAll()
}
