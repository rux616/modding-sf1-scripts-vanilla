Scriptname FloraOnHarvestScript extends ObjectReference Const
{set a global or quest stage when flora is harvested}

GlobalVariable property GlobalToSet auto const
{ optional: global to set when flora is harvested }

float property ValueToSet = 1.0 auto const
{ value to set GlobalToSet to }

Quest property QuestToSetStage auto Const
{ optional: quest to set a stage on when flora is harvested }

int property StageToSet = -1 auto const
{ stage to set on QuestToSetStage }

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        if GlobalToSet && GlobalToSet.GetValue() != ValueToSet
            GlobalToSet.SetValue(ValueToSet)
        endif

        if QuestToSetStage && StageToSet > -1 && QuestToSetStage.GetStageDone(StageToSet) == false
            QuestToSetStage.SetStage(StageToSet)
        endif
    endif
EndEvent