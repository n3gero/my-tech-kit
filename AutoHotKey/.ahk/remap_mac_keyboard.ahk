#Requires AutoHotkey v2.0

LAlt::LWin
LWin::LAlt
RAlt::RWin
RWin::RAlt

WheelUp:: Send "{WheelDown}"
WheelDown:: Send "{WheelUp}"