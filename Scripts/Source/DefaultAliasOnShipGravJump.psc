Scriptname DefaultAliasOnShipGravJump extends DefaultAliasParent Default
{Sets stage when THIS Alias Grav Jumps.
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
	Bool Property SetStageWhenJumpingComplete = TRUE Auto Const
	{If true (default) stage will be set when Jump is complete; if false, stage will be set when jump begins.}

	Bool Property SetStageIfJumpingFails = FALSE Auto Const
	{(Default: false) if true, stage will be set if Jump fails; if false, stage will be set if Jump does not fail.}

	bool Property CheckDestinationLocation = true Const Auto
	{if true (default), <LocationToCheck> is the destination Location. If false, <LocationToCheck> is the starting location}
EndGroup

Location startingLocation ; set by OnShipGravJump when it is initiated

; Event received when a ship grav jump event occurs - State { Initiated = 0, AnimStarted = 1, Completed = 2, Failed = 3 }
Event OnShipGravJump(Location aDestination, int aState)
	if aState == 0
		startingLocation = TryToGetCurrentLocation()
	EndIf

	bool shouldSetStage = false
	if ( SetStageWhenJumpingComplete == true && aState == 2 ) || (SetStageWhenJumpingComplete == false && aState == 0) || (SetStageIfJumpingFails && aState == 3)
		shouldSetStage = true
	endif


	if shouldSetStage
		DefaultScriptFunctions.Trace(self, "OnShipGravJump() aState=" + aState + " aDestination=" + aDestination, ShowTraces)
		Location locationToCheck
		if CheckDestinationLocation
			locationToCheck = aDestination
		Else
			locationToCheck = startingLocation
		EndIf

		DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = locationToCheck)
		DefaultScriptFunctions.Trace(self, "OnShipGravJump() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
		CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
	endif	
EndEvent