Scriptname MQ305UnityFinalSceneTriggerScript extends ReferenceAlias

Scene Property MQ305_002_Unity_04 Mandatory Const Auto
GlobalVariable Property MQ305FinalSceneInt Mandatory Const Auto
Int Property iSceneNumber Mandatory Const Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    ;advance the final scene when the player enters
    If akActionREF == Game.GetPlayer()
        If MQ305_002_Unity_04.IsPlaying() == false
            MQ305_002_Unity_04.Start()
        EndIf
        MQ305FinalSceneInt.SetValueInt(iSceneNumber)
    EndIf
EndEvent