Scriptname DefaultRefAddFactionOnTriggerEnter extends DefaultRef
{Adds faction to linked ref and linked ref children when THIS object entered.}

Group Script_Specific_Properties
	Bool Property DeleteWhenTriggeredSuccessfully = false Auto Const
	{(Default: false) If true, delete THIS object when triggered successfully.}

	Keyword Property LinkedRefKeyword Auto Const
	{The Keyword of the LinkedRef you want to activate when this activated.}

    Faction property FactionToAdd auto const mandatory
    { faction to add to triggering actor }

	bool Property ShouldUseLinkedRefChain = false Const Auto
	{(Default: false) If true, will execute over the entire Linked Ref Chain.}
EndGroup

Event OnInit()
	SkipBusyState = true ;we need to process all trigger events
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnTriggerEnter() akActionRef: " + akActionRef, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akActionRef, LocationToCheck = GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnTriggerEnter() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndEvent

;Reimplementing Parent's empty function
ObjectReference[] Function GetRefsToDoSpecificThingsWith()
	if ShouldUseLinkedRefChain
		DefaultScriptFunctions.Trace(self, "GetRefsToDoSpecificThingsWith() returning linked ref chain.", ShowTraces)
		return GetLinkedRefChain(LinkedRefKeyword)
	else
		return GetLinkedRef(LinkedRefKeyword).GetSingleRefArray()
	endif
EndFunction

;Reimplementing Parent's empty function
;CHILDREN SCRIPTS RE-IMPLEMENTING THIS SHOULD CALL THE PARENT VERSION
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
    ; add faction if RefToDoThingWith is an actor
    Actor actorRef = RefToDoThingWith as Actor
    if actorRef
        actorRef.AddToFaction(FactionToAdd)
    EndIf

	if DeleteWhenTriggeredSuccessfully && LastRefToDoThingWith
		Delete()
	endif
EndFunction