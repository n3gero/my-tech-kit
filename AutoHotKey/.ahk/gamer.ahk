#HotIf WinActive("VALORANT")

!Enter::Return

#HotIf WinActive("METAL GEAR SOLID V: THE PHANTOM PAIN")

;!Tab:: Send "{Tab}"

;!Space:: Send " "  ;

XButton1:: {
    Send("{9 down}")
    KeyWait("XButton1")
    Send("{9 up}")
    return
}

XButton2:: {
    Send("{0 down}")
    KeyWait("XButton2")
    Send("{0 up}")
    return
}

#HotIf WinActive("Plague Inc Evolved")

XButton1:: SendInput "{Space}"

#HotIf WinActive("Slay the Spire")

XButton1:: SendInput "{e}"

;#HotIf WinActive("Kingdom Come: Deliverance")

#HotIf