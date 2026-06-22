Scriptname DefaultEnableDisableOnDeathScript extends DefaultActorParent default
{Enables/Disables THIS actor's linked ref, when THIS actor dies.
<RefToCheck> is the killer of THIS actor's reference.
<LocationToCheck> is the current location of THIS actor's reference.}

Group Script_Specific_Properties
	Bool Property UseOnDyingInstead = false Auto Const
	{(Default: false) If true, stage will be set when OnDying() event is sent. If false, stage will be sent with OnDeath() event is sent.}

	Keyword Property LinkedRefKeyword Auto Const
	{The Keyword of the LinkedRef you want to activate when this activated.}

	bool Property  EnableLinkedRef = true Const Auto
	{If true (default), enable THIS actor's linkedref when THIS actor dies. If false, disable THIS actor's linked ref when THIS actor dies.}
EndGroup

;**************************************************************************************************************
;*************************	   <BEGIN> RefToCheck And LocationToCheck Properties	  *************************
;**************************************************************************************************************
Group RefToCheck_Optional_Properties
	Bool Property PlayerOnly = false Auto Const
	{If true, <RefToCheck> must be player and all other <RefToCheck> properties will be IGNORED.}

	ObjectReference[] property ReferencesToCheckAgainst Auto Const
	{<RefToCheck> must be one of these references. IGNORED if PlayerOnly is true.}

	ReferenceAlias[] property AliasesToCheckAgainst Auto Const
	{<RefToCheck> must be one in one of these references. IGNORED if PlayerOnly is true.}

	Faction[] property FactionsToCheckAgainst Auto Const
	{<RefToCheck> must be in one of these factions. IGNORED if PlayerOnly is true.}
EndGroup

Group LocationToCheck_Optional_Properties
	Location[] property LocationsToCheckAgainst Auto Const
	{<LocationToCheck> must be one of these references}

	LocationAlias[] property LocationAliasesToCheckAgainst Auto Const
	{<LocationToCheck> must be in one of these location aliases}

	bool property LocationMatchIfChild = false Auto Const
	{(Default: false) If true, <LocationToCheck> may be a child of locations in LocationsToCheck or LocationAliasesToCheck}
EndGroup

;OVERRIDEN PARENT FUNCTONS
;These function should usually return the value of the child script's property of the same name.
;(We do this because different children will want different default values for that property and so need to define the property on themselves, but we want all the functions to live on the inital ancestor parent script.)
bool Function GetPlayerOnly()
	return PlayerOnly
EndFunction
ObjectReference[]  Function GetReferencesToCheckAgainst()
	return ReferencesToCheckAgainst
EndFunction
ReferenceAlias[]  Function GetAliasesToCheckAgainst()
	return AliasesToCheckAgainst
EndFunction
Faction[]  Function GetFactionsToCheckAgainst()
	return FactionsToCheckAgainst
EndFunction
Location[]  Function GetLocationsToCheckAgainst()
	return LocationsToCheckAgainst
EndFunction
LocationAlias[]  Function GetLocationAliasesToCheckAgainst()
	return LocationAliasesToCheckAgainst
EndFunction
bool Function GetLocationMatchIfChild()
	return LocationMatchIfChild
EndFunction
;**************************************************************************************************************
;*************************	  	<END> RefToCheck And LocationToCheck Properties		  *************************
;**************************************************************************************************************


Event OnDeath(ObjectReference akKiller)
	if UseOnDyingInstead == false
		DeathComplete(akKiller)
	endif
EndEvent

Event OnDying(ObjectReference akKiller)
	if UseOnDyingInstead == true
		DeathComplete(akKiller)
	endif
EndEvent

Function DeathComplete(ObjectReference akKiller)
	DefaultScriptFunctions.Trace(self, "OnDying() akKiller: " + akKiller, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akKiller, LocationToCheck = GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnDying() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)		
EndFunction


;Reimplementing Parent's empty function
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	DefaultScriptFunctions.Trace(self, "DoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	if EnableLinkedRef
		DefaultScriptFunctions.Trace(self, "DoSpecificThing() Enabling GetLinkedRef(LinkedRefKeyword): " + GetLinkedRef(LinkedRefKeyword), ShowTraces)
		GetLinkedRef(LinkedRefKeyword).Enable()
	else
		DefaultScriptFunctions.Trace(self, "DoSpecificThing() Disabling GetLinkedRef(LinkedRefKeyword): " + GetLinkedRef(LinkedRefKeyword), ShowTraces)
		GetLinkedRef(LinkedRefKeyword).Enable()
	endif
EndFunction