#Requires AutoHotkey v2.0
#SingleInstance Force

; Swap Alt / Win (Mac-like)
LAlt::LWin
LWin::LAlt
RAlt::RWin
RWin::RAlt

; Swap vertical wheel
WheelUp:: Send "{WheelDown}"
WheelDown:: Send "{WheelUp}"

; Swap horizontal wheel
WheelLeft:: Send "{WheelRight}"
WheelRight:: Send "{WheelLeft}"