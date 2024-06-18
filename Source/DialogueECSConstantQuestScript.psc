Scriptname DialogueECSConstantQuestScript extends Quest

ReferenceAlias Property ECSConstantShip Mandatory Const Auto
RefCollectionAlias Property GenericNPCs Mandatory Const Auto

Struct NPCData
    ReferenceAlias NPCAlias
    {The Alias for the NPC we want to move}
    ReferenceAlias MarkerAlias
    {The Marker Alias we're moving the NPC to}
EndStruct

NPCData[] Property NPCDatum Mandatory Const Auto

Function MoveNPCs()
    Int i = 0
    Int iLength = NPCDatum.Length
    While i < iLength
        Actor myNPC = (NPCDatum[i].NPCAlias).GetActorRef()
        ObjectReference myMarker = (NPCDatum[i].MarkerAlias).GetRef()
        myNPC.MoveTo(myMarker)
        i+= 1
    EndWhile
EndFunction


Event OnQuestInit()
     ECSConstantShip.GetShipReference().SetValue(Game.GetInvulnerableAV(), 1)
EndEvent