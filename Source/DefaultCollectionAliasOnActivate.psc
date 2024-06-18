Scriptname DefaultCollectionAliasOnActivate extends DefaultCollectionAlias Default
{Sets stage when THIS RefCollection's members are activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection.}

Group Script_Specific_Properties
	bool property ShouldDisableAfterSuccessfulActivation = false Auto Const
	{(Default: false) If true, disable after being successfully activated}
EndGroup

Event  OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnActivate() akSenderRef: " + akSenderRef + ", akActionRef: " + akActionRef, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = akSenderRef.GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnActivate() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)
EndEvent

;OVERRIDE THIS IN CHILD SCRIPT
;IMPORTANT: Children need to call this function as well when they override it
Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams)
	if ShouldDisableAfterSuccessfulActivation
		DefaultScriptFunctions.Trace(self, "DoSpecificThingForEachValidRef() disabling because ShouldDisableAfterSuccessfulActivation == true. RefCollectionMemberRef: " + RefCollectionMemberRef, ShowTraces)
		RefCollectionMemberRef.Disable()
	EndIf
EndFunction