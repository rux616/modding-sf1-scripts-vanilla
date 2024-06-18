Scriptname RQScript extends Quest
{ Parent script that can be used directly or extended by other Random Quest scripts as required. }


Group Autofill
	SQ_Groups_QuestScript Property SQ_Groups Mandatory Const Auto
	
	GlobalVariable Property RQ_Debug_SummonShipOnStart Mandatory Const Auto

	ActorValue Property RQ_AV_PrimaryObjectiveKnown Mandatory Const Auto
	ActorValue Property RQ_AV_PrimaryObjectiveFail Mandatory Const Auto
	ActorValue Property RQ_AV_PrimaryObjectiveSuccess Mandatory Const Auto
	ActorValue Property RQ_AV_Hello Mandatory Const Auto
	
	ActorValue Property RQ_AV_SecondaryObjectiveKnown Mandatory Const Auto
	ActorValue Property RQ_AV_SecondaryObjectiveFail Mandatory Const Auto
	ActorValue Property RQ_AV_SecondaryObjectiveSuccess Mandatory Const Auto

	ActorValue Property RQ_AV_EnemyGroup Mandatory Const Auto
	ActorValue Property RQ_AV_Dungeon_LocTheme Mandatory Const Auto

	RQ_ParentScript property RQ_Parent Mandatory Const Auto

	GlobalVariable property RQ_Hello_NoneValue Mandatory Const Auto
	GlobalVariable property RQ_Hello_Calm_PreAcceptValue Mandatory Const Auto
	GlobalVariable property RQ_Hello_Calm_PostAcceptValue Mandatory Const Auto
	GlobalVariable property RQ_Hello_Calm_SuccessValue Mandatory Const Auto
	GlobalVariable property RQ_Hello_Calm_FailureValue Mandatory Const Auto
	GlobalVariable property RQ_Hello_Stressed_PreAcceptValue Mandatory Const Auto
	GlobalVariable property RQ_Hello_Stressed_PostAcceptValue Mandatory Const Auto
	GlobalVariable property RQ_Hello_Stressed_SuccessValue Mandatory Const Auto
	GlobalVariable property RQ_Hello_Stressed_FailureValue Mandatory Const Auto
	GlobalVariable property RQ_Hello_AboardShipValue Mandatory Const Auto
	GlobalVariable property RQ_Hello_DepartingShipValue Mandatory Const Auto
EndGroup

Group Dialogue_Variable_Handling
{Calls to "SetDialogueAV_xxx()" functions will set AVs on DialogueAliases so we can conditionalize dialogue "imported" via "Use Dialogue Subtype"} 
	Alias[] Property DialogueAliases Mandatory Const Auto
	{Aliases in here will have actorvalues set on them via calls to "SetDialogueAV()" usually in quest stages. }

	ReferenceAlias Property RepresentativeEnemyAlias Const Auto
	{An alias holding a representative of the "enemy group" of the quest (ex: the Boss of a dungeon)
	This will be used to set the RQ_AV_EnemyGroup on DialogueAliases}

	LocationAlias Property DungeonLocationAlias Const Auto
	{An alias holding the dungeon location for the quest, if any. This is used to set the RQ_AV_Dungeon_LocTheme on DialogueAliases }

	GlobalVariable Property DialogueAV_Initial_Hello Mandatory Const Auto
	{ The initial Hello state for Actors in this RQ. }

	LocationAlias[] Property OwnedLocations Const Auto
	{ An array holding any locations that should get ownership passed along by the starting quest (for settlement RQs) }
EndGroup

Group Quest_Giver_Handling
	ReferenceAlias property Alias_ForcedPrimary Mandatory Const Auto
	{ An alias that represents the first NPC in a group spoken to at the outset of a quest. Filled by the Greeting scene. }

	ReferenceAlias property Alias_QuestGiver Mandatory Const Auto
	{ An alias that represents the Quest Giver. Assigned at runtime when the quest is initialized, and when ForcedPrimary (the first NPC the player decides to speak to) is assigned.
	  Used to refer back to this NPC after the Greeting Scene. }

	RefCollectionAlias Property RefCollectionToPromoteQuestGiverFromOnSpawn Const Auto
	{if not none, when the SpawnEvent comes from the DefaultGroupSpawnQuestEvent, the first actor in this RefCollection will be promoted to the Alias_QuestGiver and Alias_ForcedPrimary alias}
endGroup

Group Locks_And_Keys
	Alias[] Property ObjectsToLock Const Auto
	Alias[] Property ObjectsToPutKeysIn Const Auto
	{will randonly put keys to ObjectsToLock in containers of ObjectsToPutKeysIn}

	RefCollectionAlias Property PlacedKeys Const Auto
	{will hold refs to keys that were created and placed}
EndGroup

Group Shutdown
	Alias[] Property ShutdownAliases Mandatory Const Auto
	{Aliases that will be considered when determining shutdown logic}

	int Property ShutdownStageRequired_Stage = 100 Const Auto
	{ Prior to this stage being set, quest will shutdown when player leaves the planet.
	  After this stage is set, quest won't shutdown until ShutdownAllowed_Stage is set.
	}

	int Property ShutdownAllowed_Stage Mandatory Const Auto
	{Automated system (defined by ShutdownOn_ property below) will shutdown the quest only if this stage has been set.}

	bool Property ShutdownAllowed_UnloadedOrDeadAlisaes = true Const Auto
	{If true (default), automated system (defined by ShutdownOn_ property) will shutdown the quest only if refs in ShutdownAliases have no 3d or are dead.}

	bool Property ShutdownOn_LocationChange = true Const Auto
	{if true (default), will attempt to shut down when player changes locations}

	bool Property AlsoCallShutDownOnREScript = true Const Auto
	{if true (default), when shutting down, will cast self as REScript and call the Shutdown() function on it}
EndGroup

REScript REScriptIns

Form previouslyRandomlySpawnedForm

int DialogueAV_LastHello = -1

Planet questPlanet ; set during OnQuestStarted

Event OnQuestStarted()
	Trace(self, "OnQuestStarted() ")

	REScriptIns = (self as quest) as REScript

	;register for spawn event
	DefaultGroupSpawnQuestScript DefaultGroupSpawnQuestScriptIns = (self as quest) as DefaultGroupSpawnQuestScript
	if DefaultGroupSpawnQuestScriptIns
		Trace(self, " waiting for spawn event to initialize NPCs")
		RegisterForCustomEvent(DefaultGroupSpawnQuestScriptIns, "SpawnGroupDoneEvent")
	Else
		; if no spawn script, it means we aren't spawning NPCs but finding them
		InitializeNPCs()
	endif

	if ShutdownOn_LocationChange
		RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
		questPlanet = Game.GetPlayer().GetCurrentPlanet()
	endif

	LockObjectsAndPlaceKeys()
	if RepresentativeEnemyAlias
		SetDialogueAV_EnemyGroup() 
	endif

	;Register for alias change events

	RegisterForRemoteEvent(Alias_ForcedPrimary, "OnAliasChanged") ;to call SetDialogueAV_EnemyGroup() again if it changes after startup
	if RepresentativeEnemyAlias
		RegisterForRemoteEvent(RepresentativeEnemyAlias, "OnAliasChanged") ;to call SetDialogueAV_EnemyGroup() again if it changes after startup
	EndIf

	int i = 0
	While (i < DialogueAliases.length)
		ReferenceAlias currentRefAlias = DialogueAliases[i] as ReferenceAlias
		RefCollectionAlias currentRefColAlias = DialogueAliases[i] as RefCollectionAlias
		
		if currentRefAlias
			RegisterForRemoteEvent(currentRefAlias, "OnAliasChanged") ;to call SetDialogueAV_EnemyGroup() again if it changes after startup
		elseif currentRefColAlias
			RegisterForRemoteEvent(currentRefColAlias, "OnAliasChanged") ;to call SetDialogueAV_EnemyGroup() again if it changes after startup
		endif
		
		i += 1
	EndWhile

	QuestStartedSpecific()
EndEvent

function QuestStartedSpecific()
	; do nothing - override on child script
endFunction

function SetLocationOwnership(Faction owningFaction)
	if owningFaction && OwnedLocations.Length > 0
		int i = 0
		while i < OwnedLocations.Length
			Location ownedLocation = OwnedLocations[i].GetLocation()
			if ownedLocation
				ownedLocation.SetFactionOwner(owningFaction)
			endif
			i += 1
		EndWhile
	endif
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
	Trace(self, "OnStoryScript() akKeyword: " + akKeyword + ", akLocation: " + akLocation + ", akRef1: " + akRef1 + ", akRef2: " + akRef2 + ", aiValue1: " + aiValue1 + ", aiValue2: " + aiValue2)

	if RQ_Debug_SummonShipOnStart.GetValue() == 1
		Trace(self, "OnStoryScript() RQ_Debug_SummonShipOnStart == 1, calling DebugSummonShip()")
		(Game.GetPlayer() as DebugPlayerSummonShipScript).DebugSummonShip()
	endif
EndEvent

Event DefaultGroupSpawnQuestScript.SpawnGroupDoneEvent(DefaultGroupSpawnQuestScript akSender, var[] akArgs)
	Trace(self, "SpawnGroupDoneEvent() args: " + akArgs)
	DefaultGroupSpawnQuestScript:SpawnGroupDoneEventArgs spawnArgs = akArgs[0] as DefaultGroupSpawnQuestScript:SpawnGroupDoneEventArgs
    int spawnGroupID = spawnArgs.SpawnGroupNumber
	SQ_GroupScript spawnedGroup = spawnArgs.SpawnedGroup
	
    ; spawning is finished
	InitializeNPCs()

	; set ownership
	DefaultGroupSpawnQuestScript DefaultGroupSpawnQuestScriptIns = (self as quest) as DefaultGroupSpawnQuestScript
	Faction owningFaction = DefaultGroupSpawnQuestScriptIns.GetGroupOwnershipFaction(spawnGroupID)
	if owningFaction
		SetLocationOwnership(owningFaction)
	endif
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, bool abRemove)
	Trace(self, "OnAliasChanged() akSender: " + akSender + ", akObject: " + akObject + ", abRemove: " + abRemove)
	if abRemove == false
		if (akSender == RepresentativeEnemyAlias || DialogueAliases.Find(akSender) >= 0)
			SetDialogueAV_EnemyGroup() ;we do this in the OnAliasChanged event in case another script spawns the actor and forces it into the alias. We need to do this after that happens.
		endif

		if akSender == Alias_ForcedPrimary
			Alias_QuestGiver.ForceRefTo(akObject)
			OnQuestGiverSet(akObject)
		endif

		SetDialogueAV_InitialHello()
	endif
	OnAliasChangedSpecific(akSender, akObject, abRemove)
EndEvent

function OnAliasChangedSpecific(ReferenceAlias akSender, ObjectReference akObject, bool abRemove)
	; override on children
EndFunction

function InitializeNPCs()
	if RefCollectionToPromoteQuestGiverFromOnSpawn
		if Alias_QuestGiver.GetActorRef() == NONE
			; If we don't have a quest giver, force the Quest Giver to initially be an Actor in the Actors Collection, so one of the actors will attempt to ForceGreet the player on approach
			ObjectReference initialQuestGiverRef = RefCollectionToPromoteQuestGiverFromOnSpawn.GetAt(0) ;these are spawned randomly, so first one is as random as any other

			Trace(self, "InitializeNPCs() initialQuestGiverRef: " + initialQuestGiverRef)
			Alias_QuestGiver.ForceRefTo(initialQuestGiverRef) 
		endif
	endif
EndFunction

function OnQuestGiverSet(ObjectReference akQuestGiver)
	; Override
endFunction

Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, bool abRemove)
	Trace(self, "OnAliasChanged() akSender: " + akSender + ", akObject: " + akObject + ", abRemove: " + abRemove)
	if abRemove == false
		SetDialogueAV_EnemyGroup() ;we do this in the OnAliasChanged event in case another script spawns the actor and forces it into the alias. We need to do this after that happens.
	endif

	SetDialogueAV_InitialHello()
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	Trace(self, "OnLocationChange() akSender: " + akSender + ", akOldLoc: " + akOldLoc + ", akNewLoc: " + akNewLoc)
	if akSender == Game.GetPlayer()
		CheckForShutdown(akNewLoc)
	endif
EndEvent

Function CheckForShutdown(Location akNewLoc)
	Trace(self, "CheckForShutdown() akNewLoc=" + akNewLoc + " questPlanet=" + questPlanet)
	if GetStageDone(ShutdownAllowed_Stage) && ShutDownCheckAliases()
		ShutDown()
	elseif ShutdownStageRequired_Stage > -1 && GetStageDone(ShutdownStageRequired_Stage) == false && questPlanet && akNewLoc
		; if ShutdownStageRequired_Stage not set, can shutdown when player leaves planet
		if Game.GetPlayer().GetCurrentPlanet() != questPlanet
			Trace(self, " player is on different planet, prior to ShutdownStageRequired_Stage=" + ShutdownStageRequired_Stage + " being set. Shutdown quest.")
			ShutDown()
		endif
	endif
EndFunction

Function LockObjectsAndPlaceKeys()
	Trace(self, "LockObjectsAndPlaceKeys() ")

	Trace(self, "LockObjectsAndPlaceKeys() ObjectsToLock: " + ObjectsToLock)
	Trace(self, "LockObjectsAndPlaceKeys() ObjectsToPutKeysIn: " + ObjectsToPutKeysIn)

	ObjectReference[] refsToLock = CommonArrayFunctions.GetReferencesFromAliasArray(ObjectsToLock)
	ObjectReference[] refsToPutKeysIn = CommonArrayFunctions.GetReferencesFromAliasArray(ObjectsToPutKeysIn)

	Trace(self, "LockObjectsAndPlaceKeys() refsToLock: " + refsToLock)
	Trace(self, "LockObjectsAndPlaceKeys() refsToPutKeysIn: " + refsToPutKeysIn)
	
	int i = 0
	While (i < refsToLock.length)
		ObjectReference currentRefToLock = refsToLock[i]

		;TO DO:
		;Replace use of GetKey() with PlaceLockedRefKeyAtMe() which should work better with instanced locks.
		;GEN-369223
		Key keyToPlace = currentRefToLock.GetKey()

		Trace(self, "LockObjectsAndPlaceKeys() currentRefToLock: " + currentRefToLock)
		Trace(self, "LockObjectsAndPlaceKeys() keyToPlace: " + keyToPlace)

		;only lock it if it has a key
		if keyToPlace
			;(could improve this if it was "deck of cards" rather than totally random, if that seems justified later)
			int iRandom = Utility.RandomInt(0, refsToPutKeysIn.Length - 1)
			ObjectReference randomRef = refsToPutKeysIn[iRandom]

			ObjectReference keyRef = randomRef.PlaceAtMe(keyToPlace, abInitiallyDisabled = true)
			randomRef.AddItem(keyRef)
			PlacedKeys.addREf(keyRef)
			keyRef.Enable()
		else
			Warning(self, "LockObjectsAndPlaceKeys() did not find a key for currentRefToLock: " + currentRefToLock)
		endif

		i += 1
	EndWhile
EndFunction

Function DebugMoveToKey(int KeysIndex = 0)
	Trace(self, "DebugMoveToKey() KeysIndex: " + KeysIndex)

	Game.GetPlayer().MoveTo(PlacedKeys.GetAt(KeysIndex))
EndFunction

Function SetDialogueAV(ActorValue AV, int Value = 1)
	Trace(self, "SetDialogueAV() AV: " + AV + ", Value: " + Value)
	int i = 0
	While (i < DialogueAliases.length)
		ReferenceAlias refAlias = DialogueAliases[i] as ReferenceAlias
		RefCollectionAlias refColAlias = DialogueAliases[i] as RefCollectionAlias
		
		if refAlias
			Trace(self, "SetDialogueAV on refAlias: " +  refAlias)
			refAlias.TryToSetValue(AV, Value)
			Trace(self, "AV is now: " +  refAlias.GetReference().GetValue(AV))
		elseif refColAlias
			Trace(self, "SetDialogueAV on  refColAlias: " +  refColAlias)
			refColAlias.SetValue(AV, Value)
			Trace(self, "AV on first ref in collection is now: " +  refColAlias.GetAt(0).GetValue(AV))
		endif

		i += 1
	EndWhile
EndFunction

Function SetDialogueAV_Hello(int value)
	Trace(self, "SetDialogueAV_Hello() value: " + value)
	DialogueAV_LastHello = value
	SetDialogueAV(RQ_AV_Hello, value)
EndFunction


Function SetDialogueAV_PrimaryObjectiveKnown()
	SetDialogueAV(RQ_AV_PrimaryObjectiveKnown)
EndFunction

Function SetDialogueAV_PrimaryObjectiveFail()
	SetDialogueAV(RQ_AV_PrimaryObjectiveFail)
EndFunction

Function SetDialogueAV_PrimaryObjectiveSuccess()
	SetDialogueAV(RQ_AV_PrimaryObjectiveSuccess)
EndFunction

Function SetDialogueAV_SecondaryObjectiveKnown()
	SetDialogueAV(RQ_AV_SecondaryObjectiveKnown)
EndFunction

Function SetDialogueAV_SecondaryObjectiveFail()
	SetDialogueAV(RQ_AV_SecondaryObjectiveFail)
EndFunction

Function SetDialogueAV_SecondaryObjectiveSuccess()
	SetDialogueAV(RQ_AV_SecondaryObjectiveSuccess)
EndFunction

Function SetDialogueAV_InitialHello()
	if DialogueAV_LastHello == -1
		SetDialogueAV_Hello(DialogueAV_Initial_Hello.GetValueInt())
	else
		SetDialogueAV_Hello(DialogueAV_LastHello)
	endif
EndFunction

function SetDialogueAV_Hello_None()
	SetDialogueAV_Hello(RQ_Hello_NoneValue.GetValueInt())
endFunction

function SetDialogueAV_Hello_Calm_PreAccept()
	SetDialogueAV_Hello(RQ_Hello_Calm_PreAcceptValue.GetValueInt())
endFunction

function SetDialogueAV_Hello_Calm_PostAccept()
	SetDialogueAV_Hello(RQ_Hello_Calm_PostAcceptValue.GetValueInt())
endFunction

function SetDialogueAV_Hello_Calm_Success()
	SetDialogueAV_Hello(RQ_Hello_Calm_SuccessValue.GetValueInt())
endFunction

function SetDialogueAV_Hello_Calm_Failure()
	SetDialogueAV_Hello(RQ_Hello_Calm_FailureValue.GetValueInt())
endFunction

function SetDialogueAV_Hello_Stressed_PreAccept()
	SetDialogueAV_Hello(RQ_Hello_Stressed_PreAcceptValue.GetValueInt())
endFunction

function SetDialogueAV_Hello_Stressed_PostAccept()
	SetDialogueAV_Hello(RQ_Hello_Stressed_PostAcceptValue.GetValueInt())
endFunction

function SetDialogueAV_Hello_Stressed_Success()
	SetDialogueAV_Hello(RQ_Hello_Stressed_SuccessValue.GetValueInt())
endFunction

function SetDialogueAV_Hello_Stressed_Failure()
	SetDialogueAV_Hello(RQ_Hello_Stressed_FailureValue.GetValueInt())
endFunction

function SetDialogueAV_Hello_AboardShip()
	SetDialogueAV_Hello(RQ_Hello_AboardShipValue.GetValueInt())
endFunction

function SetDialogueAV_Hello_DepartingShip()
	SetDialogueAV_Hello(RQ_Hello_DepartingShipValue.GetValueInt())
endFunction

Function SetDialogueAV_EnemyGroup()
	if RepresentativeEnemyAlias
		Actor enemyActor = RepresentativeEnemyAlias.GetActorReference()
		Trace(self, "SetDialogueAV_EnemyGroup() EnemyActor: " + EnemyActor)
		
		if enemyActor
			SetDialogueAV(RQ_AV_EnemyGroup, SQ_Groups.GetGroupFactionIDValueByActor(EnemyActor, ValidateActor = false)) ;we aren't needing to validate the actor because we might not need to check for voicetypes, etc.
		endif
	endif
EndFunction

bool Function ShutDownCheckAliases()
	Trace(self, "ShutDownCheckAliases()")
	bool returnVal = true

	if ShutdownAllowed_UnloadedOrDeadAlisaes
		ReferenceAlias[] refAliasArray = CommonArrayFunctions.GetReferenceAliasesFromAliasArray(ShutdownAliases)
		RefCollectionAlias[] refColAliasArray = CommonArrayFunctions.GetRefCollectionAliasesFromAliasArray(ShutdownAliases)

		int count = CommonArrayFunctions.GetCountLoadedAndAliveStateFromAliasArray(refAliasArray, Check3DLoaded = true, CheckAlive = true )

		if count == 0
			int i = 0
			While (count == 0 && i < refColAliasArray.length)
				count += refColAliasArray[i].GetCountAliveAnd3DLoaded()
				i += 1
			EndWhile
		endif

		Trace(self, "ShutDownCheckAliases() found this many Refs that were Alive and Loaded, count: " + count)

		if count > 0
			returnVal = false
		endif
	endif

	Trace(self, "ShutDownCheckAliases() returnVal: " + returnVal)

	return returnVal
EndFunction

Function Shutdown()
	if AlsoCallShutDownOnREScript && REScriptIns
		Trace(self, "Shutdown() calling Shutdown() on REScript attached to quest as well. ")
		REScriptIns.Shutdown()
	endif
	Trace(self, "Shutdown() calling Stop()")
	Stop()
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "RQ",  string SubLogName = "RQScript", bool bShowNormalTrace = true, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "RQ",  string SubLogName = "RQScript", bool bShowNormalTrace = true, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction
