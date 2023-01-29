; REQUIRES: cmd/run-cmd.ahk
; REQUIRES: ffmpeg

trimVideo() {
  FileSelectFile, filePath,, %A_Desktop%, Select media...
  if(!filePath) {
    return
  }
  FileSelectFile, outputPath,, %A_Desktop%, Select output...
  if(!outputPath) {
    return
  }
  InputBox, start, Trim Video, Starting timestamp.,,200, 130
  if(!start) {
    return
  }
  InputBox, ending, Trim Video, Ending timestamp.,,200, 130
  if(!ending) {
    return
  }

  command := "ffmpeg -y -t " . ending . " -i """ . filePath . """ -ss " . start . " """ . outputPath . """"

  runCmdWait(command)

  MsgBox,, Trim Video, Done!
}
