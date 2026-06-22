Scriptname DefaultCollectionAliasOnDeath extends DefaultCollectionAlias Default
{Sets stage when THIS RefCollection's members are killed.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference killing each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection.}


Group Script_Specific_Properties
	Bool Property UseOnDyingInstead = false Auto Const
	{(Default: false) If true, stage will be set when OnDying() event is sent. If false, stage will be sent with OnDeath() event is sent.}

	bool Property RemoveFromRefCollection = false Const Auto
	{(Default: false) If true, after executing script functionality, will remove each reference from the collection when it dies.}

	SQ_PlayerShipScript property SQ_PlayerShip auto Const
	{autofill (but optional) - used to register for player ship change event }

	Bool Property CountShipTakeover = true auto const
	{ only valid if SQ_PlayerShip is filled in; for spaceships, consider the player taking over a ship as killing it }
EndGroup

Event OnAliasInit()
    ; register for custom event
	if SQ_PlayerShip && CountShipTakeover
    	RegisterForCustomEvent(SQ_PlayerShip, "SQ_PlayerShipChanged")
	endif
	Parent.OnAliasInit()	
EndEvent

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
	if UseOnDyingInstead == false
		DeathComplete(akSenderRef, akKiller)
	endif
EndEvent

Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
	if UseOnDyingInstead == true
		DeathComplete(akSenderRef, akKiller)
	endif
EndEvent

Event SQ_PlayerShipScript.SQ_PlayerShipChanged(SQ_PlayerShipScript akSender, Var[] akArgs)
	SpaceshipReference newPlayerShip = akArgs[0] as SpaceshipReference

	if CountShipTakeover && Find(newPlayerShip) > -1
		DeathComplete(newPlayerShip, Game.GetPlayer())
    endif
EndEvent


Function DeathComplete(ObjectReference akSenderRef, ObjectReference akKiller)
	DefaultScriptFunctions.Trace(self, "DeathComplete() akKiller: " + akKiller, ShowTraces)

	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akKiller, LocationToCheck = akSenderRef.GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "DeathComplete() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)		
EndFunction

Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams)
	if RemoveFromRefCollection
		DefaultScriptFunctions.Trace(self, "DoSpecificThing() removing reference from collection. RefCollectionMemberRef: " + RefCollectionMemberRef + ", ", ShowTraces)

		RemoveRef(RefCollectionMemberRef)
	endif
EndFunction