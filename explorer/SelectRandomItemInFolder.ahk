SelectRandomItemInFolder(folder) {
  fileCount := ComObjCreate("Scripting.FileSystemObject").GetFolder(folder).Files.Count
  Random, random, 1, fileCount

  Loop, Files, % folder "\*"
  {
    if(A_Index = random) {
      Return A_LoopFileName
    }
  }
}
