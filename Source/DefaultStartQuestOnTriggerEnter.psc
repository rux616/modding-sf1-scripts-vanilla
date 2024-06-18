Scriptname DefaultStartQuestOnTriggerEnter extends DefaultRefOnTriggerEnter Default
{Starts a quest when THIS reference's trigger is entered.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object.}

Group Quest_Properties collapsed
{Double-Click to EXPAND}
	bool Property xxxPlaceHolderForEmptyGroup2xxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group Script_Specific_Properties
	Quest Property QuestToStart Auto Const Mandatory
	{Quest that we want to start}
EndGroup

Event OnInit()
	SkipBusyState = true ;we need to process all trigger events
EndEvent

;Reimplementing Parent's empty function
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	DefaultScriptFunctions.Trace(self, "DoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	DefaultScriptFunctions.Trace(self, "DoSpecificThing() Starting QuestToStart: " + QuestToStart, ShowTraces)
	QuestToStart.Start()

	parent.DoSpecificThing(ParentScriptFunctionParams = ParentScriptFunctionParams, RefToDoThingWith = RefToDoThingWith, LastRefToDoThingWith = LastRefToDoThingWith)
EndFunction