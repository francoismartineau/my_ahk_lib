#If True  ; WinActive("ahk_exe FL64.exe") or WinActive("ahk_exe Melodyne singletrack.exe") or WinActive("ahk_exe audacity.exe")
^!v UP::
    clipboardUtilities()
    return

^!c UP::
    clipboardAddPixel()
    return


^!x UP::
    clipboardMultipleXY()
    return

^!+x UP::
    clipboard := ";"
    return

^!+z UP::
    clipboardColorMatches()
    return

^!r UP::
    clipboardRelativeMouse()
    return
#If