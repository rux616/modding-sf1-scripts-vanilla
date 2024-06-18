Scriptname DefaultRefOnHit extends DefaultRef Default
{Sets stage when THIS object is hit.
<RefToCheck> is the reference hitting THIS Object.
<LocationToCheck> is the current location of THIS object.

SEE ALSO DefaultRefOnCombatStateChanged which includes the ability to also check for OnHit.
(You probably want to use DefaultRefOnCombatStateChanged if THIS is an actor and you are testing to see if it's becoming hostile)}


Event OnLoad()
	RegisterOnHitFilters()
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

State Done
	Event OnLoad()
		;don't register
	EndEvent
EndState

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akAggressor, LocationToCheck = GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnHit() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
	
	if DoOnce == false
		RegisterOnHitFilters()
	EndIf
EndEvent