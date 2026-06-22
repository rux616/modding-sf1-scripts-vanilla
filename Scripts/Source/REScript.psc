Scriptname REScript extends Quest
{Extends Quest. Used for Random Encounter quests, has common properties, functions, etc.}

REParentScript Property RE_Parent Auto mandatory const
{MANDATORY: All RExx quests must set this property. Pointer to REParentScript on REParent Quest}

RETriggerScript Property myTrigger Auto Hidden
{The trigger associated with this RE.}

ReferenceAlias Property MapMarker auto Const
{ OPTIONAL: map marker }

group Registration
	ReferenceAlias[] Property RegisteredAliases Auto hidden
	{ leave empty - this will get filled in at runtime }

	RefCollectionAlias[] Property RegisteredCollectionAliases Auto hidden
	{ leave empty - this will get filled in at runtime }

	bool Property StopQuestWhenAliasesUnloaded = False auto
	{Default = true, once all the aliases are unloaded, the quest should stop}

	bool Property StopQuestWhenAliasesDead = False auto
	{Default = false, once all the aliases are dead, the quest should stop}

	bool Property StopQuestWhenPlayerLeavesPlanet = True auto
	{Default = true, once player is not on planet, quest should stop }

	int Property StopStage = -1 auto const
	{ optional - if left at -1, Stop will be called on the quest; otherwise, this stage will be set when the quest wants to "Stop"
		this is for special cases where you actually need the quest to stay running }
endGroup

; These properties are used to track deaths and automatically set a stage when the specified "dead count" is reached.
; You can set up multiple groups to track using the arrays, and setting the correct GroupIndex on the alias's REAliasScripts.
struct DeadCount
	int groupSize
	int stageToSet
	string description
	int currentCount
endStruct

DeadCount[] Property DeadCountGroups Auto
{ OPTIONAL: used to track dead counts of multiple groups for quest purposes
  If using, set up this array with the data for each group:
	groupSize: total number of actors in group
	stageToSet: quest stage to set when dead count reaches groupSize
	description: Optional - description of each group
}

group Cooldown
	GlobalVariable Property CooldownTimestamp auto const
	{ OPTIONAL - if provided, this will be set with the timestamp of gameDaysPassed + cooldownHours when the player encounters this RE }

	float property cooldownHours = 24.0 auto
	{ how many hours to add to current time when CooldownTimestamp is set? }

	bool property setCooldownOnLoad = true auto const
	{ default - set cooldown when trigger loads 
		if you set this to false, quest will need to call SetCooldown() from a quest stage }
EndGroup

group Timers
	; Properties for timers
	int[] Property TimerStages Auto const
	{ quest stages when the timer with ID matching the array index is received
	for example, if you start timer 0, the stage in TimerStages[0] will be set when that timer expires
	}

	;Property for Trigger reset
	bool Property SetResetTimer = true Auto Const
	{ Should this quest set the Reset Timer on the RETriggerScript
	}
EndGroup

Group Traces_Settings 
	{Trace Severity adjusts how many things are output to the log: ... Genesis\Build\PC\Logs\Script\User}
	bool property ShowTraces = True Auto Const
	{If set to FALSE, all other Trace options are ignored.}
	bool property TerseLog = True Auto Const 
	{If set to TRUE, minimizes the output to the log for each printed line.}
	bool property DebugMode = True Auto Const 
	{When True = DebugMode Active. Adds verbose and thorough debugging traces when other Trace settings permit them.
	e.g. if you have Traces turned off for Objects, DebugMode wouldn't display extra Debug data about Objects even if DebugMode was on.}
EndGroup    

Group Log_Names 
	String Property LocalScriptName     = "REScript" Auto
	{This should remain as-is for log purposes. This is used to provide you with a more succinct log print-out.}
	String Property MainLogName         = "OverlayEncounters" Auto const
	{OPTIONAL: Modify with your specific OE Name, if desired. This is the name of your log in Genesis\Build\PC\Logs\Script\User}
	String Property SubLogName          = "Warnings" Auto const
	{OPTIONAL: Leave as Warnings -- this appends to the MainLogName with its own file for serious issues.}
EndGroup


;	Script Variables
int startupTimerID = 99	const		; unique ID for quest startup timer
float startupTimerLength = 30.0	const	; length of startup timer in seconds - how long after quest starts does it register for cleanup events?
bool property bFinishedOnStoryEvent = false auto hidden	; gets set to true after OnStoryScript event finishes - blocks Startup function from proceeding

; Called by OnAliasInit in REAliasScript
function RegisterAlias(ReferenceAlias newAlias)
	if !RegisteredAliases
		; create the alias array
		RegisteredAliases = new ReferenceAlias[0]
	endif
	RegisteredAliases.Add(newAlias)
EndFunction

; Called by OnInit in RECollectionAliasScript
function RegisterCollectionAlias(RefCollectionAlias newCollectionAlias)
	if !RegisteredCollectionAliases
		; create the alias array
		RegisteredCollectionAliases = new RefCollectionAlias[0]
	endif
	RegisteredCollectionAliases.Add(newCollectionAlias)
EndFunction

; on startup, tell my trigger that a quest has started
Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
	Trace(self, "OnStoryScript akRef1=" + akRef1)
	
	; Set Trigger locally, then SetTrigger
	myTrigger = akRef1 as RETriggerScript 
	SetTrigger(myTrigger)

	; done with this event - allow Startup to proceed
	bFinishedOnStoryEvent = true
endEvent

; Tell Trigger that a Quest has started. Formerly Startup()
Event OnQuestStarted()
	; Register any unique trace data as early as possible.
    
	If (Self as OEScript)
		LocalScriptName = "OEScript"
	EndIf 

	DefineCustomLogs() ;this must happen before Trace() calls, because the setup in this function is required for trace function to work

	Trace(Self, "*** OnQuestStarted " + LocalScriptName + " *** ")
	; failsafe counter
	int failsafeCounter = 20
	while bFinishedOnStoryEvent == false && failsafeCounter > 0
		Trace(self, LocalScriptName + " Startup - waiting for OnStoryScript to finish...")
		utility.wait(0.1)
		failsafeCounter -= 1
	endWhile

	; put this at the end so we don't check for cleanup before we've finished starting up
	StartTimer(startupTimerLength, startupTimerID)

	Trace(Self, "--> UpdateGlobalCooldown()")
	; set global cooldown - next time any random encounter can trigger
	RE_Parent.UpdateGlobalCooldown()

	if setCooldownOnLoad && myTrigger && myTrigger.Is3DLoaded()
		SetCooldown()
	endif
EndEvent

function SetTrigger(RETriggerScript akTrigger)
	myTrigger = akTrigger
	Trace(Self, "START: REScript SetTrigger")
	if myTrigger
		Trace(Self, "REScript myTrigger")
		myTrigger.QuestStarted(self)
		if setCooldownOnLoad
			Trace(Self, "REScript setCooldownOnLoad")
			RegisterForRemoteEvent(myTrigger, "OnLoad")
		endif
	endif
	Trace(Self, "DONE: REScript myTrigger")
endFunction

function SetCooldown()
	if CooldownTimestamp
		float currentGameTime = Utility.GetCurrentGameTime()
		float cooldownDays = cooldownHours/24.0
		CooldownTimestamp.SetValue(currentGameTime + cooldownDays)
		debug.trace(self + " CooldownTimestamp=" + CooldownTimestamp.GetValue())
	endif
EndFunction

Event ObjectReference.OnLoad(ObjectReference akSource)
	if setCooldownOnLoad
		SetCooldown()
	endif
EndEvent

; start timers to trigger TimerStages
function StartTimerForTimerStage(float timerSeconds, int aiTimerID)
	debug.trace(self + " StartTimerForTimerStage seconds=" + timerSeconds + " aiTimerId=" + aiTimerID)
	StartTimer(timerSeconds, aiTimerID)
EndFunction

Event OnTimer(int aiTimerID)
	; startup timer
	if aiTimerID == startupTimerID
		Trace(self, " OnTimer: registering for RECheckForCleanup events")
		RegisterForCustomEvent(RE_Parent, "RECheckForCleanup")
	;user-created timers
	else
		CheckForTimerStage(aiTimerID)
	endif
endEvent

Event OnTimerGameTime(int aiTimerID)
	CheckForTimerStage(aiTimerID)
EndEvent

function CheckForTimerStage(int aiTimerID)
	trace(self, "CheckforTimerStage " + aiTimerID)
	; if quest is running (important), and we have that timer ID in the TimerStages array, set the stage
	if IsRunning() && TimerStages && aiTimerID < TimerStages.length
		Trace(self, " CheckForTimerStage: aiTimerID=" + aiTimerID + ", setting stage " + TimerStages[aiTimerID])
		; set the stage assigned to this timerID
		SetStage(TimerStages[aiTimerID])
	endif
endFunction

;sent by REParentScript but ultimately originating in RETriggerScript
Event REParentScript.RECheckForCleanup(REParentScript akSender, Var[] akArgs)
	Trace(self, " received RECheckForCleanup event")
	CheckForCleanup()
EndEvent

function CheckForCleanup()
	bool shouldShutDown = false

	if StopQuestWhenPlayerLeavesPlanet
		if myTrigger && myTrigger.GetCurrentPlanet() != Game.GetPlayer().GetCurrentPlanet()
			Trace(self, " player on a different planet: calling shutdown")
			shouldShutDown = true
		endif
	endif 

	; do I shut down when all my aliases are unloaded?
	if shouldShutDown == false && (StopQuestWhenAliasesUnloaded || StopQuestWhenAliasesDead)
		debug.trace(self + " StopQuestWhenAliasesUnloaded=" + StopQuestWhenAliasesUnloaded + ", StopQuestWhenAliasesDead=" + StopQuestWhenAliasesDead)

		int iDeadCount = 0
		int iUnloadedCount = 0

		; loop through registered collections
		int iCollectionIndex = 0
		; how many refs are in the collections? we'll count as we go
		int iCollectionRefCount = 0
		int registeredRefCollectionCount = RegisteredCollectionAliases.Length
		while iCollectionIndex < registeredRefCollectionCount
			Trace(self, " RECheckForCleanup: iCollectionIndex=" + iCollectionIndex)
			RefCollectionAlias registeredCollection = RegisteredCollectionAliases[iCollectionIndex]
			int i = 0
			; running total of refs in the collections
			iCollectionRefCount += registeredCollection.GetCount()
			while i < registeredCollection.GetCount()
				ObjectReference myRef = RegisteredCollectionAliases[iCollectionIndex].GetAt(i)
				Actor myActor =  myRef as Actor
				SpaceshipReference myShip = myRef as SpaceshipReference
				; actors and ships can be dead
				if myActor
					if myActor.IsDead() || myActor.IsInFaction(RE_Parent.REIgnoreForCleanup)
						iDeadCount = iDeadCount + 1
					endif
				Else
					; if not an actor, is this a spaceship?
					if myShip
						if myShip.IsDead() || myShip.IsInFaction(RE_Parent.REIgnoreForCleanup)
							iDeadCount = iDeadCount + 1
						endif
					endif
				EndIf

				; any ref can be unloaded
				if !myRef.Is3DLoaded() || (myActor && myActor.IsInFaction(RE_Parent.REIgnoreForCleanup)) || (myShip && myShip.IsInFaction(RE_Parent.REIgnoreForCleanup))
					iUnloadedCount = iUnloadedCount + 1
				endif
				i += 1
			endWhile
			iCollectionIndex = iCollectionIndex + 1
		endWhile

		; loop through registered aliases
		int iAliasIndex = 0
		int registeredAliasCount = RegisteredAliases.Length
		while iAliasIndex < registeredAliasCount
			Trace(self, " RECheckForCleanup: iAliasIndex=" + iAliasIndex)
			ObjectReference myRef = RegisteredAliases[iAliasIndex].GetRef()
			Actor myActor = myRef as Actor
			SpaceshipReference myShip = myRef as SpaceshipReference
			; actors and ships can be dead
			if myActor
				if myActor.IsDead() || myActor.IsInFaction(RE_Parent.REIgnoreForCleanup)
					iDeadCount = iDeadCount + 1
				endif
			Else
				; is this a spaceship?
				if myShip
					if myShip.IsDead() || myShip.IsInFaction(RE_Parent.REIgnoreForCleanup)
						iDeadCount = iDeadCount + 1
					endif
				endif
			EndIf
			; any ref can be unloaded
			if !myRef.Is3DLoaded() || (myActor && myActor.IsInFaction(RE_Parent.REIgnoreForCleanup)) || (myShip && myShip.IsInFaction(RE_Parent.REIgnoreForCleanup))
				iUnloadedCount = iUnloadedCount + 1
			endif
			iAliasIndex = iAliasIndex + 1
		endWhile

		int registeredRefCount = registeredAliasCount + iCollectionRefCount
		Trace(self, "registeredRefCount = " + registeredRefCount + " iDeadCount = " + iDeadCount + " iUnloadedCount = " + iUnloadedCount)
		if StopQuestWhenAliasesDead && iDeadCount >= registeredRefCount
			Trace(self, " all aliases dead: calling shutdown")
			shouldShutDown = true
		endif
		if StopQuestWhenAliasesUnloaded && iUnloadedCount >= registeredRefCount
			Trace(self, " all aliases unloaded: calling shutdown")
			shouldShutDown = true
		endif

	endif

	Trace(self, " CheckForCleanup DONE: shouldShutDown=" + shouldShutDown + " IsRunning=" + IsRunning())
	if shouldShutDown
		Shutdown()
	EndIf

EndFunction

function Shutdown()
	if StopStage > -1
		Trace(self, " Shutdown: calling stop stage " + stopStage)
		setStage(StopStage)
	else
		Trace(self, " Shutdown: no stop stage, stopping quest")
		Stop()
	endif
endFunction

function IncrementDeadCount(int aiGroupIndex = 0)
	DeadCountGroups[aiGroupIndex].currentCount += 1
	if DeadCountGroups[aiGroupIndex].currentCount >= DeadCountGroups[aiGroupIndex].groupSize
		SetStage(DeadCountGroups[aiGroupIndex].stageToSet)
	endif
endFunction

function SetDeadCounts(int index, int newValue)
	DeadCountGroups[index].groupSize = newValue
	if DeadCountGroups[index].currentCount >= DeadCountGroups[index].groupSize
		setStage(DeadCountGroups[index].stageToSet)
	endif
endFunction

function AdjustDeadCounts(int index, int newValue)
	DeadCountGroups[index].groupSize = DeadCountGroups[index].groupSize + newValue
	if DeadCountGroups[index].currentCount >= DeadCountGroups[index].groupSize
		setStage(DeadCountGroups[index].stageToSet)
	endif
endFunction

Function UpdateDeadCountGroupSize(int groupIndex, int newSize)
	DeadCountGroups[groupIndex].groupSize = newSize
EndFunction

Function EnableMapMarker()
	if MapMarker
		MapMarker.TryToEnable()
	EndIf
endFunction

;--------------------------------------------------------------------------------------------------
; TRACE LOGS 
;       Standard Trace Functions for handling logs and other formatting functions for readability. 
;--------------------------------------------------------------------------------------------------
;	define custom logs
	CustomLogs:LogDatum[] logs
	Function DefineCustomLogs() 
		logs = new CustomLogs:LogDatum[0]

		customLogs.AddCustomLog(logs, \
									MainLogName = MainLogName, \
									SubLogName = SubLogName, \
									PrefixTracesWithLogNames = !TerseLog, \
									PrefixTracesWithCallingObject = true, \
									Prefix = LocalScriptName, \
									ShowNormalTraces = DebugMode)
	EndFunction

;	Trace and warning functions
    Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) DebugOnly
		CustomLogs.Trace(logs, CallingObject, asTextToPrint, aiSeverity)
    EndFunction

	Function Warning(ScriptObject CallingObject, string asTextToPrint, bool DebugTrace=False, int aiSeverity=2, bool bShowNormalTrace=false, bool bShowWarning=True, bool bPrefixTraceWithLogNames=True) BetaOnly
		CustomLogs.Warning(logs, CallingObject, asTextToPrint)
	EndFunction