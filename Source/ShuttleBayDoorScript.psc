Scriptname ShuttleBayDoorScript extends ObjectReference
{Script on the Shuttle Bay Doors. Handles opening and closing the doors in response to events from the ShuttleBayDoorManagerScript object.}

Event OnLoad()
	ShuttleBayDoorManagerScript myManager = GetLinkedRef() as ShuttleBayDoorManagerScript
	if (myManager == None)
		Debug.Trace("ERROR: ShuttleBayDoorScript " + Self + " is missing its manager object.", 2)
	Else
		RegisterForCustomEvent(myManager, "OpenShuttleBayDoorsEvent")
		RegisterForCustomEvent(myManager, "CloseShuttleBayDoorsEvent")
	EndIf
EndEvent

Event ShuttleBayDoorManagerScript.OpenShuttleBayDoorsEvent(ShuttleBayDoorManagerScript akSender, Var[] akArgs)
	PlayAnimation("StateA_Play")
EndEvent

Event ShuttleBayDoorManagerScript.CloseShuttleBayDoorsEvent(ShuttleBayDoorManagerScript akSender, Var[] akArgs)
	PlayAnimation("StateB_Play")
EndEvent