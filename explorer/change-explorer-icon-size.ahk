; https://github.com/TaranVH/2nd-keyboard/blob/9ee39aaccf9c58df9c4a7c19eb7d12ab5223872c/Almost_All_Windows_Functions.ahk

changeExplorerIconSize() {
	explorerWindow := WinActive("ahk_class CabinetWClass")

	if(!explorerWindow) {
		return
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

		tippy2("Medium Icons")
	}else if (sFolder.CurrentViewMode == 1) {
		if(sFolder.IconSize == 256) {
			sFolder.CurrentViewMode := 4
	
			tippy2("Details")
		}else if (sFolder.IconSize == 48) {
			sFolder.IconSize := 96

			tippy2("Large Icons")
		}else {
			sFolder.IconSize := 256
			tippy2("Extra Large Icons")
		}
	}
	ObjRelease(windows)
}
