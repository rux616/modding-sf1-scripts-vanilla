ScriptName DefaultSetAVTrigScript extends ObjectReference Default
{Default trigger script that can set the Actor Values (AVs) of one (or a chain of) linked actors when a trigger is entered.}

Group Required_Properties
	ActorValue property AV01 Auto Const Mandatory	
	{First Actor Value to set.}
	float property AV01_Value Auto Const Mandatory
	{First Actor Value's new value.}
EndGroup

Group Optional_Properties
	ActorValue property AV02 Auto Const
	{Second Actor Value to set.}
	float property AV02_Value Auto Const
	{Second Actor Value's new value.}

	ActorValue property AV03 Auto Const
	{Third Actor Value to set.}
	float property AV03_Value Auto Const
	{Third Actor Value's new value.}

	ActorValue property AV04 Auto Const
	{Fourth Actor Value to set.}
	float property AV04_Value Auto Const
	{Fourth Actor Value's new value.}

	ActorValue property AV05 Auto Const
	{Fifth Actor Value to set.}
	float property AV05_Value Auto Const
	{Fifth Actor Value's new value.}

	bool property onlyPlayer = True Auto Const
	{Default=TRUE. Only accept trigger events from the player?}

	bool property onlyOnce = True Auto Const
	{Default=TRUE. Only set AVs once? If True, disables and deletes the trigger when done.}

	Keyword property linkKeyword Auto Const
	{Link Keyword for the actor (or chain of actors) whose AVs we're going to set.}

	int property maxLinks = 25 Auto Const
	{Maximum number of actors to set AVs on. Acts as a failsafe in case the actors are linked in a loop.}
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup

Event OnTriggerEnter(ObjectReference akActionRef)
	if (!onlyPlayer || akActionRef == Game.GetPlayer())
		SetActorValues(Self.GetLinkedRef(linkKeyword) as Actor)
		if (onlyOnce)
			Self.Disable()
			Self.Delete()
		EndIf
	EndIf
EndEvent

;Recursive helper function that sets the AVs for a chain of linked actors.
Function SetActorValues(Actor akActor)
	Actor current = akActor
	int i = 0
	While ((current != None) && (i < maxLinks))
		DefaultScriptFunctions.Trace(self, "SETAV on " + current, ShowTraces)

		;Set the AVs to their new values.
		if (AV01 != None)
			DefaultScriptFunctions.Trace(self, "SETAV " + AV01 + " on " + self + " to " + AV01_Value, ShowTraces)
			current.SetValue(AV01, AV01_Value)
		EndIf
		if (AV02 != None)
			DefaultScriptFunctions.Trace(self, "SETAV " + AV02 + " on " + self + " to " + AV02_Value, ShowTraces)
			current.SetValue(AV02, AV02_Value)
		EndIf
		if (AV03 != None)
			DefaultScriptFunctions.Trace(self, "SETAV " + AV03 + " on " + self + " to " + AV03_Value, ShowTraces)
			current.SetValue(AV03, AV03_Value)
		EndIf
		if (AV04 != None)
			DefaultScriptFunctions.Trace(self, "SETAV " + AV04 + " on " + self + " to " + AV04_Value, ShowTraces)
			current.SetValue(AV04, AV04_Value)
		EndIf
		if (AV05 != None)
			DefaultScriptFunctions.Trace(self, "SETAV " + AV05 + " on " + self + " to " + AV05_Value, ShowTraces)
			current.SetValue(AV05, AV05_Value)
		EndIf

		;Evaluate package, since this is (often) changed by the new AVs.
		current.EvaluatePackage()

		i = i + 1
		current = current.GetLinkedRef(linkKeyword) as Actor
	EndWhile
	DefaultScriptFunctions.Trace(self, "SETAV Finished for " + akActor + " with links " + i, ShowTraces)
EndFunction