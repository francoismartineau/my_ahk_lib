waitForModifierKeys()
{
    if (getKeyState("Ctrl", "D"))
        KeyWait, Ctrl
    if (getKeyState("Alt", "D"))
        KeyWait, Alt
    if (getKeyState("Shift", "D"))
        KeyWait, Shift
    if (getKeyState("LWin", "D"))
        KeyWait, LWin
}

waitKey(key)
{
    if (getKeyState(key, "D"))
        KeyWait, %key%    
}


; -- windows -------------------------------------------------------------------------------------
; Esc to stop waiting
; timeout := 0 for no timeout
global whileWaiting := False
stopWaitFunction()
{
    whileWaiting := False
}


waitNewWindow(currWinId, timeout := 3000, hint := False)
{
    WinGet, id , ID, A
    t1 := A_TickCount
    t2 := A_TickCount
    whileWaiting := True
    while (id == currWinId and (timeout == 0 or (t2 - t1 <= timeout)) and whileWaiting)
    {
        if (hint)
            toolTip("waiting for new window. Current: " id "    Esc to stop")
        Sleep, 10
        WinGet, id , ID, A
        t2 := A_TickCount
    }
    whileWaiting := False
    if (hint)
        toolTip()
    if (currWinId == id)
        id := ""
    return id
}


waitNewWindowTitled(title, currWinId, timeout := 3000, hint := False)
{
    t1 := A_TickCount
    t2 := t1
    WinGetTitle, resTitle, A
    whileWaiting := True
    while ((!InStr(resTitle, title) or id == currWinId) and (timeout == 0 or (t2 - t1 <= timeout)) and whileWaiting)
    {
        if (hint)
            toolTip("waiting for: " title "  current: " resTitle "    Esc to stop")
        Sleep, 10        
        WinGetTitle, resTitle, A
        WinGet, id , ID, A
        t2 := A_TickCount
    }
    whileWaiting := False
    if (hint)
        toolTip()
    if (InStr(resTitle, title))
        WinGet, id , ID, A
    else
        id := ""
    return id
}


waitNewWindowOfClass(class, currWinId, timeout := 3000, hint := False)
{
    t1 := A_TickCount
    t2 := t1
    WinGetClass, resClass, A
    whileWaiting := True
    while ((resClass != class or id == currWinId) and (timeout == 0 or (t2 - t1 <= timeout)) and whileWaiting)
    {
        if (hint)
            toolTip("waiting for: " class "  current: " resClass "    Esc to stop")
        Sleep, 10        
        WinGetClass, resClass, A
        WinGet, id , ID, A
        t2 := A_TickCount
    }
    whileWaiting := False
    if (hint)
        toolTip()
    if (resClass == class)
        WinGet, id , ID, A
    else
        id := ""
    return id
}

waitWindowNotOfClass(class, timeout := 3000, hint := False)
{
    t1 := A_TickCount
    t2 := t1
    WinGetClass, resClass, A
    whileWaiting := True
    while (resClass == class and (timeout == 0 or (t2 - t1 <= timeout)) and whileWaiting)
    {
        if (hint)
            toolTip("waiting for " resClass " to close.    Esc to stop")
        Sleep, 10        
        WinGetClass, resClass, A
        WinGet, id , ID, A
        t2 := A_TickCount
    }
    whileWaiting := False
    if (hint)
        toolTip()
    if (resClass != class)
        WinGet, id , ID, A
    else
        id := ""
    return id    
}


waitNewWindowOfProcess(exe, currWinId, timeout := 3000, hint := False)
{
    t1 := A_TickCount
    t2 := t1
    WinGet, resExe, ProcessName, A
    whileWaiting := True
    while ((!InStr(resExe, exe) or id == currWinId) and (timeout == 0 or (t2 - t1 <= timeout)) and whileWaiting)
    {
        if (hint)
            toolTip("waiting for: " exe "  current: " resExe "    Esc to stop")
        Sleep, 10   
        WinGet, resExe, ProcessName, A
        WinGet, id , ID, A
        t2 := A_TickCount
    }
    whileWaiting := False
    if (hint)
        toolTip()
    if (resExe == exe)
        WinGet, id , ID, A
    else
        id := ""
    return id
}
