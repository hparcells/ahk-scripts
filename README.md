# AHK Scripts
> A collection of useful AHK scripts.

***Some of these scripts are not made by me.***

## My Scripts
- **OpenOrFocus.ahk**: Opens a new chrome tab or focuses it if it exists.
  - **REQUIRES**: [chromix-too](https://www.npmjs.com/package/chromix-too)
  - **REQUIRES**: StdOutToVar.ahk
  - **REQUIRES**: RunCmd.ahk
- **SendTextPreserveClipboard.ahk**: Sends text all at once while preserving your clipboard.
  - **WARNING**: Seems to paste your clipboard when sent in quick succession sometimes.
- **StdOutToVar.ahk**: Runs a console command and returns the output.
- **SelectRandomItemInFolder.ahk**: Selects a random file from a folder and returns its file name.
  - Probably not the most efficient code, takes around 1.5 seconds or less on a folder with 5,700 files (for me).
- **RunCmd.ahk**: Provides `RunCmd()` or `RunBashCmd()`.
- **GetColorAtCursor.ahk**: Gets the color under the cursor in #RRGGBB format.

**Discord**
- **NavigateDiscord.ahk**: Navigates to a Discord channel or DM using its quick switcher.
  - **REQUIRES**: SendTextPreserveClipboard.ahk
- **AddDiscordReaction**: Adds a Discord reaction to the latest sent message in the channel.

**Yes**
- **GenRandomEmojiString.ahk**: Generates a random string of emojis from the passed array of unicode emojis. Adjust length in the actual script. Could be adapted to generate a random string of other things as well.
- **ClapText.ahk**: Puts the clapping emoji between every word along with at the beginning and end.
  - Made for Discord, but might work other places too.
  - Claps your clipboard contents if nothing is available to select.
- **MockText.ahk**: COnveRTS TO mocKiNg casE.
- **SpaceText.ahk**: O h   y e a h   s p a c e .

## Others' Included
- **Tippy2.ahk** and **ChangeExplorerView.ahk** from TaranVH: https://github.com/TaranVH/2nd-keyboard/blob/master/Almost_All_Windows_Functions.ahk
- **BrightnessSetter.ahk** from qwerty12: https://gist.github.com/qwerty12/4b3f41eb61724cd9e8f2bb5cc15c33c2
- **Gdip.ahk** from tariqporter: https://github.com/tariqporter/Gdip
- **Clipboard.ahk** from r2997790: https://www.autohotkey.com/boards/viewtopic.php?t=31473
- **CreateFolderHierarchy.ahk** and SelectByRegEx from Shrikant: https://sharats.me/posts/-the-magic-of-autohotkey-2/
- **Explorer.ahk** from Rapte_Of_Suzaku: https://autohotkey.com/board/topic/-60985-get-paths-of-selected-items-in-an-explorer-window/
- **UnzipLatest.ahk** by u/detectretract: https://www.reddit.com/r/AutoHotkey/comments/6apkou/extract_last_downloaded_file_with_7z_ahk/
