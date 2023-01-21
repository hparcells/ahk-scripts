; https://www.reddit.com/r/AutoHotkey/comments/6apkou/extract_last_downloaded_file_with_7z_ahk/
; REQUIRES 7-Zip
; Change the path on line 6 to your browser's default download folder.

unzipLatest() {
	Folder:="C:\Users\Hunter\Downloads"
	 Loop, %Folder%\* {
		 FileGetTime, Time, %A_LoopFileFullPath%, C
		 if(Time > Time_Orig) {
			  Time_Orig := Time
			  File := A_LoopFileName
		 }
	}
	FullPath=%Folder%\%File%
	SplitPath, File, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
	ExtractedPath=%Folder%\%OutNameNoExt%
	RunWait, 7z x "%FullPath%" -o"%ExtractedPath%", C:\Users\Hunter\Desktop, Hide
	Run, explorer `"%ExtractedPath%`"
}
