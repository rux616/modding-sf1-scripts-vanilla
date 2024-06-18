Scriptname TestNPCArenaScript extends ObjectReference


Group SharedDefaults CollapsedOnRef
	ActorBase Property ActorToSpawn auto mandatory
	{Actor to spawn for the first group}
	Faction Property TestNPCBehaviorRedTeam auto mandatory const
	{Red Team Faction}
	Faction Property TestNPCBehaviorBlueTeam auto mandatory const
	{Blue Team Faction}
	Faction Property TestNPCPlayerEnemyFaction auto mandatory const
	{Faction for fighting against the player.}
	Keyword Property RedSpawnLocationsKeyword auto mandatory const
	{Where the red team and noncombat NPCs will spawn.}
	Keyword Property BlueSpawnLocationsKeyword auto mandatory const
	{Where the blue team will spawn}
	Keyword Property DestinationLocationsKeyword auto mandatory const
	{Where the spawned NPCs will go. Shared for combat NPCs, set through linked refs from spawn points for non combat NPCs.}
	;Consider making these set up the same way, rather than 2 different setups.
	Keyword Property TestNPCSpawnLocationsKeyword auto mandatory const
	{Used to spawn and patrol NPCs if there are no spawn locations or destinations linked to the spawn activator}
	Keyword Property PatrolTypeKeyword Auto
	{Used to set run, jog, etc. for noncombat NPCs. should contain any patrol styles to be tested.}
	Keyword Property SandboxKeyword Auto mandatory const
	{For Sandboxing NPCs}
	Outfit[] Property AllTestOutfits Auto Const Mandatory
	{Used to differentiate groups of Noncombat NPCs}
	Outfit Property BlueOutfit auto mandatory const
	Outfit Property RedOutfit auto mandatory const
	WwiseEvent Property PositiveSoundEvent auto mandatory const
	WwiseEvent Property NegativeSoundEvent auto mandatory const
	FormList Property AllFactionFormList auto mandatory	const
	{Form List of FormLists, for choosing random factions}
	Activator Property TestNPCSpawnMarker auto mandatory const
	{This marker is placed when using quick placement.}
	VoiceType Property NPCNoLinesVoiceType auto const
	{Select a voice type override for all spawned NPCs}
EndGroup

Actor[] SpawnedActors
ActorBase[] RedActorsToSpawn
ActorBase[] BlueActorsToSpawn
FormList AllRedTeamNPCTypes
FormList AllBlueTeamNPCTypes


Group Inputs
	int Property RedTeamSize = 1 auto mandatory
	{Number of Actors to spawn for the first group}
	int Property BlueTeamSize = 1 auto mandatory
	{Number of Actors to spawn for the second group}
	ObjectReference[] Property AddToRedTeamButton auto const
	{These buttons will increase the team size to be spawned for the Red Team}
	ObjectReference[] Property AddToBlueTeamButton auto const
	{These buttons will increase the team size to be spawned for the Blue Team}
	ObjectReference[] Property SubtractFromRedTeamButton auto const
	{These buttons will reduce the team size to be spawned for the Red Team}
	ObjectReference[] Property SubtractFromBlueTeamButton auto const
	{These buttons will reduce the team size to be spawned for the Blue Team}
	bool Property SpawnOnLoad auto const
	{Should a default NPC spawn into the pathing test area on load?}
	bool Property VersusPlayer = false auto

	int Property HealthBoost = 200 auto
EndGroup

Event OnInit()
	SpawnedActors = new Actor[0]
	RedActorsToSpawn = new ActorBase[0]
	BlueActorsToSpawn = new ActorBase[0]
	AllRedTeamNPCTypes = (AllFactionFormList.GetAt(1) as FormList)
	AllBlueTeamNPCTypes =  (AllFactionFormList.GetAt(0) as FormList)
	;Fill in the spawn arrays with default settings
	int count = 0
	While (count < RedTeamSize)
		RedActorsToSpawn.Add(ActorToSpawn)
		count += 1
	EndWhile
	count = 0
	While (count < BlueTeamSize)
		BlueActorsToSpawn.Add(ActorToSpawn)
		count += 1
	EndWhile
EndEvent

; Move all of these to functions on scripts for each button.
;ALL SPECIFIC CLASS CHOICES WILL NOW NEED TO BE INDECIES FOR FACTION FORM LISTS
;Could The display text for the specific classes update for the faction?
;Factions and Classes that will be spawned should display in game as they are made.
Event OnActivate(ObjectReference akActionRef)
	PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference)
	;Activator is Spawn NPCs Button
	;if(SpawnNPCButton.Find(akActionRef) >= 0)
		;SpawnTeams(akActionRef)
	;Activator is Add NPC to Team 1
	If(AddToRedTeamButton.Find(akActionRef) >= 0)
		RedActorsToSpawn.Add(ActorToSpawn)
	;Activator is Add NPC to Team 2
	ElseIf(AddToBlueTeamButton.Find(akActionRef) >= 0)
		BlueActorsToSpawn.Add(ActorToSpawn)
	;Activator is Subtract NPC from Team 1
	ElseIf(SubtractFromRedTeamButton.Find(akActionRef) >= 0)
		RedActorsToSpawn.RemoveLast()
	;Activator is Subtract NPC from Team 2
	ElseIf(SubtractFromBlueTeamButton.Find(akActionRef) >= 0)
		BlueActorsToSpawn.RemoveLast()
	;Activator is Kill All NPCs
	;ElseIf(RandomizeTeamsButton.Find(akActionRef) >= 0)
		;SetRandomTeams()
	;Activator is Randomize NPC type and amount.
	EndIf

EndEvent


Function SpawnTeams(ObjectReference akActionRef)
	;Get the linked references from the spawn button
	ObjectReference[] SpawnLocationsRedTeam = akActionRef.GetLinkedRefChain(RedSpawnLocationsKeyword)
	ObjectReference[] SpawnLocationsBlueTeam = akActionRef.GetLinkedRefChain(BlueSpawnLocationsKeyword)
	ObjectReference[] DestinationLocations = akActionRef.GetLinkedRefChain(DestinationLocationsKeyword)


	;If the spawn activator does not link to spawn locations and destinations this will attempt to find those using
	;a keyword to locate markers in the loaded area.
	if(SpawnLocationsRedTeam.length == 0 && SpawnLocationsBlueTeam.length == 0)
		;Get spawn locations using FindAllReferencesWithKeyword
		RandomNavLocations(akActionRef)
		SpawnLocationsRedTeam = FindAllReferencesWithKeyword(TestNPCSpawnLocationsKeyword, 1000.0)
	endif

	if(DestinationLocations.length == 0)
		;Use SpawnLocationsRedTeam as Destination Locations.
		DestinationLocations = SpawnLocationsRedTeam
	endif

	;Spawn Red Team
	int count = 0
	While (count < RedActorsToSpawn.length)
		Actor newActor = SpawnLocationsRedTeam[Utility.RandomInt(0, SpawnLocationsRedTeam.length - 1)].PlaceActorAtMe(RedActorsToSpawn[count], 1)
	    newActor.RemoveFromAllFactions()

		if (VersusPlayer)
	    	newActor.AddToFaction(TestNPCPlayerEnemyFaction)
	    else
			newActor.AddToFaction(TestNPCBehaviorRedTeam)
		endif

		newActor.SetLinkedRef(DestinationLocations[Utility.RandomInt(0, DestinationLocations.length - 1)], PatrolTypeKeyword)
		;newActor.SetOverrideVoiceType(NPCNoLinesVoiceType)
		;newActor.SetOutfit(RedOutfit)
	   	if(HealthBoost > 0)
	    	newActor.SetValue( Game.GetHealthAV(), HealthBoost )
		endif
	    newActor.EvaluatePackage()
	    SpawnedActors.Add(newActor)
		count += 1
	EndWhile
	;Spawn Blue Team
	count = 0
	While (count < BlueActorsToSpawn.length)
		Actor newActor = SpawnLocationsBlueTeam[Utility.RandomInt(0, SpawnLocationsBlueTeam.length - 1)].PlaceActorAtMe(BlueActorsToSpawn[count], 1)
	    newActor.RemoveFromAllFactions()
	    newActor.AddToFaction(TestNPCBehaviorBlueTeam)
	   	newActor.SetLinkedRef(DestinationLocations[Utility.RandomInt(0, DestinationLocations.length - 1)], PatrolTypeKeyword)
		;newActor.SetOverrideVoiceType(NPCNoLinesVoiceType)
		   ;newActor.SetOutfit(BlueOutfit)
		if(HealthBoost > 0)
	    	newActor.SetValue( Game.GetHealthAV(), HealthBoost )
		endif
	    newActor.EvaluatePackage()
	    SpawnedActors.Add(newActor)
		count += 1
	EndWhile
EndFunction

Function AddSpecificNPC(int classToAddIndex, int TeamToAddTo)
	; 0. Assault, 1. Charger, 2. Heavy, 3. Officer, 4. Recruit, 5. Sniper, 6. Support
	if (TeamToAddTo == 1 && AllRedTeamNPCTypes.GetAt(classToAddIndex)) ; Red Team (check that class exists)
		RedActorsToSpawn.Add(AllRedTeamNPCTypes.GetAt(classToAddIndex) as ActorBase)
		PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference)
	elseif (TeamToAddTo == 2 && AllBlueTeamNPCTypes.GetAt(classToAddIndex)) ; Blue Team (check that class exists)
		BlueActorsToSpawn.Add(AllBlueTeamNPCTypes.GetAt(classToAddIndex) as ActorBase)
		PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference)
	else
		NegativeSoundEvent.Play(Game.GetPlayer() as ObjectReference)
	endif
EndFunction

Function ClearActorsToSpawn()
	RedActorsToSpawn.Clear()
	BlueActorsToSpawn.Clear()
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

Function SetRandomTeams(bool andSpawn, bool onlyRed, ObjectReference akActionRef, int randMin = 3, int randMax = 6)
	RedActorsToSpawn.Clear()
	BlueActorsToSpawn.Clear()
	RedTeamSize = Utility.RandomInt(randMin, randMax)
	BlueTeamSize = Utility.RandomInt(randMin, randMax)

	if(onlyRed)
		BlueTeamSize = 0
	endif

	;Create an array of the NPC types to spawn. Then in spawn NPCs step through the array.
	int count = 0
	While (count < RedTeamSize)
		RedActorsToSpawn.Add(AllRedTeamNPCTypes.GetAt(Utility.RandomInt(0, AllRedTeamNPCTypes.GetSize() -1)) as ActorBase	)
		count += 1
	EndWhile
	count = 0
	While (count < BlueTeamSize)
		BlueActorsToSpawn.Add(AllBlueTeamNPCTypes.GetAt(Utility.RandomInt(0, AllBlueTeamNPCTypes.GetSize() -1)) as ActorBase	)
		count += 1
	EndWhile
	if(andSpawn && akActionRef)
		SpawnTeams(akActionRef)
	endif
EndFunction

Function SetFactionToSpawn(FormList newFactionList, int TeamNumber)
		if(TeamNumber == 1) ; Red Team
			PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference)
			int count = 0
			While (count < RedActorsToSpawn.length)
				int index = AllRedTeamNPCTypes.Find(RedActorsToSpawn[count] as Form)
					if(index > -1) ;The object exists
						if(newFactionList.GetAt(index))
							RedActorsToSpawn[count] = newFactionList.GetAt(index) as ActorBase
						else
							RedActorsToSpawn[count] = newFactionList.GetAt(0) as ActorBase
						EndIf
					else ;Replace with Default Actor from new list.
							RedActorsToSpawn[count] = newFactionList.GetAt(0) as ActorBase
					endif
				count += 1
			EndWhile
			AllRedTeamNPCTypes = newFactionList
		elseif(TeamNumber == 2) ; Blue Team
		int count = 0
			PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference)
			While (count < BlueActorsToSpawn.length)
				int index = AllBlueTeamNPCTypes.Find(BlueActorsToSpawn[count] as Form)
					if(index > -1) ;The object exists
						if(newFactionList.GetAt(index))
							BlueActorsToSpawn[count] = newFactionList.GetAt(index) as ActorBase
						else
							BlueActorsToSpawn[count] = newFactionList.GetAt(0)  as ActorBase
						EndIf
					else ;Replace with Default Actor from new list.
							BlueActorsToSpawn[count] = newFactionList.GetAt(0)  as ActorBase
					endif
				count += 1
			EndWhile
			AllBlueTeamNPCTypes = newFactionList
		else
			NegativeSoundEvent.Play(Game.GetPlayer() as ObjectReference)
			;Warn about incorrect Team number
		EndIf
EndFunction

Function SpawnNonCombatActors(int GroupSize, ObjectReference LinkRefHub)
	;function called from another script.

	KillAllNPCs()

	ObjectReference[] SpawnLocations = LinkRefHub.GetLinkedRefChain(RedSpawnLocationsKeyword)

	;For Each Spawn Location (Either single actor, or a group spawns here.)
	int i = 0
	int j = 0
	Actor newActor
	Actor previousActor
	While (i < SpawnLocations.length)

		;Cycle through the available outfits and set one
		Outfit outfitToUse = AllTestOutfits[i % AllTestOutfits.length]

		;Spawn actors for each spawn location
		if(RedActorsToSpawn[0])
			newActor = SpawnLocations[i].PlaceActorAtMe(RedActorsToSpawn[0])
		else
			newActor = SpawnLocations[i].PlaceActorAtMe(AllRedTeamNPCTypes.GetAt(0) as ActorBase)
		endif
		SpawnedActors.Add(newActor)
		newActor.RemoveFromAllFactions()
		; link actor to patrol
		if (SpawnLocations[i].GetLinkedRef(DestinationLocationsKeyword))
			newActor.SetLinkedRef(SpawnLocations[i].GetLinkedRef(DestinationLocationsKeyword), PatrolTypeKeyword)
			PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference)
		elseif (SpawnLocations[i].GetLinkedRef(SandboxKeyword))
			newActor.SetLinkedRef(SpawnLocations[i].GetLinkedRef(SandboxKeyword), SandboxKeyword)
			PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference)
		else
			NegativeSoundEvent.Play(Game.GetPlayer() as ObjectReference)
		endif
		newActor.SetOutfit(outfitToUse)
		newActor.EvaluatePackage()
		;check if this is a group and set the new actor to follow the previous one
			if(GroupSize > 1)
				j = 0
				while (j < GroupSize -1) ; -1 because we already spawned one actor for the group
					previousActor = newActor
					if(RedActorsToSpawn[j + 1])
						newActor = SpawnLocations[i].PlaceActorAtMe(RedActorsToSpawn[j + 1])
					else
						newActor = SpawnLocations[i].PlaceActorAtMe(AllRedTeamNPCTypes.GetAt(0) as ActorBase)
					endif
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
		Utility.Wait(1) ; Give an extra moment to process all the NPC spawns in each group.
	EndWhile
EndFunction

Function SetPatrolSpeed(Keyword newPatrolKeyword)
	int count = 0
	While (count < SpawnedActors.length) ;Go through all spawned actors, Switch link ref keyword
		ObjectReference	linkedObject = SpawnedActors[count].GetLinkedRef(PatrolTypeKeyword)
		SpawnedActors[count].SetLinkedRef(None, PatrolTypeKeyword)
		SpawnedActors[count].SetLinkedRef(linkedObject, newPatrolKeyword)
		SpawnedActors[count].EvaluatePackage()
		count += 1
	EndWhile
	PatrolTypeKeyword = newPatrolKeyword
	PositiveSoundEvent.Play(Game.GetPlayer() as ObjectReference)
EndFunction

FormList Function GetFactionFormList(int teamNumber)
	FormList factionFormList
	if(teamNumber == 1)
		factionFormList = (AllRedTeamNPCTypes as FormList)
	elseif(teamNumber == 2)
		factionFormList = (AllBlueTeamNPCTypes as FormList)
	else
		;Wrong Team Number
	endif
	return factionFormList
EndFunction

bool Function RandomNavLocations(ObjectReference akActionRef)
	int range = 50
	int numberOfSpawnLocations = 10
	;Currently still searching for keyword, but can remove that step later.

	ObjectReference[] newMarkers = new ObjectReference[0]

	;These are broken up into 3 while loops because Position updates and moveToNav are both latent functions.
	int i = 0
	while (i < numberOfSpawnLocations)
		;Spawn Marker TestNPCSpawnMarker
		ObjectReference newSpawnMarker = self.PlaceAtMe(TestNPCSpawnMarker)
		newMarkers.Add(newSpawnMarker)
		i += 1
	endwhile
	i = 0
	while (i < numberOfSpawnLocations)
		;Set position to randomized based on original position
		newMarkers[i].SetPosition((newMarkers[i].GetPositionX() + Utility.RandomInt(-range, range)), (newMarkers[i].GetPositionY() + Utility.RandomInt(-range, range)), newMarkers[i].GetPositionZ())
		i += 1
	endwhile
	i = 0
	while (i < numberOfSpawnLocations)
		;Put the marker on the navmesh near its new position
		newMarkers[i].MoveToNearestNavmeshLocation()
		i += 1
	EndWhile

	;Turn markers into patrol nodes.
	;Consider searching for existing patrols.
	i = 0
	while (i < newMarkers.length -1 )
		newMarkers[i].SetLinkedRef(newMarkers[i+1])
		i += 1
	endwhile

	newMarkers.Clear()
	return true ;If locations are created
	; CONSIDER: Clearing these markers, or checking if markers need to be created. Instead of creating more
	; each time this is run.
	;Consider using a wait between position and move if these operations needs more time.
EndFunction