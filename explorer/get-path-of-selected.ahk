; https://www.autohotkey.com/boards/viewtopic.php?style=17&t=60403

getPathOfSelected() {
   WinGetClass, winClass, % "ahk_id" . hWnd := WinExist("A")
   if (winClass ~= "Progman|WorkerW")
      oShellFolderView := GetDesktopIShellFolderViewDual()
   else if (winClass ~= "(Cabinet|Explore)WClass") {
      for window in ComObjCreate("Shell.Application").Windows
         if (hWnd = window.HWND) && (oShellFolderView := window.document)
            break
   }
   else
      Return
   
   for item in oShellFolderView.SelectedItems
      result .= (result = "" ? "" : "`n") . item.path
   if !result
      result := oShellFolderView.Folder.Self.Path
   Return result
}

GetDesktopIShellFolderViewDual()
{
    IShellWindows := ComObjCreate("{9BA05972-F6A8-11CF-A442-00A0C90A8F39}")
    desktop := IShellWindows.Item(ComObj(19, 8)) ; VT_UI4, SCW_DESKTOP                
   
    ; Retrieve top-level browser object.
    if ptlb := ComObjQuery(desktop
        , "{4C96BE40-915C-11CF-99D3-00AA004AE837}"  ; SID_STopLevelBrowser
        , "{000214E2-0000-0000-C000-000000000046}") ; IID_IShellBrowser
    {
        ; IShellBrowser.QueryActiveShellView -> IShellView
        if DllCall(NumGet(NumGet(ptlb+0)+15*A_PtrSize), "ptr", ptlb, "ptr*", psv) = 0
        {
            ; Define IID_IDispatch.
            VarSetCapacity(IID_IDispatch, 16)
            NumPut(0x46000000000000C0, NumPut(0x20400, IID_IDispatch, "int64"), "int64")
           
            ; IShellView.GetItemObject -> IDispatch (object which implements IShellFolderViewDual)
            DllCall(NumGet(NumGet(psv+0)+15*A_PtrSize), "ptr", psv
                , "uint", 0, "ptr", &IID_IDispatch, "ptr*", pdisp)
           
            IShellFolderViewDual := ComObjEnwrap(pdisp)
            ObjRelease(psv)
        }
        ObjRelease(ptlb)
    }
    return IShellFolderViewDual
}