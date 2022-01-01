
global premiereProScalePosX := 400
global premiereProScalePosY := 181


startScaling()
{
    moveMouse(400, 235)
    Send {LButton Down}
    MouseMove, 100, 0, 0, R
    MouseMove, -100, 0, 0, R
}