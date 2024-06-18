Scriptname DefaultAliasOnShipDock extends DefaultAlias Default
{Sets stage when this ship initiates docking with another ship.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is based on the value of WhichShipToCheck - see below
<LocationToCheck> is the current location of THIS Alias's reference.}

Group Script_Specific_Properties
	Bool Property SetStageWhenDockingComplete = true Auto Const
	{If true (default), stage will be set when docking is complete; if false, stage will be set when docking begins.}

	int Property WhichShipToCheck = 0 Auto Const
	{0 = check both docking ships
	 1 = check this ship only
	 2 = check the other ship only
	}
EndGroup


Event OnShipDock(bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
	if SetStageWhenDockingComplete == abComplete
		DefaultScriptFunctions.Trace(self, "OnShipDock() abComplete: " + abComplete + ", akDocking: " + akDocking + ", akParent: " + akParent, ShowTraces)

		Location currentLocation = TryToGetCurrentLocation()
		SpaceshipReference myShip = GetShipRef()
		SpaceshipReference otherShip = None
		if myShip == akDocking
			otherShip = akParent
		Else
			otherShip = akDocking
		EndIf

		if WhichShipToCheck == 0 || WhichShipToCheck == 1
			; check this ship
			DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = myShip, LocationToCheck = currentLocation)
			DefaultScriptFunctions.Trace(self, "OnShipDock() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
			CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)		
		EndIf

		if WhichShipToCheck == 0 || WhichShipToCheck == 2
			; check other ship
			DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = otherShip, LocationToCheck = currentLocation)
			DefaultScriptFunctions.Trace(self, "OnShipDock() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
			CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)		
		EndIf

		if WhichShipToCheck < 0 || WhichShipToCheck > 2
			DefaultScriptFunctions.Warning(self, "WARNING: OnShipDock() has invalid parameter WhichShipToCheck=" + WhichShipToCheck)
		endif

	endif
EndEvent