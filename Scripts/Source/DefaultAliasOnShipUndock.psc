Scriptname DefaultAliasOnShipUndock extends DefaultAlias Default
{Sets stage when this ship undocks from another ship.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is based on the value of WhichShipToCheck - see below
<LocationToCheck> is the current location of THIS Alias's reference.}

Group Script_Specific_Properties
	Bool Property SetStageWhenUndockingComplete = true Auto Const
	{If true (default), stage will be set when undocking is complete; if false, stage will be set when undocking begins.}

	int Property WhichShipToCheck = 0 Auto Const
	{0 = check both docking ships
	 1 = check this ship only
	 2 = check the other ship only
	}
EndGroup


Event OnShipUndock(bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)
	if SetStageWhenUndockingComplete == abComplete
		DefaultScriptFunctions.Trace(self, "OnShipUndock() abComplete: " + abComplete + ", akUndocking: " + akUndocking + ", akParent: " + akParent, ShowTraces)

		Location currentLocation = TryToGetCurrentLocation()
		SpaceshipReference myShip = GetShipRef()
		SpaceshipReference otherShip = None
		if myShip == akUndocking
			otherShip = akParent
		Else
			otherShip = akUndocking
		EndIf

		if WhichShipToCheck == 0 || WhichShipToCheck == 1
			; check this ship
			DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = myShip, LocationToCheck = currentLocation)
			DefaultScriptFunctions.Trace(self, "OnShipUndock() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
			CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)		
		EndIf

		if WhichShipToCheck == 0 || WhichShipToCheck == 2
			; check other ship
			DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = otherShip, LocationToCheck = currentLocation)
			DefaultScriptFunctions.Trace(self, "OnShipUndock() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
			CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)		
		EndIf

		if WhichShipToCheck < -1 || WhichShipToCheck > 2
			DefaultScriptFunctions.Warning(self, "WARNING: OnShipUndock() has invalid parameter WhichShipToCheck=" + WhichShipToCheck)
		endif

	endif
EndEvent
