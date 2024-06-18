Scriptname DefaultAliasOnTriggerEnter extends DefaultAlias Default
{Sets stage when THIS Alias entered.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference triggering THIS Alias.
<LocationToCheck> is the current location of THIS Alias.}

Group Script_Specific_Properties
	Bool Property DeleteWhenTriggeredSuccessfully = true Auto Const
	{If true (default), delete THIS object when triggered successfully}
EndGroup


Event OnAliasInit()
	SkipBusyState = true ;we need to process all trigger events
	if PrereqStage > -1
		; if we have a prereq stage, need to handle that stage being set with target in trigger
		RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
	endif
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnTriggerEnter() akActionRef: " + akActionRef, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = TryToGetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnTriggerEnter() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent

Event Quest.OnStageSet(Quest akSource, int auiStageID, int auiItemID)
	; if this is a prereq stage, need to check all refs in the trigger
	if auiStageID == PrereqStage
		ObjectReference myTrigger = GetRef()
		if myTrigger
			ObjectReference[] refs = myTrigger.GetAllRefsInTrigger()
			int i = 0
			while i < refs.Length
				OnTriggerEnter(refs[i])
				i += 1
			EndWhile
		endif
	endif
EndEvent

;Reimplementing Parent's empty function
;CHILDREN SCRIPTS RE-IMPLEMENTING THIS SHOULD CALL THE PARENT VERSION
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	if DeleteWhenTriggeredSuccessfully && LastRefToDoThingWith
		TryToDelete()
	endif
EndFunction