; THIS FILE IS RUN ON MY SYSTEM STARTUP AND IS TAILORED TO MY PERSONAL SETUP.

; Switch to Desktop 6.
hVirtualDesktopAccessor := DllCall("LoadLibrary", Str, "lib/virtual-desktop-accessor.dll", "Ptr") 
GoToDesktopNumberProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "GoToDesktopNumber", "Ptr")
DllCall(GoToDesktopNumberProc, UInt, 5)

; Start Intercept.
Run, "C:\2nd Keyboard\intercept\intercept.exe", C:\2nd Keyboard\intercept
Sleep 100
Send y

; Start chromix-too-server.
Run, chromix-too-server

; Run the main AHK file.
Run, "C:\2nd Keyboard\main.ahk", C:\2nd Keyboard

; Switch to Desktop 4.
DllCall(GoToDesktopNumberProc, UInt, 3)
