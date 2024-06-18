Scriptname DefaultRefParent extends ObjectReference
{Master script for the DefaultRef scripts.
<RefToCheck> is the reference activating/triggering/verbing THIS Object.
<LocationToCheck> is the current location of THIS object.}

Group Quest_Properties
	Quest Property QuestToSetOrCheck Auto Const
	{MANDATORY *if* you are setting or checking a quest stage; this is that quest.}

	Int Property StageToSet = -1 Auto Const
	{MANDATORY *if* you are setting a quest stage; this is that stage.}

	Int Property PrereqStage = -1 Auto Const
	{QuestToSetOrCheck must have this specific stage set for this script's functionality to execute}

	Int Property TurnOffStage = -1 Auto Const
	{If QuestToSetOrCheck's stage >= TurnOffStage, this script's functionality is ignored}

	Int Property TurnOffStageDone = -1 Auto Const
	{If QuestToSetOrCheck's TurnOffStage has been specifically set , this script's functionality is ignored}
EndGroup

Group Script_Specific_Properties
	bool Property xxxPlaceHolderForEmptyGroupxxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
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
	{(Default: false) If true, only execute this script's functionality once}

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

;HIDDEN PROPERTIES TO BE SET BY CHIDLREN
bool Property SkipBusyState = false Auto HIDDEN ;some children we might not want to go into a busy states, triggerboxes for example


Function CheckAndSetStageAndCallDoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams)
	if SkipBusyState == false
		GotoState("Busy")
	EndIf

	ObjectReference RefToCheck = ParentScriptFunctionParams.RefToCheck
	Location LocationToCheck = ParentScriptFunctionParams.LocationToCheck
	Location LocationToCheckOther = ParentScriptFunctionParams.LocationToCheckOther

	if RefToCheck == None ;this is UNEXPECTED!
		DefaultScriptFunctions.Warning(self, "CheckAndSetStageAndCallDoSpecificThing() RefToCheck == NONE. THIS IS UNEXPECTED!!! Using self as a back up.")
		RefToCheck = self 
	endif

	if LocationToCheck == None ;this isn't entirely unexpected
		DefaultScriptFunctions.Trace(self, "CheckAndSetStageAndCallDoSpecificThing() LocationToCheck == None, using GetCurrentLocation()", ShowTraces)
		LocationToCheck = GetCurrentLocation()
	endif

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
																CheckAliveActorOrShip = self, \
																FailOnDeadActor = FailOnDeadActor, \
																\
																ConditionFormToTest = ConditionFormToTest )

	if isValid
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


State Busy
	Function CheckAndSetStageAndCallDoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams)
		DefaultScriptFunctions.Trace(self, "CheckAndSetStageAndCallDoSpecificThing() in BUSY state. Doing nothing.", ShowTraces)
	EndFunction
EndState

State Done
	Function CheckAndSetStageAndCallDoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams)
		DefaultScriptFunctions.Trace(self, "CheckAndSetStageAndCallDoSpecificThing() in DONE state. Doing nothing.", ShowTraces)
	EndFunction
EndState