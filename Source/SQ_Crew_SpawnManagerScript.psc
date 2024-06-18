Scriptname SQ_Crew_SpawnManagerScript extends Quest


Group Autofill
	ReferenceAlias Property SpawnMarker Mandatory Const Auto
	{autofill}

	RefCollectionAlias Property Alias_SpawnedCrewCollection Mandatory Const Auto
	{autofill; REMINDER: these are initially disabled refs}

	Keyword property LinkGenericCrewSpawnMarker Mandatory Const auto
	{autofill; the keyword to link spawned crew members to the spawn marker}

	int property StopStage = 9999 const auto
	{ The stage to set to shut down this quest. }
EndGroup

Group EnableChances
	int[] Property EnableChances Mandatory Const Auto
	{chance for each roll to enable one of the refs in Alias_SpawnedCrewCollection}
EndGroup

;called by startup stage fragment
Function RollToEnableRefs()
	CrewSpawnerScript spawnMarkerRef = SpawnMarker.GetReference() as CrewSpawnerScript

	if spawnMarkerRef.GetCanSpawnCrew() == false
		Trace(self, "RollToEnableRefs() spawnMarkerRef.GetCanSpawnCrew() == false, aborting.")
		SetStopStage()
		return
	endif

	Trace(self, "RollToEnableRefs() spawnMarkerRef: " + spawnMarkerRef + ", spawnMarkerRef.GetCurrentLocation()" + spawnMarkerRef.GetCurrentLocation())

	int max = spawnMarkerRef.MaxNumberToSpawn
	Faction CrewCrimeFaction = spawnMarkerRef.CrewCrimeFaction

	Trace(self, "RollToEnableRefs() max: " + max)

	ObjectReference[] crewArray = Alias_SpawnedCrewCollection.GetArray()
	Trace(self, "RollToEnableRefs() crewArray: " + max)
	Trace(self, "RollToEnableRefs() EnableChances: " + EnableChances)

	int i = 0
	int iMax = Math.min(max, crewArray.Length) as int

	if iMax > EnableChances.Length
		Warning(self, "RollToEnableRefs() iMax > EnableChances.Length, forcing max to EnableChances.Length")
		iMax = EnableChances.Length
	endif

	While (i < iMax)
		bool success = Game.GetDieRollSuccess(EnableChances[i])
		
		if success
			Actor theCrew = crewArray[i] as Actor
			Trace(self, "RollToEnableRefs() success! Enabling crewArray[i]: " + crewArray[i])
			theCrew.Enable() ; Purposely call .Enable() as further code relies on the 3D Loaded state of this Actor.
			theCrew.SetCrimeFaction(CrewCrimeFaction)

			; Add them to the Spawn Marker's spawned crew array, so they can be cleaned up later if unhired.
			spawnMarkerRef.AddToSpawnedCrewArray(theCrew)

			; Try to evaluate their voicetype.
			Trace(self, "RollToEnableRefs() Trying to set crew voice type")
			(theCrew as CrewRandomVoiceScript).TryToSetCrewVoiceType()
		endif

		i += 1
	EndWhile

	spawnMarkerRef.StartRespawnTimer()
	SetStopStage()

	Trace(self, "RollToEnableRefs() done")
EndFunction

function SetStopStage()
	SetStage(StopStage)
endFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Crew",  string SubLogName = "SpawnManager", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Crew",  string SubLogName = "SpawnManager", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction