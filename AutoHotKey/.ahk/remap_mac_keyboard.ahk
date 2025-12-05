#Requires AutoHotkey v2.0
#SingleInstance Force

; --- Swap Alt and Win keys ---
; Left side
LAlt::LWin
LWin::LAlt

; Right side
RAlt::RWin
RWin::RAlt

; --- Invert touchpad vertical scroll (up/down) ---
; This inverts all wheel input (mouse + touchpad)
WheelUp:: Send "{WheelDown}"
WheelDown:: Send "{WheelUp}"