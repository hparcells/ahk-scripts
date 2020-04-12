; https://github.com/TaranVH/2nd-keyboard/blob/9ee39aaccf9c58df9c4a7c19eb7d12ab5223872c/Almost_All_Windows_Functions.ahk

ChangeExplorerView(explorerWindow) {
	if(!explorerWindow) {
		Return
	}

	windows := ComObjCreate("Shell.Application").Windows

	for window in windows {
		if(window.hWnd == explorerWindow) {
			sFolder := window.Document
		}
	}

	if(sFolder.CurrentViewMode == 4) {
		sFolder.CurrentViewMode := 1 ;
		sFolder.IconSize := 48

		Tippy2("Medium Icons")
	}else if (sFolder.CurrentViewMode == 1) {
		if(sFolder.IconSize == 256) {
			sFolder.CurrentViewMode := 4
	
			Tippy2("Details")
		}else if (sFolder.IconSize == 48) {
			sFolder.IconSize := 96

			Tippy2("Large Icons")
		}else {
			sFolder.IconSize := 256
			Tippy2("Extra Large Icons")
		}
	}
	ObjRelease(windows)
}
