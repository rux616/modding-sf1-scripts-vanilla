Scriptname DefaultAliasOnDestructionStateChanged extends DefaultAliasParent Default
{Set stage when THIS Alias's destruction stage changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()}

Group Script_Specific_Properties
	Int Property DestructionStateToCheckFor = 1 Auto Const
	{Set the stage when this destruction state is reached.}
EndGroup


Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	
	DefaultScriptFunctions.Trace(self, "OnDestructionStageChanged() aiOldStage: " + aiOldStage + ", aiCurrentStage: " + aiCurrentStage, ShowTraces)
	if aiCurrentStage <= DestructionStateToCheckFor
		DefaultScriptFunctions.Trace(self, "OnDestructionStageChanged() aiCurrentStage <= DestructionStateToCheckFor", ShowTraces)
	
		DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = None)
		DefaultScriptFunctions.Trace(self, "OnDestructionStageChanged() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
		CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)	
	endif
EndEvent