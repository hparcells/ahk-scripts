runCmd(command) {
  Run, %ComSpec% /c "%command%",, Hide
}
runCmdWait(command) {
  RunWait, %ComSpec% /c "%command%",, Hide
}
runBashCmd(command) {
  Run, bash.exe -c "%command%",, Hide
}
runBashCmdWait(command) {
  RunWait, bash.exe -c "%command%",, Hide
}
