RunCmd(command) {
  Run, %ComSpec% /c "%command%",, Hide
}
RunBashCmd(command) {
  Run, bash.exe -c "%command%",, Hide
}
