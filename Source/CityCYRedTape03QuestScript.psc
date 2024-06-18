Scriptname CityCYRedTape03QuestScript extends Quest

Int Property PlayerInJailTriggerStage = 885 Const Auto
Int Property JailCellDoorClosedStage = 887 Const Auto
ReferenceAlias Property JailDoor Mandatory Const Auto
ReferenceAlias Property JailTrigger Mandatory Const Auto

;Try to close the jail cell door if the player is not inside. Otherwise, close it when the player leaves the volume (via DefaultaliasOnTriggerLeave on the JailTrigger alias).
;If the player is still somehow in the trigger when it tries to close, then start a timer and keep trying until the player is no longer in the trigger.
Function CloseJailCell()
    If GetStageDone(JailCellDoorClosedStage) == False
        If JailTrigger.GetRef().IsInTrigger(Game.GetPlayer()) == False
            ObjectReference myDoor = JailDoor.GetRef()
            myDoor.SetOpen(False)
            myDoor.SetDoorInaccessible(True)
            SetStage(JailCellDoorClosedStage)
        ElseIf GetStageDone(PlayerInJailTriggerStage) == False
            SetStage(PlayerInJailTriggerStage)
        Else
            StartTimer(3)
        EndIf
    EndIf
EndFunction

Event OnTimer(int aiTimerID)
    CloseJailCell()
EndEvent