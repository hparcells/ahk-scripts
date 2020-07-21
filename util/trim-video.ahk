; REQUIRES: cmd/run-cmd.ahk
; REQUIRES: ffmpeg

trimVideo() {
  InputBox, filePath, Trim Video, File path of video to trim.,,200, 130
  InputBox, outputName, Trim Video, Output name.,,200, 130
  InputBox, start, Trim Video, Starting timestamp.,,200, 130
  InputBox, ending, Trim Video, Ending timestamp.,,200, 130

  SplitPath, filePath,, dir
  outputPath := dir . "\" . outputName

  command := "ffmpeg -t " . ending . " -i " . filePath . " -ss " . start . " " . outputPath

  RunCmdShow(command)
}
