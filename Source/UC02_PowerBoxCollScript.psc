Scriptname UC02_PowerBoxCollScript extends RefCollectionAlias

int Property ShutdownStage = 650 Const Auto
{If this stage has been set, ignore the additional pulls}

int Property TerrormorphDeadStage = 700 Const Auto
{If this stage has been set, ignore the additional pulls}

int Property PrereqStage = 601 Const Auto
{Only start pulling ref's out of this collection once the prereq stage has been set}

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
    UC02_QuestScript OQ = GetOwningQuest() as UC02_QuestScript

    if OQ.GetStageDone(PrereqStage)
        RemoveRef(akSenderRef)

        if !OQ.GetStageDone(ShutdownStage) && !OQ.GetStageDone(TerrormorphDeadStage)
            OQ.UpdatePowerBoxCount(akSenderRef, self) 
        endif
    endif
EndEvent
