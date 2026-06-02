spaceText(text) {
  spacedWord := ""

  For i, character In StrSplit(text)
    spacedWord .= " " . character

  spacedWord := LTrim(spacedWord)

  return spacedWord
}
