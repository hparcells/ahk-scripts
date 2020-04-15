ClapText(text) {
  text := StrReplace(text, " ", " :clap: ")
  text := ":clap: " text " :clap:"

  Return text
}
