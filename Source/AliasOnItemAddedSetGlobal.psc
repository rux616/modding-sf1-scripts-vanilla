Scriptname AliasOnItemAddedSetGlobal extends ReferenceAlias
{set a global or quest stage when item is added}

GlobalVariable property GlobalToSet auto const
{ optional: global to set when flora is harvested }

float property ValueToSet = 1.0 auto const
{ value to set GlobalToSet to }

Quest property QuestToSetStage auto Const
{ optional: quest to set a stage on when flora is harvested }

int property StageToSet = -1 auto const
{ stage to set on QuestToSetStage }

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
        if GlobalToSet && GlobalToSet.GetValue() != ValueToSet
            GlobalToSet.SetValue(ValueToSet)
        endif

        if QuestToSetStage && StageToSet > -1 && QuestToSetStage.GetStageDone(StageToSet) == false
            QuestToSetStage.SetStage(StageToSet)
        endif
EndEvent
FormList Property UniqueResourcesOrganicList Auto Const Mandatory
