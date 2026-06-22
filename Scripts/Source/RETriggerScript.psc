Scriptname RETriggerScript extends ObjectReference Conditional

{Extends ObjectReference, used to trigger a Wilderness Encounter radiant quest/scene.}

;This trigger script sends a story manager event to start a wilderness or Overlay Encounter. The type of encounter is determined by the EncounterType keyword (which should be set on the base object for simplicity,
;since the markers that are needed by different encounter types are different.)

;Base Object Properties
bool Property TriggerOnLoad = true Auto
{	BASEOBJECT: Should this triggerbox be triggered when it loads instead of when the player enters it?
  	depends on EncounterType - see below}

keyword Property EncounterType Auto const  mandatory
{	BASEOBJECT property - Encounter type keyword to be sent by this trigger
	OVERLAY: triggered OnLoad, with markers inherited by the Overlay itself.
	SCENE: triggered OnLoad, with mainly a static group of markers near the trigger
	TRAVEL: triggered OnTrigger, with widely separated markers (which must not be visible from the trigger)
	CAMP: triggered OnLoad, with markers and static camp clutter
	ASSAULT: triggered OnLoad, building with defensive markers plus distant markers for attackers to spawn at}

keyword[] Property TriggerKeywords auto
{ 	Add keywords you want to add to this trigger.
	Filter for: OETrigger}

REParentScript Property REParent Auto const mandatory
{BASEOBJECT property - REParent quest, used to send cleanup custom event }

;Reference Properties

int Property EventNum = -1 Auto
{REFERENCE property OPTIONAL: Used to start specific encounters - sent as aiValue1}

bool Property EventNumClearedAfterSpawning = True Auto
{REFERENCE property OPTIONAL: default = TRUE; if EventNum is used to spawn a specific encounter, should this be cleared so the next time this trigger activates it picks a random one?}

float Property DaysUntilReset = -1.0 Const Auto
{REFERENCE property OPTIONAL: if set, Trigger will not allow additional keyword events to fire until game hours specified has passed

Hours and minutes expressed as GameDaysPassed:
Hour: 1/24 = .04167
Minute: 1/(24*60) = .0006945
So to add 4 hours would be (.04167 * 4) = 0.17}

;internal properties

Int Property myLocationID auto Hidden				;an integer associated with trigger location (used to be myHoldID) - potentially will be used for location type (urban, rural, coastal, road, etc.)

bool Property inStateOff auto Hidden Conditional		;Provides a way for condition functions to query the state of a specific trigger.
											;Used, for example, by DN123 - Skylanes, which needs to ensure its event will fire when its trigger loads.

bool Property HasBeenInitialized auto Conditional ;Has this trigger been initialized before?

; 	Script Variables 
	Quest Property myQuest auto Hidden					; record what quest was started by this trigger, for debugging and use by REChokepointTriggerScript.
	bool keywordsInitialized 			= False
	float TriggerResetTimer 			= 0.0

; 	Log Variables
	String property LocalScriptName 	= "RETriggerScript"	auto hidden		; Filled by OEScript, if used.
	String property MainLogName     	= "" auto hidden					; Filled by OEScript, if used.
	String property SubLogName      	= "" auto hidden					; Filled by OEScript, if used.
	bool property DebugMode 			= False auto hidden					; Filled by OEScript, if used.
	bool property TerseLog 				= False auto hidden					; Filled by OEScript, if used.	

; 	Setup Functions
	Event OnInit()
		DefineCustomLogs()
	EndEvent

	function InitKeywords()
		if keywordsInitialized == false
			keywordsInitialized = true
			; add any keywords
			int i = 0
			while (i < TriggerKeywords.length)
				AddKeyword(TriggerKeywords[i])
				i += 1
			endwhile
		endif
	EndFunction

;	State Functionality
	State Off
		Event OnBeginState(string asOldState)
			Trace(Self, "STATE: OnBeginState")
			inStateOff = True
		EndEvent

		Event OnEndState(string asNewState)
			Trace(Self, "STATE: OnEndState")
			inStateOff = False
		EndEvent
	EndState

	State triggered
		; trigger has fired event - waiting for a quest to set to Off (meaning a quest has successfully started), or to go back to On (meaning a quest failed to start)
	endState

	Auto State On
		Event OnTriggerEnter(ObjectReference akActionRef)
			Trace(Self, "OnTriggerEnter: TriggerOnLoad=" + TriggerOnLoad + " akActionRef=" + akActionRef)
			if TriggerOnLoad == false && akActionRef == Game.GetPlayer()
				StartEncounter()
			endif
		EndEvent

		Event OnCellLoad()
			Trace(Self, " 'on' state - OnCellLoad")
			REParent.SendCleanupEvent()

			if TriggerOnLoad
				Trace(Self, "TriggerOnLoad - starting encounter")
				StartEncounter()
			EndIf
		EndEvent
	endState

; 	Encounter Handler
	function StartEncounter(Keyword overrideKeyword = NONE)
		Trace(Self, "StartEncounter: changing state to Triggered")
		GoToState("Triggered")

		if IsDisabled()	;Short circuit if i'm disabled
			Trace(Self, "isDisabled - changing state to On") 
			GoToState("On")
			Return
		EndIf

		;Trace(Self, "Starting encounter. Days until reset: "+ DaysUntilReset +", TriggerResetTimer: "+ TriggerResetTimer)
		;Trace(Self, "Current game time: "+ Utility.GetCurrentGameTime())

		;If this trigger doesn't use the Trigger Reset Timer, or the timer has been passed, trigger
		if DaysUntilReset == -1.0 || Utility.GetCurrentGameTime() >= TriggerResetTimer
			Trace(Self, "StartEncounter: getting ready to send script event to story manager")

			; make sure keywords initialized
			InitKeywords()

			Trace(Self, "Player distance from trigger: " + Game.GetPlayer().GetDistance(self))

			; send story event
			keyword storyKeyword = EncounterType
			if overrideKeyword
				storyKeyword = overrideKeyword
			EndIf

			; if encounter fails to start, go back to "On"
			Trace(Self, "Sending EncounterType Keyword: " + storyKeyword + " myLocationID: " + myLocationID + " EventNum: " + EventNum)
			Quest[] startedQuests = storyKeyword.SendStoryEventAndWait(GetCurrentLocation(), Self, None, myLocationID, EventNum)
			if startedQuests.Length == 0
				Trace(Self, "No quest started - reset state back to On")
				GoToState("On")
			Else
				Trace(Self, "Started quest: " + startedQuests)
			endif
			if EventNumClearedAfterSpawning == True
				Trace(Self, "EventNumClearedAfterSpawning TRUE")
				EventNum = -1
			EndIf

		endif
		Trace(Self, "StartEncounter Done")
	EndFunction

;	Called by REScript to initialize log data.
	function QuestStarted(REScript akQuest=None)
		HasBeenInitialized = True		;TODO: Is there a purpose for this anymore?
		bool pResetTimer

		Trace(Self, "RETriggerScript QuestStarted")
		Trace(Self, "Quest Started. Called " + LocalScriptName)

		pResetTimer = akQuest.SetResetTimer
		Trace(Self, "SetResetTimer set.")

		;If this quest has a reset timer, set it now
		Trace(self, "Quest started. Days until reset: "+ DaysUntilReset +", TriggerResetTimer: "+ TriggerResetTimer)
		If DaysUntilReset > -1 && pResetTimer
			TriggerResetTimer = Utility.GetCurrentGameTime() + DaysUntilReset
		EndIf 

		GotoState("Off")
	EndFunction

; 	ReArming
	function ReArmTrigger()
		GotoState("On")
		Trace(self, " ReArmTrigger")
	EndFunction

;--------------------------------------------------------------------------------------------------
; TRACE LOGS 
;       Standard Trace Functions for handling logs and other formatting functions for readability. 
;--------------------------------------------------------------------------------------------------
;	define custom logs
	CustomLogs:LogDatum[] logs
	Function DefineCustomLogs(String akLocalScriptName="")
		logs = new CustomLogs:LogDatum[0]

		If akLocalScriptName != ""
			LocalScriptName = akLocalScriptName
		EndIf 

		;Local Script - Always
		MainLogName = LocalScriptName
		customLogs.AddCustomLog(logs, MainLogName, SubLogName, PrefixTracesWithLogNames = true, PrefixTracesWithCallingObject = true, Prefix = "", ShowNormalTraces = true)
		Trace(self, "DefineCustomLogs DONE")
	EndFunction    

;	Trace and warning functions
    Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) DebugOnly
		CustomLogs.Trace(logs, CallingObject, asTextToPrint, aiSeverity)
    EndFunction

	Function Warning(ScriptObject CallingObject, string asTextToPrint, bool DebugTrace=False, int aiSeverity=2, bool bShowNormalTrace=false, bool bShowWarning=True, bool bPrefixTraceWithLogNames=True) BetaOnly
		CustomLogs.Warning(logs, CallingObject, asTextToPrint)
	EndFunction