Scriptname RQ_RescueScript extends RQ_TransportPersonScript

;see parent script: RQScript for traces, etc.

Group Rescue_Aliases
	ReferenceAlias Property Alias_Door Mandatory Const Auto
	{autofill}

	ReferenceAlias Property Alias_Victim Mandatory Const Auto
	{autofill}

	RefCollectionAlias Property Alias_Actors Mandatory Const Auto
	{autofill}

	RefCollectionAlias Property Alias_Passengers Mandatory Const Auto
	{autofill}

	ReferenceAlias Property Alias_CaptiveTarget Auto Const Mandatory
	{autofill}

	ReferenceAlias Property Alias_CaptiveMarker Auto Const Mandatory
	{autofill}

	ReferenceAlias Property Alias_BossContainer Auto Const Mandatory
	{autofill}

	ReferenceAlias Property Alias_BonusContainer Auto Const Mandatory
	{autofill}

	ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const Mandatory

	int property AllPassengersDisembarkStage = 500 auto const 
	{ this stage is set by passenger script when all passengers disembark OR unload }

EndGroup

Group Rescue_Scenes
	Scene Property CaptiveRescuedScene Mandatory Const Auto
	{Scene to start when captive is rescued}

EndGroup

Group Rescue_PassengerHandling

	SQ_PlayerShipScript Property SQ_PlayerShip Mandatory Const Auto
	{autofill}
EndGroup

function InitializeNPCs()
	Trace(self, "InitializeNPCs()")

	ObjectReference CaptiveMarker = Alias_CaptiveMarker.GetRef()
	ObjectReference DungeonMarker = Alias_BossContainer.GetRef()
	Actor CaptiveNPC = Alias_CaptiveTarget.GetActorRef()

	If CaptiveMarker
		CaptiveNPC.MoveTo(CaptiveMarker)
	ElseIf DungeonMarker
		CaptiveNPC.MoveTo(DungeonMarker)
	EndIf 

	CaptiveNPC.Enable()
	CaptiveNPC.EvaluatePackage()

	; turn off captive blocking hellos so captive can have greeting
	CaptiveNPC.SetValue(SQ_CaptiveStateNoBlockingHellos, 1)

	Alias_BonusContainer.TryToEnable()

	Parent.InitializeNPCs()
EndFunction

Event OnStageSet(int auiStageID, int auiItemID)
	if auiStageID == AllPassengersDisembarkStage
		; disable any actors currently unloaded
		int i = 0
		while i < Alias_Actors.GetCount()
			ObjectReference theActor = Alias_Actors.GetAt(i)
			if theActor.Is3DLoaded() == false
				theActor.DisableNoWait()
			endif
			i += 1
		EndWhile
		ObjectReference victimRef = Alias_Victim.GetRef()
		if victimRef.Is3DLoaded() == false
			victimRef.DisableNoWait()
		endif
	endif
EndEvent