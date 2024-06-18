Scriptname DefaultAliasOnShipTakeOff extends DefaultAliasParent Default
{Sets stage when THIS Alias takes off.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<LocationToCheck> is the current location of THIS Alias's reference.}

;**************************************************************************************************************
;*************************	   <BEGIN> LocationToCheck Properties	  *************************
;**************************************************************************************************************
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
;*************************	  	<END> LocationToCheck Properties		  *************************
;**************************************************************************************************************


Group Script_Specific_Properties
	Bool Property SetStageWhenTakeOffComplete = true Auto Const
	{If true (default) stage will be set when take of is complete. If false, stage will be set when take of begins.}
EndGroup


Event OnShipTakeOff(bool abComplete)
	if SetStageWhenTakeOffComplete == abComplete
		DefaultScriptFunctions.Trace(self, "OnShipTakeOff() abComplete: " + abComplete, ShowTraces)

		DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = TryToGetCurrentLocation())
		DefaultScriptFunctions.Trace(self, "OnShipTakeOff() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
		CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)		
	endif
EndEvent