Scriptname DefaultAliasOnLocationChange extends DefaultAliasParent
{Sets stage if a THIS Alias's reference is activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<LocationToCheck> is either the New or Old location.}

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
	bool Property CheckNewLocation = true Const Auto
	{if true (default), <LocationToCheck> is the New Location. If false, <LocationToCheck> is the Old Location}
EndGroup

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Location LocToCheck = akOldLoc
	Location OtherLocToCheck = akNewLoc
	if CheckNewLocation
		LocToCheck = akNewLoc
		OtherLocToCheck = akOldLoc
	endif

	DefaultScriptFunctions.Trace(self, "OnLocationChange() akOldLoc: " + akOldLoc + ", akNewLoc: " + akNewLoc + ", LocToCheck: " + LocToCheck, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = LocToCheck, LocationToCheckOther = OtherLocToCheck)
	DefaultScriptFunctions.Trace(self, "OnLocationChange() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent