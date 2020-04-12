StdOutToVar(command) {
    shell := ComObjCreate("WScript.Shell")
    exec := shell.Exec(ComSpec " /C " command)
    return exec.StdOut.ReadAll()
}
