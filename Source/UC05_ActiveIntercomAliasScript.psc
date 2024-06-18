Scriptname UC05_ActiveIntercomAliasScript extends ReferenceAlias

bool SetStageOnActivate
int StageToSet

Event OnActivate(ObjectReference akActionRef)
    if SetStageOnActivate
        SetStageOnActivate = false
        GetOwningQuest().SetStage(StageToSet)
        StageToSet = -1
    endif

    (GetOwningQuest() as UC05_QuestScript).UpdateActiveIntercom(self)
EndEvent

Function UpdateStageToSet(int iStageToSet)
    StageToSet = iStageToSet
    SetStageOnActivate = true
EndFunction