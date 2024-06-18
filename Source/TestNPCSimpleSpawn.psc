Scriptname TestNPCSimpleSpawn extends ObjectReference


Group SharedDefaults CollapsedOnRef
	ActorBase Property ActorToSpawn Auto Mandatory

	Keyword Property SpawnLocationsKeyword Auto Const Mandatory

	Keyword Property DestinationLocationKeyword Auto Const Mandatory

	Outfit[] Property AllTestOutfits Auto Const

	WwiseEvent Property PositiveSoundEvent Auto Const

	Keyword Property PatrolTypeKeyword Auto 
EndGroup

Group Settings
int Property GroupSize = 3 Auto
ObjectReference Property GroupSpawnButton Auto Const
ObjectReference Property SingleSpawnButton Auto Const
ObjectReference Property KillAllButton Auto Const

EndGroup

Actor[] SpawnedActors
int CurrentGroupSize
FormList FactionFormList
int NPCTypeIndex

Event OnInit()
	SpawnedActors = new Actor[0]
	CurrentGroupSize = GroupSize
EndEvent


Event OnActivate(ObjectReference akActionRef)
    PositiveSoundEvent.Play(self)
    if(akActionRef == GroupSpawnButton)
	    ; Handle Group Spawn
	    CurrentGroupSize == GroupSize
	    SpawnActors()

	ElseIf(akActionRef == SingleSpawnButton)
	    ; Handle Single Spawn
	    CurrentGroupSize = 1
	    SpawnActors()

	ElseIf(akActionRef == KillAllButton)
	    ; Handle Kill? (Each Spawn should just kill the previous one too)
	    KillAllNPCs()
	else
		;Activated, but activator not found. in list
	EndIf


EndEvent

Function SpawnActors()

	KillAllNPCs()


	ObjectReference[] SpawnLocations = self.GetLinkedRefChain(SpawnLocationsKeyword)

	;For Each Spawn Location (Either single actor, or a group spawns here.)
	int i = 0
	int j = 0
	Actor newActor
	Actor previousActor		
	While (i < SpawnLocations.length)

		;Cycle through the available outfits and set one
		Outfit outfitToUse = AllTestOutfits[i % AllTestOutfits.length]

		;Spawn actors for each spawn location
		newActor = SpawnLocations[i].PlaceActorAtMe(ActorToSpawn)
		SpawnedActors.Add(newActor)
		newActor.RemoveFromAllFactions()	
		; link actor to patrol
		newActor.SetLinkedRef(SpawnLocations[i].GetLinkedRef(DestinationLocationKeyword), PatrolTypeKeyword)
		newActor.SetOutfit(outfitToUse)
		newActor.EvaluatePackage()
		;check if this is a group and set the new actor to follow the previous one
			if(CurrentGroupSize > 1)
				j = 0
				while (j < CurrentGroupSize -1) ; -1 because we already spawned one actor for the group
					previousActor = newActor
					newActor = SpawnLocations[i].PlaceActorAtMe(ActorToSpawn)
					SpawnedActors.Add(newActor)
					newActor.RemoveFromAllFactions()
					; set to follow
					newActor.SetLinkedRef(previousActor)
					newActor.SetOutfit(outfitToUse)
					newActor.EvaluatePackage()
					j += 1
				EndWhile
			EndIf
		i += 1
		Utility.Wait(3)
	EndWhile		
EndFunction

Function KillAllNPCs()
	;Kill all NPCs Spawned by this controller.
	int count = 0
	While (count < SpawnedActors.length)
		actor curItem = SpawnedActors[count]
		curItem.KillSilent()
		count += 1
	EndWhile
	SpawnedActors.Clear()
EndFunction

Actor[] Function GetSpawnedActors()
	Return SpawnedActors
EndFunction

Function SetDestinationKeyword(Keyword newKeyword)
	PatrolTypeKeyword = newKeyword
EndFunction

; Call from another script on a button per faction.
Function SetFaction(FormList newFactionFormList)
	FactionFormList = newFactionFormList
	ActorToSpawn = FactionFormList.GetAt(NPCTypeIndex) as ActorBase
EndFunction

;Call from another script on a button per NPC type.
Function SetClass(int newNPCTypeIndex)
	NPCTypeIndex = newNPCTypeIndex
	ActorToSpawn = FactionFormList.GetAt(NPCTypeIndex) as ActorBase
EndFunction