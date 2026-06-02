addDiscordReaction(emoji) {
	if(getKeyState("Alt", "P")) {
		Send {Alt up}
	}
	Send {NumpadAdd}:%emoji%:{Enter}
}
