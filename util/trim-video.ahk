; REQUIRES: cmd/run-cmd.ahk
; REQUIRES: ffmpeg

trimVideo() {
  FileSelectFile, filePath,, %A_Desktop%, Select media...
  FileSelectFile, outputPath,, %A_Desktop%, Select output...
  InputBox, start, Trim Video, Starting timestamp.,,200, 130
  InputBox, ending, Trim Video, Ending timestamp.,,200, 130

  command := "ffmpeg -y -t " . ending . " -i """ . filePath . """ -ss " . start . " """ . outputPath . """"

  RunCmdWait(command)

  MsgBox,, Trim Video, Done!
}
