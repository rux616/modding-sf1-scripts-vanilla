Scriptname UC09SceneTriggerAliasScript extends ReferenceAlias

int Property PreReqStage = 310 Auto Const
{Only check this trigger once this stage is set}

ReferenceAlias Property Abello Mandatory Const Auto
{Ref alias for President Abello}

Event OnTriggerEnter(ObjectReference akActionRef)
    Quest OQ = GetOwningQuest()
    Actor PlayACT = Game.GetPlayer()
    if OQ.GetStageDone(PreReqStage) && akActionRef == Game.GetPlayer()
        Abello.GetActorRef().Activate(PlayACT)
    endif 
EndEvent