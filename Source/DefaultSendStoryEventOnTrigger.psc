Scriptname DefaultSendStoryEventOnTrigger extends DefaultRef default
{Calls SendStoryEvent on the specified keyword when THIS object is entered.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object.

Story Manager Data will be:
Ref1: <RefToCheck>
Ref2: THIS trigger object
Location: <LocationToCheck>
}

Group Quest_Properties collapsed
{Double-Click to EXPAND}
	bool Property xxxPlaceHolderForEmptyGroup2xxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group Script_Specific_Properties
	Keyword Property StoryEventKeyword Auto Const Mandatory
	{The Keyword you want to call SendStoryEvent for.}

	int Property Value1 = 0 Const Auto
	{Will be sent as the aiValue1 parameter of the SendStoryEventAndWait() function.}

	int Property Value2 = 0 Const Auto
	{Will be sent as the aiValue1 parameter of the SendStoryEventAndWait() function.}
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
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	
	
	location akLoc = ParentScriptFunctionParams.LocationToCheck
	ObjectReference akRef1 = ParentScriptFunctionParams.RefToCheck
	ObjectReference akRef2 = self
	int aiValue1 = Value1
	int aiValue2 = Value2

	DefaultScriptFunctions.trace(self, "DoSpecificThing() calling SendStoryEvent() akLoc: " + akLoc + ", akRef1: " + akRef1 + ", aiValue1: " + aiValue1 + ", aiValue2: " + aiValue2 + ", ",  ShowTraces)

	Quest[] startedQuests = StoryEventKeyword.SendStoryEventAndWait(akLoc = akLoc, akRef1 = akRef1, akRef2 = akRef2, aiValue1 = aiValue1, aiValue2 = aiValue2)	
	bool success = startedQuests.Length > 0
	
	DefaultScriptFunctions.trace(self, "DoSpecificThing() calling SendStoryEvent() did we successfully start a quest? success:" + success,  ShowTraces)

EndFunction