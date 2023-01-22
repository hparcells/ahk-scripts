; https://github.com/rjmccallumbigl/SpotifyHotKeys.ahk/blob/main/spotifyHotkeys.ahk
getSpotifySong(currentPlayback) { 
  artistString := ""
  for index, element in currentPlayback.Track.artists {
    artistString .= ", " . currentPlayback.Track.artists[index].name
  }
  artistString := substr(artistString, 3)

	return artistString " - " currentPlayback.Track.Name
}
