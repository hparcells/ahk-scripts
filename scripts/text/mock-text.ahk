mockText(text) {
  textToMock := StrSplit(text, "")

  mocked := ""

  for i, character in textToMock
  {
    Random, random, 1, 2

    inputCharacter := textToMock[i]
    if(random = 1) {
      StringUpper, outputCharacter, inputCharacter
    }else {
      StringLower, outputCharacter, inputCharacter
    }
    mocked := mocked outputCharacter
  }

  return mocked
}
