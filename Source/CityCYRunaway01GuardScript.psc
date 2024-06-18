Scriptname CityCYRunaway01GuardScript extends ReferenceAlias

Int Property LobbyTriggerStage = 470 Const Auto

Bool bLoaded = False

;For Crime purposes, make the guards act as if the player had trespassed. 
;If the player somehow hasn't entered the Trigger and set the stage, try again until they have.
Function GuardAlarm()
    If GetOwningQuest().GetStageDone(LobbyTriggerStage)
        GetActorRef().SendTrespassAlarm(Game.GetPlayer())
    Else
        StartTimer(2)
    EndIf
EndFunction


Event OnLoad()
    If bLoaded == False
        GuardAlarm()
        bLoaded = True
    EndIf
EndEvent

Event OnTimer(Int aiTimerId)
    GuardAlarm()
EndEvent