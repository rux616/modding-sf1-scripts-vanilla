Scriptname City_AkilaLife07_Script extends Quest

GlobalVariable Property AkilaLife06_DocPending Auto Const Mandatory

; If any of the trove documents are found - then process them
Function GotObject(int nStage)
    ; Flag the quest that a document can be turned in
    AkilaLife06_DocPending.SetValue(1.0)

    ; If you know about the quest, get an objective
    if ( GetStageDone(100) )
        SetObjectiveDisplayed(nStage)
    EndIf

    ; Set the stage - this case is for getting the books ahead of time
    ;   The stage will be called twice after the quest starts - but that doesn't hurt anything
    SetStage(nStage)
EndFunction