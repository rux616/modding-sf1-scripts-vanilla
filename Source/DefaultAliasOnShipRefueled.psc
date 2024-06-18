Scriptname DefaultAliasOnShipRefueled extends DefaultAliasParent Default
{Sets stage when THIS Alias refuels.
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
	ActorValue Property SpaceshipGravJumpFuel auto const mandatory
    {The actor value which holds current/max fuel value for ships }

	Bool Property RequireFullyRefueled = FALSE Auto Const
	{If true (default), stage will be set when fueling is complete, only if completely refueled; if false, stage will be set when fueling completes, regardless of much fuel was added.}
EndGroup

Event OnShipRefueled(int aFuelAdded)
	DefaultScriptFunctions.Trace(self, "OnShipRefueled() aFuelAdded=" + aFuelAdded, ShowTraces)
	if aFuelAdded > 0
        if RequireFullyRefueled == false
		    RefuelSuccessful()
        Else
            ; is ship fully refueled?
            ObjectReference shipRef = GetRef()
            float currentFuel = shipRef.GetValue(SpaceshipGravJumpFuel)
            if currentFuel >= shipRef.GetBaseValue(SpaceshipGravJumpFuel)
                RefuelSuccessful()
            endif
        endif
	endif
EndEvent

Function RefuelSuccessful()
	DefaultScriptFunctions.Trace(self, "RefuelSuccessful()", ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = TryToGetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "RefuelSuccessful() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)		
EndFunction