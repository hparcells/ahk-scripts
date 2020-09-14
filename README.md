# AHK Scripts
> A collection of useful AHK scripts.

***Some of these scripts are not made by me.***

## My Scripts
**Chrome**
- **open-or-focus.ahk**: Opens a new chrome tab or focuses it if it exists.
  - **REQUIRES**: [chromix-too](https://www.npmjs.com/package/chromix-too)
  - **REQUIRES**: cmd/std-out-to-var.ahk
  - **REQUIRES**: cmd/run-cmd.ahk

**cmd**
- **run-cmd.ahk**: Provides `runCmd()` or `runBashCmd()`.
- **std-out-to-var.ahk**: Runs a console command and returns the output.

**Discord**
- **navigate-discord.ahk**: Navigates to a Discord channel or DM using its quick switcher.
  - **REQUIRES**: SendTextPreserveClipboard.ahk
- **add-discord-reaction**: Adds a Discord reaction to the latest sent message in the channel.
- **send-latest-discord-message.ahk**: Pastes the latest discord message in the channel.
  - **REQUIRES**: This requires Better Discord to be installed with the Message Utilities plugin.

**Explorer**
- **paste-image.ahk**: Pastes an image from a file path.
  - **REQUIRES**: lib/gdip.ahk
- **select-random-item-in-folder.ahk**: Selects a random file from a folder and returns its file name.
  - Probably not the most efficient code, takes around 1.5 seconds or less on a folder with 5,700 files (for me).

**Game**
- **google-crossword.ahk**: Instantly solve the crossword at https://www.google.com/logos/2013/crossword/crossword13.html.

**Google Suite**
- **docs-hanging-indent.ahk**: Creates a hanging indent with the highlighted paragraphs.
- **docs-clone-row.ahk**: Clones the row of the selected cell.
- **gsuite-new.ahk**: Create new items from anywhere.

**Random**
- **random-uuid.ahk**: Generates a random UUID.
- **random-color.ahk**: Generates a random color in #rrggbb format.

**Text**
- **send-text-preserve-clipboard.ahk**: Sends text all at once while preserving your clipboard.
  - **WARNING**: Seems to paste your clipboard when sent in quick succession sometimes.
- **gen-random-emoji-string.ahk**: Generates a random string of emojis from the passed array of unicode emojis. Adjust length in the actual script. Could be adapted to generate a random string of other things as well.
- **clap-text.ahk**: Puts the clapping emoji between every word along with at the beginning and end.
  - Made for Discord, but might work other places too.
  - Claps your clipboard contents if nothing is available to select.
- **mock-text.ahk**: COnveRTS TO mocKiNg casE.
- **space-text.ahk**: O h   y e a h   s p a c e .

**Util**
- **get-color-at-cursor.ahk**: Gets the color under the cursor in #RRGGBB format.
- **calc.ahk**: Does math.
  - **REQUIRES**: apcalc
  - **REQUIRES**: cmd/run-cmd.ahk
- **trim-video.ahk**: Trims video, given a starting timestamp and an ending timestamp.
  - **REQUIRES**: cmd/run-cmd.ahk
  - **REQUIRES**: ffmpeg

**Usable By Me Only** (*might be able to use, probably not*)
- **send-other.ahk**: Sends a URL or pastes an image from a file path if it is in the other archive.
  - **REQUIRES**: text/send-text-preserve-clipboard.ahk
  - **REQUIRES**: explorer/paste-image.ahk

## Others' Included
- **explorer/change-explorer-view.ahk** from TaranVH: https://github.com/TaranVH/2nd-keyboard/blob/master/Almost_All_Windows_Functions.ahk
- **explorer/batch-rename.ahk** from Shrikant: https://sharats.me/posts/the-magic-of-autohotkey-2
- **explorer/create-folder-hierarchy.ahk** from Shrikant: https://sharats.me/posts/the-magic-of-autohotkey-2
- **explorer/select-by-regex.ahk** from Shrikant: https://sharats.me/posts/the-magic-of-autohotkey-2
- **explorer/explorer.ahk** from Rapte_Of_Suzaku: https://autohotkey.com/board/topic/-60985-get-paths-of-selected-items-in-an-explorer-window/
- **explorer/unzip-latest.ahk** by u/detectretract: https://www.reddit.com/r/AutoHotkey/comments/6apkou/extract_last_downloaded_file_with_7z_ahk/
- **explorer/toggle-hidden-items.ahk** by u/yet_another_usr: https://www.reddit.com/r/AutoHotkey/comments/4w31kq/toggle_hidden_filesdir_on_off/d6677kk
- **explorer/toggle-desktop-items.ahk** by hachi: https:////autohotkey.com/board/topic/99089-showhide-desktop-icons-shortcut-unreliable/?p=622531
- **explorer/get-path-of-selected.ahk** by teadrinker: https://www.autohotkey.com/boards/viewtopic.php?style=17&t=60403
- **lib/gdip.ahk** from tariqporter: https://github.com/tariqporter/Gdip
- **lib/virtual-desktop-accessor.dll** by Ciantic: https://github.com/Ciantic/VirtualDesktopAccessor
- **random/random-date.ahk** by Gogo: https://autohotkey.com/board/topic/81996-random-date-function/?p=521171
- **util/clipboard.ahk** from r2997790: https://www.autohotkey.com/boards/viewtopic.php?t=31473
- **util/tippy2.ahk** from TaranVH: https://github.com/TaranVH/2nd-keyboard/blob/master/Almost_All_Windows_Functions.ahk
- **util/brightness-setter.ahk** from qwerty12: https://gist.github.com/qwerty12/4b3f41eb61724cd9e8f2bb5cc15c33c2
- **util/lock-and-turn-off-screens.ahk** from BigVent: https:////autohotkey.com/board/topic/42559-lock-computer-and-turn-off-monitor/?p=265416
