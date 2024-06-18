Scriptname TestJeffBEncounterSpawn extends ObjectReference
{script the lives on an activator that spawns a ref at the linked ref}

ActorBase Property myLeveledActor Auto

ObjectReference myLink

;******************************************************

Event OnLoad()
    myLink = GetLinkedRef()
EndEvent

;******************************************************

Event OnActivate(ObjectReference akActionRef)
	myLink.PlaceAtMe(myLeveledActor, 1)
EndEvent

;******************************************************