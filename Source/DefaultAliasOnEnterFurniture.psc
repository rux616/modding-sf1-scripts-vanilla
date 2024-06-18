Scriptname DefaultAliasOnEnterFurniture extends DefaultAlias
{Set a stage when an actor sits in this furniture.}

Group Script_Specific_Properties
    bool Property AllowDuringCombat = False Const Auto
    {Default=False. If true, do not set a stage if the sitting actor is in combat.}

    Message Property NotAllowedDuringCombat Mandatory Const Auto
    {Message to display if AllowDuringCombat=False, and the player is the sitting actor, and they sit while in combat.}
EndGroup

Event OnEnterFurniture(Actor akActionRef)
    if (AllowDuringCombat || !akActionRef.IsInCombat())
        DefaultScriptFunctions.Trace(self, "OnEnterFurniture() akActionRef: " + akActionRef, ShowTraces)
        DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = TryToGetCurrentLocation())
        DefaultScriptFunctions.Trace(self, "OnEnterFurniture() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
        CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
    ElseIf (akActionRef == Game.GetPlayer())
        NotAllowedDuringCombat.Show()
    EndIf
EndEvent