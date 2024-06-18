Scriptname OutpostObjectOnObjectPlacedScript extends ObjectReference Const
{sets a global or quest stage when this object is placed (built)}

GlobalVariable property GlobalToSet auto const
{ optional: global to set when object is placed }

float property ValueToSet = 1.0 auto const
{ value to set GlobalToSet to }

Quest property QuestToSetStage auto Const
{ optional: quest to set a stage on when object is placed }

int property StageToSet = -1 auto const
{ stage to set on QuestToSetStage }

Event OnWorkshopObjectPlaced(ObjectReference akReference)
    if GlobalToSet && GlobalToSet.GetValue() != ValueToSet
        GlobalToSet.SetValue(ValueToSet)
    endif

    if QuestToSetStage && StageToSet > -1 && QuestToSetStage.GetStageDone(StageToSet) == false
        QuestToSetStage.SetStage(StageToSet)
    endif
EndEvent