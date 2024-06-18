Scriptname DefaultCollectionAliasParent extends RefCollectionAlias
{Master script for the DefaultCollection scripts.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating/triggering/verbing each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection.}


Group Quest_Properties
	Int Property StageToSet = -1 Auto Const
	{MANDATORY *if* you are setting a quest stage; this is that stage.}

	Int Property PrereqStage = -1 Auto Const
	{<QuestToSetOrCheck> must have this specific stage set for this script's functionality to execute}

	Int Property TurnOffStage = -1 Auto Const
	{If <QuestToSetOrCheck>'s stage >= TurnOffStage, this script's functionality is ignored}

	Int Property TurnOffStageDone = -1 Auto Const
	{If <QuestToSetOrCheck>'s TurnOffStage has been specifically set , this script's functionality is ignored}
EndGroup

Group Script_Specific_Properties
	bool Property xxxPlaceHolderForEmptyGroupxxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group RefCollection_Handling_Properties
	bool Property OnFirstRef = false Const Auto 
	{if true (default) script functionality will exectute when ANY ref in THIS refcollection is affected.
If false, script requires ALL refs in THIS recollection to be affected.}
	
	int Property CountRemainingRequired = 0 Const Auto
	{exectute script functionality when all BUT this many refs are affected.
For example, to set a stage when all but three actors are killed, set this to 3 on the OnDeath script.
NOTE: this is IGNORED if OnFirstRef == True}
	
	GlobalVariable Property TotalRefCountGlobal = none Auto Const
	{This Global will be updated as each reference is affected - it will represent the TOTAL number of references in THIS refcollection}

	GlobalVariable Property AffectedRefCountGlobal = none Auto Const
	{This Global will be updated as each reference is affected - it will represent a count of the refs CURRENTLY in THIS refcollection *who have been affected.*}

	bool Property UpdateCurrentInstanceCountGlobals = true Const Auto
	{Calls UpdateCurrentInstanceGlobal for TotalRefCountGlobal and AffectedRefCountGlobal at start up and AffectedRefCountGlobal when changed.}

	bool Property ClearDisabledRefsOnInit = false auto Const
	{ if TRUE will clear disabled refs OnAliasInit }
EndGroup

Group RefToCheck_Optional_Properties
	bool Property xxxPlaceHolderForEmptyGroup_RefToCheckxxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group LocationToCheck_Optional_Properties
	bool Property xxxPlaceHolderForEmptyGroup_LocationToCheckxxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group Optional_Properties
	Bool Property DoOnce = false Auto Const
	{(Default: false) If true, only execute this script's functionality once. 
NOTE: This must be false if you want to use AdditionalStageToSetWhenAllRefsAffected}

	ConditionForm Property ConditionFormToTest Auto Const
	{If set, this condition form must be true for script to excecute it's functionality}

EndGroup

Group Actor_Only_Properties
{These properties only matter if THIS object is an Actor}
	bool property FailOnDeadActor = false Auto Const
	{(Default: false). If true, and if THIS object is an actor and is dead, ignore this script's functionality.}
EndGroup

Group Debug_Properties
    Bool Property ShowTraces = false Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup

bool Property SkipBusyState = TRUE Auto HIDDEN ;NOTE: unlike other default scripts, we almost NEVER want to go busy and simply skip over processing things, since multiple refs in the collection will need to have their events tested

ObjectReference[] TriggeredRefArray

Event OnAliasInit()
	DefaultScriptFunctions.Trace(self, "OnAliasInit()", ShowTraces)

	if ClearDisabledRefsOnInit
		int disabledCount = RemoveDisabled()
		DefaultScriptFunctions.Trace(self, "OnAliasInit() - removing " + disabledCount + " disabled refs", ShowTraces)
	EndIf

	if TotalRefCountGlobal != None
		TotalRefCountGlobal.SetValue(GetCount())
	EndIf

	UpdateInstanceGlobals()
EndEvent

Event OnAliasChanged(ObjectReference akObject, bool abRemove)
	if TotalRefCountGlobal != None
		TotalRefCountGlobal.SetValue(GetCount())
	endif
	UpdateInstanceGlobals()
EndEvent

Event OnAliasShutdown()
	; clear the array on shutdown
	TriggeredRefArray.Clear()
EndEvent

;Returns true if all refs are triggered
bool Function AddTriggeredRefAndCheckTriggeredArray(ObjectReference TriggeredRef)
	DefaultScriptFunctions.Trace(self, "AddTriggeredRefAndCheckTriggeredArray() TriggeredRef: " + TriggeredRef, ShowTraces)

	bool returnVal = OnFirstRef 

	if returnVal == false

		;create the array if it doesn't exist yet
		if TriggeredRefArray == NONE
			TriggeredRefArray = new ObjectReference[0]
		endif

		;add newly triggered things to the array
		if TriggeredRefArray.Find(TriggeredRef) < 0
			TriggeredRefArray.Add(TriggeredRef)
		endif

		;run through the refcollection (we do this every time in case it's contents have changed) and ensure each thing can be found in the TriggeredRefArray
		int i = 0
		int iMax = GetCount()
		int countFound = 0
		While (i < iMax)
			if TriggeredRefArray.Find(self.GetAt(i)) >= 0
				countFound += 1
			endif
			i += 1
		EndWhile

		DefaultScriptFunctions.Trace(self, "AddTriggeredRefAndCheckTriggeredArray() iMax: " + iMax, ShowTraces)
		DefaultScriptFunctions.Trace(self, "AddTriggeredRefAndCheckTriggeredArray() countFound: " + countFound, ShowTraces)

		if (TotalRefCountGlobal != None)
			TotalRefCountGlobal.SetValue(iMax)
		EndIf
		if (AffectedRefCountGlobal != None)
			AffectedRefCountGlobal.SetValue(countFound)
		EndIf

		UpdateInstanceGlobals()

		if (countFound >= 1 && OnFirstRef) ||  countFound + CountRemainingRequired >= iMax
			returnVal = true
		endif

	endif

	return returnVal

EndFunction

Function UpdateInstanceGlobals()
	if UpdateCurrentInstanceCountGlobals
		if (TotalRefCountGlobal != None)
			GetOwningQuest().UpdateCurrentInstanceGlobal(TotalRefCountGlobal)
		EndIf
		if (AffectedRefCountGlobal != None)
			GetOwningQuest().UpdateCurrentInstanceGlobal(AffectedRefCountGlobal)
		EndIf
	endif
EndFunction

Function CheckAndSetStageAndCallDoSpecificThing(ObjectReference RefCollectionMemberRef, DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams)
	if SkipBusyState == false
		GotoState("Busy")
	EndIf

	ObjectReference RefToCheck = ParentScriptFunctionParams.RefToCheck
	Location LocationToCheck = ParentScriptFunctionParams.LocationToCheck
	Location LocationToCheckOther = ParentScriptFunctionParams.LocationToCheckOther

	if RefToCheck == None ;this is UNEXPECTED!
		DefaultScriptFunctions.Warning(self, "CheckAndSetStageAndCallDoSpecificThing() RefToCheck == NONE. THIS IS UNEXPECTED!!! Using RefCollectionMemberRef as a back up.")
		RefToCheck = RefCollectionMemberRef
	endif

	if LocationToCheck == None ;this isn't entirely unexpected
		DefaultScriptFunctions.Trace(self, "CheckAndSetStageAndCallDoSpecificThing() LocationToCheck == None, using RefCollectionMemberRef.GetCurrentLocation()", ShowTraces)
		LocationToCheck = RefCollectionMemberRef.GetCurrentLocation()
	endif

	Quest QuestToSetOrCheck = GetOwningQuest()
	
	bool isValid = DefaultScriptFunctions.IsValidToSetStage(	CallingObject = self, \
																ShowNormalTrace = ShowTraces, \
																\
																QuestToSet = QuestToSetOrCheck, \
																StageToSet = StageToSet, \
																PrereqStage = PrereqStage, \
																TurnOffStage = TurnOffStage, \
																TurnOffStageDone = TurnOffStageDone, \
																\
																RefToCheck = RefToCheck, \
																PlayerOnly = GetPlayerOnly(), \
																ReferencesToCheckAgainst = GetReferencesToCheckAgainst(), \
																AliasesToCheckAgainst = GetAliasesToCheckAgainst(), \
																FactionsToCheckAgainst = GetFactionsToCheckAgainst(), \
																\
																LocationToCheck = LocationToCheck, \
																LocationToCheckOther = LocationToCheckOther, \
																LocationsToCheckAgainst = GetLocationsToCheckAgainst(), \
																LocationAliasesToCheckAgainst = GetLocationAliasesToCheckAgainst(), \
																LocationMatchIfChild = GetLocationMatchIfChild(), \
																\
																CheckAliveActorOrShip = RefCollectionMemberRef, \
																FailOnDeadActor = FailOnDeadActor, \
																\
																ConditionFormToTest = ConditionFormToTest )

	if isValid
		DoSpecificThingForEachValidRef(RefCollectionMemberRef, ParentScriptFunctionParams)

		if AddTriggeredRefAndCheckTriggeredArray(RefCollectionMemberRef)
			DefaultScriptFunctions.SafeSetStage(CallingObject = self, ShowNormalTrace = ShowTraces, QuestToSet = QuestToSetOrCheck, StageToSet = StageToSet)
			
			;call the DoSpecificThing function that child scripts will override
			;first get an array of refs if the child wants to call DoSpecificThing for each of them:
			ObjectReference[] refsToDoThingsWith = GetRefsToDoSpecificThingsWith()

			;iteratively call DoSpecificThing for each ref in the array
			if refsToDoThingsWith
				int i = 0
				int iMax = refsToDoThingsWith.length
				While (i < iMax)
					bool isLastRef = !(i < iMax)
					DefaultScriptFunctions.Trace(self, "Calling DoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams + ", RefToDoThingWith: " + refsToDoThingsWith[i] + ", isLastRef: " + isLastRef, ShowTraces)
					DoSpecificThing(ParentScriptFunctionParams, RefToDoThingWith = refsToDoThingsWith[i], LastRefToDoThingWith = isLastRef)
					i += 1
				EndWhile
			
			else ;the array is empty, just call DoSpecificThing once
				DefaultScriptFunctions.Trace(self, "Calling DoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams + ", RefToDoThingWith: " + NONE, ShowTraces)
				DoSpecificThing(ParentScriptFunctionParams, RefToDoThingWith = None, LastRefToDoThingWith = true)
			endif
		endif

		if DoOnce
			GotoState("Done")
		endif
	endif
	
	if GetState() == "Busy"
		GotoState("")
	endif
	
EndFunction

;Called by Children Scripts when they need to register for On Hit events
Function RegisterOnHitFilters()
	DefaultScriptFunctions.Trace(self, "RegisterForHitFilters", ShowTraces)
	
	if GetPlayerOnly()
		RegisterForHitEvent(self, Game.GetPlayer())
	else
		RegisterForHitEventAggressorRefArray(self, GetReferencesToCheckAgainst())
		RegisterForHitEventAggressorRefAliasArray(self, GetAliasesToCheckAgainst())
		RegisterForHitEventAggressorFactionArray(self, GetFactionsToCheckAgainst())
	endif
EndFunction


;OVERRIDE THIS IN CHILD SCRIPT
;This function should usually return the value of the child script's "PlayerOnly" property.
;(We do this because different children will want different default values for that property and so need to define the property on themselves, but we want all the functions to live on the inital ancestor parent script.)
bool Function GetPlayerOnly()
	return false
EndFunction

;OVERRIDE THIS IN CHILD SCRIPT
;This function should usually return the value of the child script's "ReferencesToCheckAgainst" property.
;(We do this because different children may or may not want these properties, but we want all the functions to live on the inital ancestor parent script.)
ObjectReference[]  Function GetReferencesToCheckAgainst()
	return None
EndFunction

;OVERRIDE THIS IN CHILD SCRIPT
;This function should usually return the value of the child script's "AliasesToCheckAgainst" property.
;(We do this because different children may or may not want these properties, but we want all the functions to live on the inital ancestor parent script.)
ReferenceAlias[]  Function GetAliasesToCheckAgainst()
	return None
EndFunction

;OVERRIDE THIS IN CHILD SCRIPT
;This function should usually return the value of the child script's "FactionsToCheckAgainst" property.
;(We do this because different children may or may not want these properties, but we want all the functions to live on the inital ancestor parent script.)
Faction[]  Function GetFactionsToCheckAgainst()
	return None
EndFunction

;OVERRIDE THIS IN CHILD SCRIPT
;This function should usually return the value of the child script's "LocationsToCheckAgainst" property.
;(We do this because different children may or may not want these properties, but we want all the functions to live on the inital ancestor parent script.)
Location[]  Function GetLocationsToCheckAgainst()
	return None
EndFunction

;OVERRIDE THIS IN CHILD SCRIPT
;This function should usually return the value of the child script's "LocationAliasesToCheckAgainst" property.
;(We do this because different children may or may not want these properties, but we want all the functions to live on the inital ancestor parent script.)
LocationAlias[]  Function GetLocationAliasesToCheckAgainst()
	return None
EndFunction

;OVERRIDE THIS IN CHILD SCRIPT
;This function should usually return the value of the child script's "LocationMatchIfChild" property.
;(We do this because different children may or may not want these properties, but we want all the functions to live on the inital ancestor parent script.)
bool Function GetLocationMatchIfChild()
	return None
EndFunction


;OVERRIDE THIS IN CHILD SCRIPT
;for each item in here, DoSpecificThing will be called, with each reference in the array as DoSpecificThing's RefToDoThingWith param.
ObjectReference[] Function GetRefsToDoSpecificThingsWith()
	return None
EndFunction

;OVERRIDE THIS IN CHILD SCRIPT
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	;this should be overridden in child script
EndFunction

;OVERRIDE THIS IN CHILD SCRIPT
Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams)
	;this should be overridden in child script
EndFunction

State Busy
	Function CheckAndSetStageAndCallDoSpecificThing(ObjectReference RefCollectionMemberRef, DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams)
		DefaultScriptFunctions.Trace(self, "CheckAndSetStageAndCallDoSpecificThing() in BUSY state. Doing nothing.", ShowTraces)
	EndFunction

	Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams)
		DefaultScriptFunctions.Trace(self, "DoSpecificThingForEachValidRef() in BUSY state. Doing nothing.", ShowTraces)
	EndFunction
EndState

State Done
	Function CheckAndSetStageAndCallDoSpecificThing(ObjectReference RefCollectionMemberRef, DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams)
		DefaultScriptFunctions.Trace(self, "CheckAndSetStageAndCallDoSpecificThing() in DONE state. Doing nothing.", ShowTraces)
	EndFunction

	Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams)
		DefaultScriptFunctions.Trace(self, "DoSpecificThingForEachValidRef() in DONE state. Doing nothing.", ShowTraces)
	EndFunction
EndState





