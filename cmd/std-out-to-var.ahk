StdOutToVar(command) {
    DllCall("AllocConsole")
    console := DllCall("GetConsoleWindow")
    WinHide % "ahk_id " console

    shell := ComObjCreate("WScript.Shell")
    exec := shell.Exec(ComSpec " /C " command)

    result := exec.StdOut.ReadAll()

    DllCall("FreeConsole")

    return result
}
BashStdOutToVar(command) {
    DllCall("AllocConsole")
    console := DllCall("GetConsoleWindow")
    WinHide % "ahk_id " console
   
    shell := ComObjCreate("WScript.Shell")
    exec := shell.Exec("bash.exe -c """ command """")
    
    result := exec.StdOut.ReadAll()

    DllCall("FreeConsole")

    return result
}
