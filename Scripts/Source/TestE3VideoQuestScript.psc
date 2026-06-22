Scriptname TestE3VideoQuestScript extends Quest

ObjectReference property TestE3Custom05MarkerRef Auto Const Mandatory
ObjectReference custom05Ref

Function SpawnCustom05(ActorBase actorToSpawn)
	if (Custom05Ref != None)
		Custom05Ref.Disable()
		Custom05Ref.Delete()
	EndIf
	custom05Ref = TestE3Custom05MarkerRef.PlaceActorAtMe(actorToSpawn, abInitiallyDisabled=True)
	custom05Ref.SetLinkedRef(TestE3Custom05MarkerRef)
	custom05Ref.SetValue(Game.GetAggressionAV(), 0)
	custom05Ref.Enable()
EndFunction