Scriptname ReturnUnityTriggerAliasScript extends ReferenceAlias

Int Property LeftUnityStage=300 Const Auto
Int Property ReturnUnityObjective = 120 Const Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    Actor PlayerREF = Game.GetPlayer()
    Quest myMQ305 = GetOwningQuest()
    
    If (akActionRef == PlayerREF) && (myMQ305.GetStageDone(LeftUnityStage))
        ;if we're returning to the Unity again after the first time through playthrough, reset objectives

        (myMQ305 as MQ305Script).LockPlayerControlsUnity()
        
        myMQ305.SetObjectiveCompleted(ReturnUnityObjective)

        ;turn the Unity scenes back on
        (GetOwningQuest() as MQ305Script).EnableUnityEndScenes()
    EndIf
EndEvent