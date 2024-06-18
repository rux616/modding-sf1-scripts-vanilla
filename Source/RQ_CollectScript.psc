Scriptname RQ_CollectScript extends RQScript

group CollectProperties
    RefCollectionAlias Property Creatures Auto Const

    RefCollectionAlias Property CollectedMeat Auto Const
    
    MiscObject Property RQS_CollectColonist_Meat Auto Const Mandatory
    { misc item player takes from creatures }

    MiscObject Property RQS_CollectColonist_Meat_Player Auto Const Mandatory
    { misc item that gets placed into player inventory - use different base object so we don't trigger OnItemAdded again }
    
    GlobalVariable Property RQS_CollectColonist_MaxMeat Auto Const Mandatory

    Int Property MeatCollectedStage = 300 Auto Const 
    {Stage to set when all meat has been collected.}

    Int Property ShutdownStage = 999 Auto Const 
    {Stage to set when all minerals have been collected.}
endGroup

Function QuestStartedSpecific()
    int MaxCreatures = Creatures.GetCount()
    debug.trace(self + " maxCreatures=" + MaxCreatures)

    ; If there's no meat, shut down the quest
    If MaxCreatures > 0
        RQS_CollectColonist_MaxMeat.SetValueInt(MaxCreatures)
    Else
        SetStage(ShutdownStage)
    EndIf
EndFunction

function StartTrackingCollection()
	AddInventoryEventFilter(RQS_CollectColonist_Meat)
    ; watch for player to pick up meat
    RegisterForRemoteEvent(Game.GetPlayer(), "OnItemAdded")
endFunction

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    Debug.Trace(self + "RQS_CollectColonist01 Player: Item Added = "+akBaseItem)

    ; silently remove meat and recreate in alias
    akSource.RemoveItem(akBaseItem, abSilent=true)
    akSource.AddAliasedItemSingle(RQS_CollectColonist_Meat_Player, CollectedMeat)

    ; If you have collected all the meat - then progress the quest
    if ( CollectedMeat.GetCount() >= RQS_CollectColonist_MaxMeat.GetValueInt() )
        SetStage(MeatCollectedStage)
        UnregisterForRemoteEvent(akSource, "OnItemAdded")
    endif
EndEvent

