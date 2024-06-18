Scriptname RI05_OnTriggerEnterRefCollScript extends RefCollectionAlias

Int Property StageToSet Auto Const Mandatory
Int Property PreReqStage Auto Const Mandatory
MagicEffect Property ArtifactPowerVoidForm_Effect Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)

    Actor PlayerRef = Game.GetPlayer()

    If akActionRef == PlayerRef && !PlayerRef.HasMagicEffect(ArtifactPowerVoidForm_Effect) 
        Quest OwningQuest = GetOwningQuest()
        If OwningQuest.GetStageDone(PreReqStage)
            OwningQuest.SetStage(StageToSet)  
        EndIf  
    EndIf
EndEvent