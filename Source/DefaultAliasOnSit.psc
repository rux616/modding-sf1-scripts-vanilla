Scriptname DefaultAliasOnSit extends DefaultAlias
{Set a stage when the actor in this alias sits in the specified furniture.}

Group Script_Specific_Properties
	ReferenceAlias Property SitTarget Auto Const
	{When an actor sits in/on the furniture in this alias, set the stage}

    bool Property AllowDuringCombat = False Const Auto
    {Default=False. If true, do not set a stage if the sitting actor is in combat.}

    Message Property NotAllowedDuringCombat Mandatory Const Auto
    {Message to display if AllowDuringCombat=False, and the player is the sitting actor, and they sit while in combat.}
EndGroup

Event OnSit(ObjectReference akFurniture)
    if (akFurniture == SitTarget.GetRef())
        if (AllowDuringCombat || !GetActorRef().IsInCombat())
            DefaultScriptFunctions.Trace(self, "OnSit() akFurniture: " + akFurniture, ShowTraces)
            DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = GetRef(), LocationToCheck = TryToGetCurrentLocation())
            DefaultScriptFunctions.Trace(self, "OnSit() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
            CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
        ElseIf (GetRef() == Game.GetPlayer())
            NotAllowedDuringCombat.Show()
        EndIf
    EndIf
EndEvent
