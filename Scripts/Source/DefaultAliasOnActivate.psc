Scriptname DefaultAliasOnActivate extends DefaultAlias Default
{Sets stage if a THIS Alias's reference is activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating THIS Alias's reference.
<LocationToCheck> is the current location of THIS Alias's reference.}

Group Script_Specific_Properties
	bool property ShouldDisableAfterSuccessfulActivation = false Auto Const
	{(Default: false) If true, disable after being successfully activated}

	bool property ShouldHideActivationAfterSuccessfulActivation = false auto Const
	{(Default: false) If true, hide activation (button prompt) after being successfully activated}

    bool Property AllowDuringCombat = true Const Auto
    {Default=true. If true, do not set a stage if the activator is in combat.}

    Message Property NotAllowedDuringCombat Const Auto
    {Message to display if AllowDuringCombat=False, and the player is the activator, and they sit while in combat.}
EndGroup

Event OnActivate(ObjectReference akActionRef)
	Actor ActorREF = akActionRef as Actor

	if (AllowDuringCombat || (ActorREF && !ActorREF.IsInCombat()))
		DefaultScriptFunctions.Trace(self, "OnActivate() akActionRef: " + akActionRef, ShowTraces)

		DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = TryToGetCurrentLocation())
		DefaultScriptFunctions.Trace(self, "OnActivate() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
		CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
	ElseIf akActionRef == Game.GetPlayer() && NotAllowedDuringCombat != none
		NotAllowedDuringCombat.Show()
	EndIf
EndEvent

;Reimplementing Parent's empty function
;IMPORTANT: Children need to call this function as well when they override it
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	DefaultScriptFunctions.Trace(self, "DoSpecificThing() on DefaultAliasOnActivate", ShowTraces)
	
	if ShouldDisableAfterSuccessfulActivation
		ObjectReference selfRef = GetReference()
		DefaultScriptFunctions.Trace(self, "DoSpecificThing() disabling because ShouldDisableAfterSuccessfulActivation == true. selfRef: " + selfRef, ShowTraces)
		selfRef.Disable()
	elseif ShouldHideActivationAfterSuccessfulActivation
		ObjectReference selfRef = GetReference()
		DefaultScriptFunctions.Trace(self, "DoSpecificThing() blocking activation because ShouldHideActivationAfterSuccessfulActivation == true. selfRef: " + selfRef, ShowTraces)
		selfRef.BlockActivation(true, true)
	EndIf
EndFunction