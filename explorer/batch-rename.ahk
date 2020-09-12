#NoEnv
#NoTrayIcon

active_hwnd := WinActive("ahk_class CabinetWClass")
If (active_hwnd) {
    for window in ComObjCreate("Shell.Application").Windows
        If (active_hwnd == window.hwnd) {
            parent := uriDecode(StrReplace(window.LocationURL, "file:///", "", , 1))
            ShowGui()
        }
}

ShowGui() {
    global active_hwnd, parent, SourcePattern, TargetPattern, WindowListView
    Gui, Font, s10 q5, Segoe UI
    Gui, Margin, 6, 6
    Gui, +Owner%active_hwnd%
    Gui, Add, Text, , Search pattern:
    Gui, Add, Edit, r1 w300 vSourcePattern gInputChanged -Wantreturn X+6 Section
    Gui, Add, Text, X+6, Full regex is supported
    Gui, Add, Text, XM, Replacement:
    Gui, Add, Edit, r1 w300 vTargetPattern gInputChanged -Wantreturn XS YP
    Gui, Add, Text, X+6, Use $1, $2, ${10}, ${named}, $U1, $U{10}, $L2, $T0 etc.
    Gui, Add, Button, Default gDoRename XM w80, Apply
    Gui, Add, Button, gShowHelp X+6 w80, Help
    Gui, Add, ListView, Grid r12 w800 vWindowListView XM, Replacements|Current name|Renamed to

    imList := IL_Create(2)
    LV_SetImageList(imList)
    IL_Add(imList, "check.png", 0xFFFFFF, 1)
    IL_Add(imList, "error.png", 0xFFFFFF, 1)
    ; IL_Add(imList, "shell32.dll", 145)
    ; IL_Add(imList, "shell32.dll", 234)

    Gui, Show, , Rename with Regex: %parent%
}

InputChanged() {
    global parent, SourcePattern, TargetPattern
    GuiControlGet, SourcePattern
    GuiControlGet, TargetPattern
    LV_Delete()
    Loop, Files, %parent%\*, FD
    {
        toName := RegExReplace(A_LoopFileName, SourcePattern, TargetPattern, count)
        icon := 1
        If (A_LoopFileName == toName)
            icon := 3
        Else if (FileExist(parent . "/" . toName))
            icon := 2
        LV_Add("Icon" . icon, count, A_LoopFileName, toName)
    }
    LV_ModifyCol()
}

DoRename() {
    global parent, SourcePattern, TargetPattern
    Gui, Submit

    If (SourcePattern != "")
        Loop %parent%\* {
            toName := RegExReplace(A_LoopFileName, SourcePattern, TargetPattern)
            FileMove, %parent%\%A_LoopFileName%, %parent%\%toName%
        }

    GuiClose()
}

GuiEscape() {
    GuiClose()
}

GuiClose() {
    ExitApp
}

uriDecode(str) {
    Loop
        If RegExMatch(str, "i)(?<=%)[\da-f]{1,2}", hex)
            StringReplace, str, str, `%%hex%, % Chr("0x" . hex), All
        Else Break
    return, str
}

ShowHelp() {
    help=
    (
## Pattern:

The pattern to search for, which is a Perl-compatible regular expression (PCRE). The pattern's options (if any) must be included at the beginning of the string followed by a close-parenthesis. For example, the pattern "i)abc.*123" would turn on the case-insensitive option and search for "abc", followed by zero or more occurrences of any character, followed by "123". If there are no options, the ")" is optional; for example, ")abc" is equivalent to "abc".

## Replacement:

The string to be substituted for each match, which is plain text (not a regular expression). It may include backreferences like $1, which brings in the substring from Haystack that matched the first subpattern. The simplest backreferences are $0 through $9, where $0 is the substring that matched the entire pattern, $1 is the substring that matched the first subpattern, $2 is the second, and so on. For backreferences above 9 (and optionally those below 9), enclose the number in braces; e.g. ${10}, ${11}, and so on. For named subpatterns, enclose the name in braces; e.g. ${SubpatternName}. To specify a literal $, use $$ (this is the only character that needs such special treatment; backslashes are never needed to escape anything).

To convert the case of a subpattern, follow the $ with one of the following characters: U or u (uppercase), L or l (lowercase), T or t (title case, in which the first letter of each word is capitalized but all others are made lowercase). For example, both $U1 and $U{1} transcribe an uppercase version of the first subpattern.

Nonexistent backreferences and those that did not match anything in Haystack -- such as one of the subpatterns in "(abc)|(xyz)" -- are transcribed as empty strings.
)
MsgBox, %help%
}