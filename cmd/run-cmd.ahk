RunCmd(command) {
  Run, %ComSpec% /c "%command%",, Hide
}
RunCmdShow(command) {
  Run, %ComSpec% /c "%command%"
}
RunBashCmd(command) {
  Run, bash.exe -c "%command%",, Hide
}
