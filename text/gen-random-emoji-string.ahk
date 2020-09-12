genRandomEmojiString(emojis) {
  Random, length, 3, 7
  string := ""

  Loop %length%
  {
    Random, emoji, 1, emojis.MaxIndex()

    string := string emojis[emoji]
  }

  return string
}
