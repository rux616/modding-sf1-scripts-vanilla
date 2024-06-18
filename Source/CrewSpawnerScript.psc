Scriptname CrewSpawnerScript extends ObjectReference
{Used to set spawn limits for the location by setting this data on the reference found by SQ_Crew_SpawnManager to spawn at}

Group SpawnLimits
	int Property MaxNumberToSpawn = 6 Const Auto
	{the max number to spawn}

	int Property RespawnIntervalLocalDays = 3 Const Auto
	{the interval to respawn these actors in local days}
EndGroup

Group ActorData
	Faction Property CrewCrimeFaction Const Auto
	{the crime faction to assign}
EndGroup

Group Autofill
	Keyword property LinkGenericCrewSpawnMarker auto const mandatory
	{the keyword that links generic crew members to this spawn marker}
endGroup

int respawnIntervalTimerID = 1 const
Actor[] spawnedCrew
bool canSpawnCrew = true

bool function GetCanSpawnCrew()
	return canSpawnCrew
endFunction

function StartRespawnTimer()
	canSpawnCrew = false
	GoToState("RespawnTimer")
endFunction

State RespawnTimer
	Event OnBeginState(string asOldState)
		debug.trace(self + " entering state RespawnTimer, preventing spawning from this marker for " + RespawnIntervalLocalDays + " local days.")
		StartTimerGameTime(RespawnIntervalLocalDays * GetDayLength(), respawnIntervalTimerID)
	endEvent

	Event OnTimerGameTime(int aiTimerID)
		if aiTimerID == respawnIntervalTimerID
			if Is3DLoaded()
				GoToState("LoadedAfterTimerComplete")
			else
				PrepareForRespawn()
			endif
		EndIf
	EndEvent
endState

State LoadedAfterTimerComplete
	Event OnBeginState(string asOldState)
		debug.trace(self + " entering state LoadedAfterTimerComplete")
	EndEvent

	Event OnUnload()
		PrepareForRespawn()
	EndEvent
endState

function ClearSpawnedCrewArray()
	debug.trace(self + " ClearSpawnedCrewArray")
	spawnedCrew.Clear()
endFunction

function AddToSpawnedCrewArray(Actor crewMember)
	debug.trace(self + " AddToSpawnedCrewArray crewMember:" + crewMember)

	; Make sure we're initialized.
	if !spawnedCrew
		spawnedCrew = new Actor[0]
	endif

	spawnedCrew.Add(crewMember)

	; Link them to the spawn marker, so we can remove them from the spawned crew array when hired.
	crewMember.SetLinkedRef(self, LinkGenericCrewSpawnMarker)

	debug.trace(self + " AddToSpawnedCrewArray, array is now: " + spawnedCrew)
endFunction

function RemoveFromSpawnedCrewArray(Actor crewMember)
	debug.trace(self + " RemoveFromSpawnedCrewArray crewMember:" + crewMember)

	int foundIndex = spawnedCrew.Find(crewMember)
	if foundIndex > -1
		spawnedCrew.Remove(foundIndex)

		; Break the link to me, as keeping it can also keep this generic crew persistent.
		; SQ_CrewScript will handle cleaning up this actor from here.
		crewMember.SetLinkedRef(None, LinkGenericCrewSpawnMarker)
	endif
endFunction

function PrepareForRespawn()
	debug.trace(self + " PrepareForRespawn")
	; First, we need to clean up any previously spawned generic crew spawned from this marker that were unhired.
	; SQ_CrewScript will handle cleaning up any generic crew that have already been hired and then unassigned.
	int i = 0
	while i < spawnedCrew.Length
		Actor theCrew = spawnedCrew[i]
		if theCrew.GetCrewAssignment() == None
			theCrew.DisableNoWait()
			theCrew.Delete()
		endif
		i += 1
	endWhile

	debug.trace(self + " PrepareForRespawn: After deleting unassigned crew, array is now: " + spawnedCrew)

	; Clear the spawned crew array data to avoid holding onto references to these actors; after this, all actors
	; in the array previously marked for delete should be successfully deleted.
	ClearSpawnedCrewArray()

	; Allow SQ_Crew_SpawnManager spawn actors from this marker again.
	canSpawnCrew = true
endFunction
