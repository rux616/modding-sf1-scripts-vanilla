Scriptname UC08_QB_RadarSwitchAliasScript extends ReferenceAlias

int Property PrereqStage = 160 Const Auto
{Don't trigger this behavior unless this stage is set}

int Property ShutdownStage = 900 Const Auto
{If this stage has been set, the Queen's down and we don't need to do any more with this}

RefCollectionAlias Property SupportCollection Mandatory Const Auto
{The collection holding the support creatures spawned in by this switch}

RefCollectionAlias Property SupportMorphCollection Mandatory Const Auto
{The collection of morphs associated with this switch}

Event OnActivate(ObjectReference akActionRef)
    UC08_QueenBattle_QuestScript OQ = GetOwningQuest() as UC08_QueenBattle_QuestScript

    if OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(ShutdownStage)
        Clear()
        ObjectReference BroadcastREF = GetRef().GetLinkedRef()
        OQ.TriggerRadarBlast(BroadcastREF, SupportMorphCollection, SupportCollection)
    endif
EndEvent