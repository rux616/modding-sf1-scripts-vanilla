Scriptname DefaultSceneStartOnEnterTrigger extends DefaultRefOnTriggerEnter
{Starts a scene when THIS reference's trigger is entered.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object.}

Group Quest_Properties collapsed
{Double-Click to EXPAND}
	bool Property xxxPlaceHolderForEmptyGroup2xxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group Script_Specific_Properties
	Scene Property SceneToStart Auto Const Mandatory
	{Scene that we want to start}

	bool Property DisableAfterStartingScene = true Auto Const
	{If true (default), disable THIS object after the scene starts}
EndGroup

Event OnInit()
	SkipBusyState = true ;we need to process all trigger events
EndEvent

;Reimplementing Parent's empty function
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	DefaultScriptFunctions.Trace(self, "DoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	if SceneToStart.IsPlaying() == false
		if SceneToStart.GetOwningQuest().IsRunning()
			DefaultScriptFunctions.Trace(self, "DoSpecificThing() SceneToStart's starting scene. SceneToStart: " + SceneToStart, ShowTraces)
			SceneToStart.Start()

			if DisableAfterStartingScene
				DefaultScriptFunctions.Trace(self, "DoSpecificThing() Disabling self because DisableAfterStartingScene " + DisableAfterStartingScene, ShowTraces)
				Disable()
			endif

			parent.DoSpecificThing(ParentScriptFunctionParams = ParentScriptFunctionParams, RefToDoThingWith = RefToDoThingWith, LastRefToDoThingWith = LastRefToDoThingWith)
		else
			DefaultScriptFunctions.Trace(self, "DoSpecificThing() SceneToStart's owning quest is NOT running. NOT starting scene. SceneToStart.GetOwningQuest(): " + SceneToStart.GetOwningQuest() + ", ", ShowTraces)
		endif
	endif

	
EndFunction

