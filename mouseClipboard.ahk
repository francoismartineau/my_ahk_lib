relMouseX1 :=
relMouseY1 :=

relMouseX2 :=
relMouseY2 :=


clipboardUtilities()
{
    if (WinActive("ahk_exe Photoshop.exe"))
    {
        setMouseCoordMode("Window")    
        setPixelCoordMode("Window")    
    }    
    MouseGetPos, x, y, hoveredWin
    WinGetClass, hoveredWinClass, ahk_id %hoveredWin%
    WinGetClass, activeWinClass, A
    PixelGetColor, col, %x%, %y%, RGB
    WinGetPos, winX, winY, winW, winH, ahk_id %hoveredWin%
    clipboard = %x%, %y%   %col%    Win: A: ahk_class %activeWinClass%   Mouse: ahk_class %hoveredWinClass% ahk_id %hoveredWin%  winXYWH:  %winX%, %winY%, %winW%, %winH%
    Sleep, 30
    msgTip(clipboard)
}

clipboardAddPixel()
{
    if (WinActive("ahk_exe Photoshop.exe"))
    {
        setMouseCoordMode("Window")    
        setPixelCoordMode("Window")    
    }
    MouseGetPos, x, y
    PixelGetColor, col, %x%, %y%, RGB
    clipboard := clipboard col ", "
    Sleep, 30
    msgTip(clipboard)
}

clipboardMultipleXY()
{
    if (WinActive("ahk_exe Photoshop.exe"))
        setMouseCoordMode("Window")
    MouseGetPos, x, y
    clipboard := clipboard x ", " y "     "
    Sleep, 30
    msgTip(clipboard)
}

clipboardColorMatches()
{
    if (WinActive("ahk_exe Photoshop.exe"))
    {
        setMouseCoordMode("Window")    
        setPixelCoordMode("Window")    
    }    
    MouseGetPos, x, y
    PixelGetColor, col, %x%, %y%, RGB
    clipboard = colorsMatch(%x%, %y%, [%col%])
    Sleep, 30
    msgTip(clipboard)
}


clipboardRelativeMouse()
{
    global relMouseX1, relMouseX2, relMouseY1, relMouseY2
    if (WinActive("ahk_exe Photoshop.exe"))
        setMouseCoordMode("Window")    
    relMouseX1 := relMouseX2
    relMouseY1 := relMouseY2
    
    MouseGetPos, x, y
    relMouseX2 := x
    relMouseY2 := y

    rx := relMouseX2 - relMouseX1
    ry := relMouseY2 - relMouseY1
    clipboard = MouseMove, %rx%, %ry% ,, R
    Sleep, 30
    msgTip(clipboard)
}
