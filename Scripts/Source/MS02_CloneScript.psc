Scriptname MS02_CloneScript extends Actor Const

Quest Property MS02 Auto Const Mandatory

Event OnCellLoad()

    ; This is the "everyone dies" decision in MS02
    if ( MS02.GetStageDone(1920) )
        SetEssential(FALSE)
        SetProtected(FALSE)
        KillSilent()
    EndIf

EndEvent