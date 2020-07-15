# AHK Scripts
> A collection of useful AHK scripts.

***Some of these scripts are not made by me.***

## My Scripts
**Chrome**
- **OpenOrFocus.ahk**: Opens a new chrome tab or focuses it if it exists.
  - **REQUIRES**: [chromix-too](https://www.npmjs.com/package/chromix-too)
  - **REQUIRES**: StdOutToVar.ahk
  - **REQUIRES**: RunCmd.ahk

**cmd**
- **RunCmd.ahk**: Provides `RunCmd()` or `RunBashCmd()`.
- **StdOutToVar.ahk**: Runs a console command and returns the output.

**Discord**
- **NavigateDiscord.ahk**: Navigates to a Discord channel or DM using its quick switcher.
  - **REQUIRES**: SendTextPreserveClipboard.ahk
- **AddDiscordReaction**: Adds a Discord reaction to the latest sent message in the channel.
- **SendLatestDiscordMessage.ahk**: Pastes the latest discord message in the channel.
  - **REQUIRES**: This requires Better Discord to be installed with the Message Utilities plugin.

**Explorer**
- **PasteImage.ahk**: Pastes an image from a file path.
  - **REQUIRES**: Gdip.ahk
- **SelectRandomItemInFolder.ahk**: Selects a random file from a folder and returns its file name.
  - Probably not the most efficient code, takes around 1.5 seconds or less on a folder with 5,700 files (for me).

**Game**
- **GoogleCrossword.ahk**: Instantly solve the crossword at https://www.google.com/logos/2013/crossword/crossword13.html.

**Text**
- **SendTextPreserveClipboard.ahk**: Sends text all at once while preserving your clipboard.
  - **WARNING**: Seems to paste your clipboard when sent in quick succession sometimes.
- **GenRandomEmojiString.ahk**: Generates a random string of emojis from the passed array of unicode emojis. Adjust length in the actual script. Could be adapted to generate a random string of other things as well.
- **ClapText.ahk**: Puts the clapping emoji between every word along with at the beginning and end.
  - Made for Discord, but might work other places too.
  - Claps your clipboard contents if nothing is available to select.
- **MockText.ahk**: COnveRTS TO mocKiNg casE.
- **SpaceText.ahk**: O h   y e a h   s p a c e .

**Util**
- **GetColorAtCursor.ahk**: Gets the color under the cursor in #RRGGBB format.
- **Calc.ahk**: Does math.
  - **REQUIRES**: apcalc

**Usable By Me Only** (*might be able to use, probably not*)
- **SendOther.ahk**: Sends a URL or pastes an image from a file path if it is in the other archive.
  - **REQUIRES**: SendTextPreserveClipboard.ahk
  - **REQUIRES**: PasteImage.ahk

## Others' Included
- **explorer/ChangeExplorerView.ahk** from TaranVH: https://github.com/TaranVH/2nd-keyboard/blob/master/Almost_All_Windows_Functions.ahk
- **explorer/BatchRename.ahk** from Shrikant: https://sharats.me/posts/the-magic-of-autohotkey-2
- **explorer/CreateFolderHierarchy.ahk** from Shrikant: https://sharats.me/posts/the-magic-of-autohotkey-2
- **explorer/SelectByRegEx.ahk** from Shrikant: https://sharats.me/posts/the-magic-of-autohotkey-2
- **explorer/Explorer.ahk** from Rapte_Of_Suzaku: https://autohotkey.com/board/topic/-60985-get-paths-of-selected-items-in-an-explorer-window/
- **explorer/UnzipLatest.ahk** by u/detectretract: https://www.reddit.com/r/AutoHotkey/comments/6apkou/extract_last_downloaded_file_with_7z_ahk/
- **lib/Gdip.ahk** from tariqporter: https://github.com/tariqporter/Gdip
- **lib/VirtualDesktopAccessor.dll** by Ciantic: https://github.com/Ciantic/VirtualDesktopAccessor
- **random/RandomDate.ahk** by Gogo: https://autohotkey.com/board/topic/81996-random-date-function/?p=521171
- **util/Clipboard.ahk** from r2997790: https://www.autohotkey.com/boards/viewtopic.php?t=31473
- **util/Tippy2.ahk** from TaranVH: https://github.com/TaranVH/2nd-keyboard/blob/master/Almost_All_Windows_Functions.ahk
- **util/BrightnessSetter.ahk** from qwerty12: https://gist.github.com/qwerty12/4b3f41eb61724cd9e8f2bb5cc15c33c2
