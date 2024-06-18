Scriptname RQ_TransportPersonScript extends RQScript
{for RQs with passengers}

group TransportPerson 
    ReferenceAlias property Alias_PlayerShip auto const mandatory

    ReferenceAlias property Alias_QuestGiverShip auto const
    { optional - if this includes a questgiver ship }

    bool property DamageShips = true auto Const
    { if true, put any landed ships in damaged state }

    ActorValue property ShipSystemEngineHealth auto const mandatory
    { engine system health - use to put ships in damaged state } 

	LocationAlias Property Alias_PassengerDestination Mandatory Const Auto
	{autofill}

	ReferenceAlias Property Alias_PassengerDestinationMarker Mandatory Const Auto
	{autofill}

    int property InitializeNPCsStage = -1 const auto
    { stage to set when NPCs are initialized }

	int Property AgreeToTransportStage = 100 Const Auto
    { this stage being set means player has agreed to transport passengers }

	int Property AgreeToTransportObjective = 100  Const Auto
    { objective related to transporting passengers }

	int Property TransportDoneStage = 390 Const Auto
    { if this stage is set, means passengers have been delivered to destination }

    Keyword property LocTypeStarSystem const auto mandatory
    { autofill }

    WwiseEvent property DamagedEngineSound const auto
endGroup

int onBoardCount = 0

int damageSound

; override parent function
function QuestStartedSpecific()
    RegisterForRemoteEvent(Alias_PlayerShip, "OnLocationChange")
    if Alias_QuestGiverShip
        RegisterForRemoteEvent(Alias_QuestGiverShip, "OnAliasChanged")
        RegisterForRemoteEvent(Alias_QuestGiverShip, "OnLoad")
        RegisterForRemoteEvent(Alias_QuestGiverShip, "OnUnload")
    EndIf
EndFunction

function AgreeToTransportPassenger()
    ; if this has OEScript, don't stop quest when player leaves planet
    OEScript myOEScript = (self as Quest) as OEScript
    if myOEScript
        myOEScript.StopQuestWhenPlayerLeavesPlanet = false
    EndIf

    ; watch for passengers to enter ship
    int i = 0
    while i < DialogueAliases.Length
        RefCollectionAlias refCollection = DialogueAliases[i] as RefCollectionAlias
        if refCollection
    	    RegisterForRemoteEvent(refCollection, "OnEnterShipInterior")
    	    RegisterForRemoteEvent(refCollection, "OnExitShipInterior")
        Else
    	    RegisterForRemoteEvent((DialogueAliases[i] as ReferenceAlias), "OnEnterShipInterior")
    	    RegisterForRemoteEvent((DialogueAliases[i] as ReferenceAlias), "OnExitShipInterior")
        endif
        i += 1
    EndWhile

    SetDialogueAV_Hello_Calm_PostAccept()
endFunction

Event OnStageSet(int auiStageID, int auiItemID)
    if auiStageID == AgreeToTransportStage
        AgreeToTransportPassenger()
    endif
EndEvent

function InitializeNPCs()
    Trace(self, "InitializeNPCs on child script")
    Parent.InitializeNPCs()
    if InitializeNPCsStage > -1
        SetStage(InitializeNPCsStage)
    endif
    ; make sure ship is damaged if it exists
    DamageShip(Alias_QuestGiverShip)
endFunction

Event ReferenceAlias.OnEnterShipInterior(ReferenceAlias akSender, ObjectReference akShip)
	Trace(self, "OnEnterShipInterior " + akSender)
	UnregisterForRemoteEvent(akSender, "OnEnterShipInterior")
    ; NPC on ship, set hello AV
    akSender.GetRef().SetValue(RQ_AV_Hello, RQ_Hello_AboardShipValue.GetValueInt())
EndEvent

Event RefCollectionAlias.OnEnterShipInterior(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akShip)
	Trace(self, "OnEnterShipInterior " + akSenderRef)
    onBoardCount += 1
    akSenderRef.SetValue(RQ_AV_Hello, RQ_Hello_AboardShipValue.GetValueInt())
    if onBoardCount >= akSender.GetCount()
        ; all on board, unregister for this event
        UnregisterForRemoteEvent(akSender, "OnEnterShipInterior")
    endif
EndEvent

Event ReferenceAlias.OnExitShipInterior(ReferenceAlias akSender, ObjectReference akShip)
	Trace(self, "OnExitShipInterior " + akSender)
	UnregisterForRemoteEvent(akSender, "OnExitShipInterior")
    ; NPC exits ship, set hello AV
    akSender.GetRef().SetValue(RQ_AV_Hello, RQ_Hello_Calm_SuccessValue.GetValueInt())
EndEvent

Event RefCollectionAlias.OnExitShipInterior(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akShip)
	Trace(self, "OnExitShipInterior " + akSenderRef)
    onBoardCount -= 1
    akSenderRef.SetValue(RQ_AV_Hello, RQ_Hello_Calm_SuccessValue.GetValueInt())
    if onBoardCount <= 0
        ; all exited, unregister for this event
        UnregisterForRemoteEvent(akSender, "OnExitShipInterior")
    endif
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
	Trace(self, "OnLocationChange() akSender: " + akSender + ", akOldLoc: " + akOldLoc + ", akNewLoc: " + akNewLoc)
	if akSender == Alias_PlayerShip
        if GetStageDone(AgreeToTransportStage) && GetStageDone(TransportDoneStage) == false
    		;refill the destination alias to make sure it's always the closest one
    		UpdatePassengerDestinationAliases(akNewLoc)
    	endif

		CheckForShutdown(akNewLoc)
	endif
EndEvent

Event ReferenceAlias.OnLoad(ReferenceAlias akSender)
    if akSender == Alias_QuestGiverShip
        DamageShip(Alias_QuestGiverShip)
    endif
EndEvent

Event ReferenceAlias.OnUnload(ReferenceAlias akSender)
    if akSender == Alias_QuestGiverShip
        if DamagedEngineSound && damageSound > 0
            WWiseEvent.StopInstance(damageSound)
        endif
    endif
EndEvent

function OnAliasChangedSpecific(ReferenceAlias akSender, ObjectReference akObject, bool abRemove)
    Trace(self, " OnAliasChangedSpecific akSender=" + akSender)
    if akSender == Alias_QuestGiverShip
        DamageShip(Alias_QuestGiverShip)
    endif
endFunction

function DamageShip(ReferenceAlias akShipToDamage)
    if DamageShips && akShipToDamage
        SpaceshipReference shipRef = akShipToDamage.GetShipRef()
        Trace(self, " DamageShip " + akShipToDamage + " shipRef=" + shipRef)
        if shipRef
            if shipRef.Is3DLoaded()
                float currentEngineHealth = shipRef.GetValue(ShipSystemEngineHealth)
                if currentEngineHealth <= 0
                    shipRef.RestoreValue(ShipSystemEngineHealth, 99.0)
                    currentEngineHealth = shipRef.GetValue(ShipSystemEngineHealth)
                endif
                shipRef.DamageValue(ShipSystemEngineHealth, currentEngineHealth)
                if DamagedEngineSound
                    damageSound = DamagedEngineSound.Play(shipRef)
                endif
            endif
        EndIf
    EndIf
EndFunction

Function UpdatePassengerDestinationAliases(Location newLocation)
	Location currentDestination = Alias_PassengerDestination.GetLocation()

    ; only update destination if we're not already in the target system
    if currentDestination.IsSameLocation(newLocation, LocTypeStarSystem) == false
        Alias_PassengerDestination.RefillAlias() 
        Alias_PassengerDestination.RefillDependentAliases()

        Trace(self, "UpdatePassengerDestinationAliases() currentDestination: " + currentDestination + ", Alias_PassengerDestination.GetLocation(): " + Alias_PassengerDestination.GetLocation() + ", Alias_PassengerDestinationMarker.GetReference(): " + Alias_PassengerDestinationMarker.GetReference())
    endif
EndFunction