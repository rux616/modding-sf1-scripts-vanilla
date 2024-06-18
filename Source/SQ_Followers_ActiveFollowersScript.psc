Scriptname SQ_Followers_ActiveFollowersScript extends RefCollectionAlias
{Script attached to ActiveFollowers refcollection alias.
Currently it is managing the COM_SandboxDistancePollSuccessful which is used to turn on/off the sandboxing while player is loitering}


GlobalVariable Property COM_SandboxDistancePollSuccessful Mandatory Const Auto 
{Used to conditionalize sandbox package}

;these will be "enums" for the COM_SandboxDistancePollSuccessful global
int iPollUnsetOrNotYetSuccess = 0 Const ;not allowed to sandbox (yet)
int iPollSuccess = 1 Const ;allowed to sandbox (because at least one active follower has had a chance to catch up and hang around the player.)


Actor[] activeFollowers

float PollSuccess_Distance = 5.0 Const
int Timer_ID_DistancePoll = 1 Const
float Timer_Dur_DistancePoll = 10.0 Const
int PollSuccessCount
int PollSuccessesNeeded = 3 Const

 Event OnAliasInit()
	Actor PlayerRef = Game.GetPlayer()
	
	Trace(self, "OnAliasInit() registering for OnPlayerLoitering events")
	RegisterForRemoteEvent(PlayerRef, "OnPlayerLoiteringBegin")
	RegisterForRemoteEvent(PlayerRef, "OnPlayerLoiteringEnd")

	activeFollowers = GetArray() as Actor[]
EndEvent

bool activeFollowersArrayLock
Event OnAliasChanged(ObjectReference akObject, bool abRemove) 
	While (activeFollowersArrayLock)
		Utility.Wait(0.1)
	EndWhile
	activeFollowersArrayLock = true

	Trace(self, "OnAliasChanged() akObject: " + akObject + ", abRemove: " + abRemove + ", GetCurrentPackage(): " + (akObject as actor).GetCurrentPackage())
	activeFollowers = GetArray() as Actor[]

	activeFollowersArrayLock = false
EndEvent

Event OnTimer(int aiTimerID)
	Trace(self, "OnTimer() aiTimerID: " + aiTimerID)

	if aiTimerID == Timer_ID_DistancePoll
		bool shouldKeepPolling = KeepPolling()
		Trace(self, "OnTimer() shouldKeepPolling: " + shouldKeepPolling)

		if shouldKeepPolling
			StartTimer(Timer_Dur_DistancePoll, Timer_ID_DistancePoll)
		else
			;at least one of the followers have caught up to player and have polled as being close enough for long enough, all followers are now allowed to sandbox.
			COM_SandboxDistancePollSuccessful.SetValue(iPollSuccess)
			EvaluatePackageForAll()
		endif
	endif
EndEvent

Event Actor.OnPlayerLoiteringBegin(Actor akSenderRef)
	Trace(self, "OnPlayerLoiteringBegin() akSenderRef: " + akSenderRef)

	StartTimer(Timer_Dur_DistancePoll, Timer_ID_DistancePoll)
	EvaluatePackageForAll()
EndEvent

Event Actor.OnPlayerLoiteringEnd(Actor akSenderRef)
	Trace(self, "OnPlayerLoiteringEnd() akSenderRef: " + akSenderRef)
	
	CancelTimer(Timer_ID_DistancePoll)
	PollSuccessCount = 0
	COM_SandboxDistancePollSuccessful.SetValue(iPollUnsetOrNotYetSuccess)
	EvaluatePackageForAll()
EndEvent

bool Function KeepPolling()
	While (activeFollowersArrayLock)
		Utility.Wait(0.1)
	EndWhile
	activeFollowersArrayLock = true

	Trace(self, "KeepPolling() ")
		
	Actor PlayerRef = Game.GetPlayer()

	bool returnVal = true

	;once the player starts loitering, we need to make sure the follower catches up for awhile before they are allowed to sandbox again,
	;otherwise if the player waits for them, they will immmediately start sandboxing.
	;For simplicity, and because the common case is a single follower, as long as at least one follower is the near the player for a while,
	;then they can all sandbox
	int i = 0
	While (i < activeFollowers.length && returnVal == true)
		ObjectReference nearbyFollower 
		
		if activeFollowers[i].GetDistance(PlayerRef) <= PollSuccess_Distance
			PollSuccessCount += 1
			Trace(self, "OnKeepPollingTimer() nearby follower activeFollowers[i]: " + activeFollowers[i] + ", PollSuccessCount: " + PollSuccessCount + ", PollSuccessesNeeded: " + PollSuccessesNeeded)
			if PollSuccessCount >= PollSuccessesNeeded
				PollSuccessCount = 0
				returnVal = false
			endif
		endif

		i += 1
	EndWhile

	Trace(self, "KeepPolling() returnVal: " + returnVal)

	activeFollowersArrayLock = false
	return returnVal
EndFunction



Function EvaluatePackageForAll()
	While (activeFollowersArrayLock)
		Utility.Wait(0.1)
	EndWhile
	activeFollowersArrayLock = true

	Trace(self, "EvaluatePackageForAll() ")
	int i = 0
	While (i < activeFollowers.length)
		Trace(self, "EvaluatePackageForAll() calling EvaluatePackage() for activeFollowers[i]: " + activeFollowers[i])
		activeFollowers[i].EvaluatePackage()
		i += 1
	EndWhile

	activeFollowersArrayLock = false
EndFunction


Event OnPackageStart(ObjectReference akSenderRef, Package akNewPackage)
	Trace(self, "OnPackageStart() akSenderRef: " + akSenderRef + ", akNewPackage: " + akNewPackage)
EndEvent

Event OnPackageChange(ObjectReference akSenderRef, Package akOldPackage)
	Trace(self, "OnPackageChange() akSenderRef: " + akSenderRef + ", akOldPackage: " + akOldPackage)
EndEvent

Event OnPackageEnd(ObjectReference akSenderRef, Package akOldPackage)
	Trace(self, "OnPackageEnd() akSenderRef: " + akSenderRef + ", akOldPackage: " + akOldPackage)
EndEvent


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Followers",  string SubLogName = "ActiveFollowers", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Followers",  string SubLogName = "ActiveFollowers", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction