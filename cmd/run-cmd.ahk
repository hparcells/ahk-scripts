RunCmd(command) {
  Run, %ComSpec% /c "%command%",, Hide
}
RunCmdWait(command) {
  RunWait, %ComSpec% /c "%command%",, Hide
}
RunBashCmd(command) {
  Run, bash.exe -c "%command%",, Hide
}
RunBashCmdWait(command) {
  RunWait, bash.exe -c "%command%",, Hide
}
