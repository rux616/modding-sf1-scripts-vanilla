Scriptname City_AkilaLife04_Script extends Quest

; Wait 24 hours to progress quest
Function Wait24()
    Debug.Trace("Akila04 - 24 hour timer kicked off")
    StartTimerGameTime(24, 1)
EndFunction

Event OnTimerGameTime(int aiTimerID)
    Debug.Trace("Akila04 timer check")
    If aiTimerID == 1
        Debug.Trace("Akila04 - 24 hour timer has fired")
        SetStage(StageToSet)

        ; Is the player in the Stoneroot Inn already?
        if ( KateFoley.GetRef().Is3DLoaded() )
            SetStage(350)   ; If so progress with their scene immediately
        endif
    EndIf
EndEvent

Int Property StageToSet Auto Const
ReferenceAlias Property KateFoley Auto Const Mandatory
