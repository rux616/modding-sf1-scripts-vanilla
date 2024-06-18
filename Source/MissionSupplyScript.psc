Scriptname MissionSupplyScript extends MissionQuestScript conditional
{mission to supply resource to a settlement}

group MissionTypeData
	SQ_ParentScript property SQ_Parent auto const Mandatory

	SQ_OutpostCargoLinkScript property SQ_OutpostCargoLink auto const Mandatory

    RefCollectionAlias property SourceCollection01 auto const
    { Optional - only needed if there are multiple ref types }

    RefCollectionAlias property SourceCollection02 auto const
    { Optional - only needed if there are multiple ref types }
    
    keyword property LinkOutpostCargoLink auto const mandatory
    { keyword to find linked ref of my cargo link }

    ReferenceAlias property SourceCargoLinkActivator auto const mandatory
    { activator player uses to establish cargo link }

    ReferenceAlias property PlayerCargoLink auto const mandatory
    { player's linked cargo link }

    ReferenceAlias property Builder auto const mandatory
    { created "builder" to simulate supply need }

    int property EstablishCargoLinkObjective = 10 auto const
    { objective for establishing a cargo link }

    int property SupplyResourceObjective = 20 auto const
    { objective for supplying resource }

    ActorValue property MissionAmountMax auto const mandatory
    { holds max amount of shipment on supply marker }

    ActorValue property MissionSupplyAmountMult auto const mandatory
    { holds max amount of shipment on supply marker }

    ActorValue property MissionRewardBase auto const mandatory
    { holds base reward value (per unit) for shipment on supply marker }

	int property MissionAcceptTutorialID = 4 auto const
	{ tutorial ID when accepting this mission - see SQ_Parent.TutorialMessages }

    LocationAlias property PlayerOutpostLocation auto const mandatory
    { filled when player enters an outpost location }

    ReferenceAlias property PlayerOutpostBeacon auto const mandatory
    { filled when player enters an outpost location }

    RefCollectionAlias property PlayerCargoLinks auto const mandatory
    { used to provide QT to nearby player cargo links if they exist }

    keyword property LocTypeOutpost auto const mandatory
    { keyword to find outpost locations }

    keyword property OutpostTutorialCargoLink auto const mandatory
    { keyword to find when a cargo link is placed }
EndGroup

ObjectReference incomingCargoRef
MissionBoardSupplyMarkerScript supplyMarker
OutpostCargoLinkMarkerScript myCargoLink

Event OnQuestStarted()
	debug.trace(self + " OnQuestStarted")

    myCargoLink = SourceCargoLinkActivator.GetRef().GetLinkedRef(LinkOutpostCargoLink) as OutpostCargoLinkMarkerScript
    incomingCargoRef = myCargoLink.GetLinkedRef(SQ_OutpostCargoLink.LinkOutpostCargoIncoming)
    ; check if we should fill primaryRef from the collections
    if SourceCollection01 && SourceCollection02
        ; make an array of anything that matches between the two collections
        ObjectReference[] validRefs = new ObjectReference[0]
        int i = 0
        while i < SourceCollection01.GetCount()
            ObjectReference testRef = SourceCollection01.GetAt(i)
            if SourceCollection02.Find(testRef) > -1
                validRefs.Add(testRef)
            endif
            i += 1
        endwhile
        debug.trace(self + " valid refs from two collections=" + validRefs)
        if validRefs.Length > 0
            int randomIndex = Utility.RandomInt(0, validRefs.Length-1)
            PrimaryRef.ForceRefTo(validRefs[randomIndex])
        endif
    endif
    supplyMarker = PrimaryRef.GetRef() as MissionBoardSupplyMarkerScript
    debug.trace(self + " supplyMarker=" + supplyMarker)
    if supplyMarker
        Parent.OnQuestStarted()
    Else
        Debug.Trace(self + " no valid supply marker found - stopping quest")
        Stop()
    EndIf
endEvent

; override parent function
Function MissionAccepted(bool bAccepted)
    if bAccepted
		SQ_Parent.ShowTutorialMessage(MissionAcceptTutorialID)
        RegisterForCustomEvent(SQ_OutpostCargoLink, "SQ_OutpostCargoLinkUnloadCargo")
        RegisterForCustomEvent(SQ_OutpostCargoLink, "SQ_OutpostCargoLinkChanged")
        RegisterForRemoteEvent(PlayerOutpostBeacon, "OnWorkshopObjectRemoved")
        RegisterForRemoteEvent(PlayerOutpostBeacon, "OnWorkshopObjectPlaced")
        RegisterForRemoteEvent(Game.GetPlayer(), "OnOutpostPlaced")

        ; make menu activator "active"
        MissionCargoLinkActivatorScript activatorRef = SourceCargoLinkActivator.GetRef() as MissionCargoLinkActivatorScript
        activatorRef.AllowActivation(true)
        ; enable builder
        Builder.TryToEnable()
        ; enable cargo link
        myCargoLink.EnableNoWait()
    endif
    Parent.MissionAccepted(bAccepted)
EndFunction

; OVERRIDE parent function
Function HandleOnQuestRejected()
    ; reward only for what has been delivered
    debug.Trace(self + "HandleOnQuestRejected MissionIntValue02: " + MissionIntValue02 + "=" + MissionIntValue02.GetValueInt())
    UpdateSupplyAmount(MissionIntValue02.GetValueInt())
    if MissionIntValue02.GetValueInt() > 0
        MissionComplete()
    Else
        MissionFailed()
    EndIf
endFunction

; override parent function
Function HandlePlayerLocationChange(Location akOldLoc, Location akNewLoc)
	debug.trace(self + " HandlePlayerLocationChange akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
    if akNewLoc && akNewLoc.HasKeyword(LocTypeOutpost)
        PlayerOutpostLocation.ForceLocationTo(akNewLoc)
        PlayerOutpostLocation.RefillDependentAliases()
        UpdatePlayerOutpostAliases()
    endif
EndFunction

; override parent function
Function MissionComplete()
    CleanupMission()
    Parent.MissionComplete()
EndFunction

; override parent function
Function MissionFailed()
    CleanupMission()
    Parent.MissionFailed()
EndFunction

Function CleanupMission()
	UnregisterForCustomEvent(SQ_OutpostCargoLink, "SQ_OutpostCargoLinkUnloadCargo")
    ; make menu activator "inactive"
    MissionCargoLinkActivatorScript activatorRef = SourceCargoLinkActivator.GetRef() as MissionCargoLinkActivatorScript
    activatorRef.AllowActivation(false)
    ; disable builder
    ObjectReference theBuilder = Builder.GetRef()
    ; remove transfer link from cargo link incoming container to builder
    incomingCargoRef.RemoveTransferLink(theBuilder)
    theBuilder.Disable()
    ; clear cargo link
    SQ_OutpostCargoLink.ClearCargoLink(myCargoLink, NONE)
    ; disable cargo link
    myCargoLink.DisableNoWait()
EndFunction

; OVERRIDE parent function
int Function GetActualReward()
    return UpdateSupplyAmount()
endFunction

; passing in < 0 means to calculate using the normal method
int function UpdateSupplyAmount(int overrideAmount = -1)
    debug.trace(self + " UpdateSupplyAmount overrideAmount=" + overrideAmount)
    Location sourceLocation = TargetLocation.GetLocation()
   
    MissionParentScript:MissionSupplyType[] resourceAVs = MissionParent.resourceAVs
    int i = 0
    Resource myResource = NONE
    ActorValue myActorValue = None

    while i < resourceAVs.Length && myResource == NONE
        MissionParentScript:MissionSupplyType theSupplyType = resourceAVs[i]
        int minSupplyAmount = supplyMarker.GetValue(theSupplyType.supplyAV) as int
        if minSupplyAmount > 0
            myActorValue = theSupplyType.supplyAV
            myResource = myActorValue.GetResource()

            supplyMarker.myResource = myResource

            ; roll for amount
            int supplyAmount = Utility.RandomInt(minSupplyAmount, supplyMarker.GetValueInt(MissionAmountMax))
            if supplyAmount > 1000
                ; Round to the nearest 100
                int supplyAmountModulo = supplyAmount % 100
                if supplyAmountModulo > 50
                    supplyAmount += (100 - supplyAmountModulo)
                else
                    supplyAmount -= supplyAmountModulo
                endif
            else
                ; Round to the nearest 10
                int supplyAmountModulo = supplyAmount % 10
                if supplyAmountModulo > 5
                    supplyAmount += (10 - supplyAmountModulo)
                else
                    supplyAmount -= supplyAmountModulo
                endif
            endif
            
            if overrideAmount < 0
                ; mult from location, if any
                ; In practice, this increases the amount requested by certain
                ; settlement locations.
                float supplyAmountMult = sourceLocation.GetValue(MissionSupplyAmountMult)
                if supplyAmountMult > 0
                    supplyAmount = (supplyAmount*supplyamountMult) as int
                endif
            Else
                supplyAmount = overrideAmount
            EndIf

            debug.trace(self + " supplyAmount=" + supplyAmount)
            MissionIntValue01.SetValueInt(supplyAmount)

            UpdateCurrentInstanceGlobal(MissionIntValue01)

            ; set matching supply need resourceAV on builder
            ObjectReference theBuilder = Builder.GetRef()
            ActorValue supplyNeedAV = MissionParent.supplyNeedAVs[i]

            theBuilder.SetValue(supplyNeedAV, supplyAmount) 

            debug.trace(self + " i=" + i + " supplyNeedAV=" + supplyNeedAV + " myResource=" + myResource)

            ; set this as the max needed on cargo link
            myCargoLink.SpecificCargoMax = supplyAmount
            myCargoLink.SpecificCargo = supplyMarker.myResource

            ; create transfer link from cargo link incoming container to builder
            bool bSuccess = incomingCargoRef.AddTransferLink(theBuilder)
            debug.trace(self + " created transfer link to fake builder: bSuccess=" + bSuccess)

        endif
        i += 1
    EndWhile

    ; calculate reward
	debug.trace(self + "reward=" +  MissionIntValue01.GetValue() + " * " + supplyMarker.GetValue(MissionRewardBase))
    float reward = ( MissionIntValue01.GetValue() * supplyMarker.GetValue(MissionRewardBase) )
    
    ; Modify reward by location; check if location has a mult for this AV
    float locationMult = sourceLocation.GetValue(myActorValue)
    if locationMult > 0
    	debug.trace(self + "modify reward by location mult=" +  locationMult)
        reward = reward * locationMult
    endif

	debug.trace(self + "UpdateSupplyAmount=" + reward)
	return reward as int
EndFunction

Guard cargoLinkGuard ProtectsFunctionLogic

function CargoLinkEstablished(ObjectReference newCargoLink)
    debug.trace(self + " CargoLinkEstablished")
    LockGuard cargoLinkGuard
        ; for now, update objective
        SetObjectiveCompleted(EstablishCargoLinkObjective)
        SetObjectiveDisplayed(SupplyResourceObjective)
        PlayerCargoLink.ForceRefTo(newCargoLink)
    EndLockGuard
EndFunction

function CargoLinkCleared()
    debug.trace(self + " CargoLinkCleared")
    LockGuard cargoLinkGuard
        ; set uncompleted
        SetObjectiveCompleted(EstablishCargoLinkObjective, false)
        PlayerCargoLink.Clear()
    EndLockGuard
EndFunction

Event SQ_OutpostCargoLinkScript.SQ_OutpostCargoLinkUnloadCargo(SQ_OutpostCargoLinkScript akSender, Var[] akArgs)
	ObjectReference eventCargoRef = akArgs[0] as ObjectReference
    SpaceshipReference cargoShipRef = akArgs[1] as SpaceshipReference
	debug.trace(self + " SQ_OutpostCargoLinkUnloadCargo event received for " + incomingCargoRef)

    ; if this is our cargo link, check inventory for target resource
    if incomingCargoRef == eventCargoRef
        debug.trace(self + "   incoming cargo - check for target resource")
        int neededAmount = MissionIntValue01.GetValueInt()     
        int newResources = incomingCargoRef.RemoveResources(supplyMarker.myResource, neededAmount, true)
        incomingCargoRef.RemoveAllItems()

        ; update global for amount removed
        debug.trace(self + "   newResources=" + newResources)
        if newResources > 0
            ModObjectiveGlobal(newResources, MissionIntValue02, SupplyResourceObjective, neededAmount)
        EndIf
        
        int currentAmount = MissionIntValue02.GetValueInt()
        if currentAmount >= neededAmount
            MissionComplete()
        Else
            ; update cargo link with new needed amount
            myCargoLink.SpecificCargoMax = (neededAmount - currentAmount)
        endif
    endif
EndEvent

Event SQ_OutpostCargoLinkScript.SQ_OutpostCargoLinkChanged(SQ_OutpostCargoLinkScript akSender, Var[] akArgs)
	ObjectReference outpostRef = akArgs[0] as ObjectReference
    ObjectReference cargoLinkRef = akArgs[1] as ObjectReference
    ObjectReference akOldTarget = akArgs[2] as ObjectReference
    ObjectReference akNewTarget = akArgs[3] as ObjectReference
	debug.trace(self + " SQ_OutpostCargoLinkChanged event received for " + cargoLinkRef + ": akOldTarget=" + akOldTarget + " akNewTarget=" + akNewTarget)

    if akOldTarget == myCargoLink && akNewTarget != myCargoLink
        ; update quest
        CargoLinkCleared()
    elseif akNewTarget == myCargoLink && akNewTarget != akOldTarget
        ; update quest - player has linked something to my cargo link
        CargoLinkEstablished(cargoLinkRef)
    endif
EndEvent

Guard outpostaliasguard ProtectsFunctionLogic

function UpdatePlayerOutpostAliases(ObjectReference akSourceRef = NONE)
    debug.trace(self + "UpdatePlayerOutpostAliases akSourceRef=" + akSourceRef)
    LockGuard outpostaliasguard
        Location outpostLocation
        if akSourceRef
            ; update outpost location
            outpostLocation = akSourceRef.GetCurrentLocation()
            PlayerOutpostLocation.ForceLocationTo(outpostLocation)
            PlayerOutpostLocation.RefillDependentAliases()
        Else
            outpostLocation = PlayerOutpostLocation.GetLocation()
        EndIf

        ; if target is in different system, only count fueled cargo links
        bool sameSystem = MissionSourceLocation.IsSameLocation(outpostLocation, MissionParent.LocTypeStarSystem)
        debug.trace(self + "  source is in same system as this outpost? " + sameSystem)
        if sameSystem == false
            ; remove anything that isn't a fueled cargo link from collection
            Keyword OutpostCargoLinkFueledKeyword = MissionParent.OutpostCargoLinkFueledKeyword
            int i = PlayerCargoLinks.GetCount() - 1
            while i >= 0
                OutpostCargoLinkMenuScript cargoLinkActivatorRef = PlayerCargoLinks.GetAt(i) as OutpostCargoLinkMenuScript
                if cargoLinkActivatorRef
                    ObjectReference cargoLinkRef = cargoLinkActivatorRef.GetLinkedRef(cargoLinkActivatorRef.LinkOutpostCargoLink)
                    if cargoLinkRef && cargoLinkRef.HasKeyword(OutpostCargoLinkFueledKeyword) == false
                        debug.trace(self + " removing non-fueled cargo link activator " + cargoLinkActivatorRef)
                        PlayerCargoLinks.RemoveRef(cargoLinkActivatorRef)
                    endif
                endif
                i -= 1
            EndWhile
        endif
    EndLockGuard
EndFunction

Event ReferenceAlias.OnWorkshopObjectPlaced(ReferenceAlias akSource, ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectPlaced " + akReference)
    if akReference.HasKeyword(OutpostTutorialCargoLink)
        UpdatePlayerOutpostAliases(akReference)
    endif
EndEvent

Event ReferenceAlias.OnWorkshopObjectRemoved(ReferenceAlias akSource, ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectRemoved " + akReference)
    if akReference.HasKeyword(OutpostTutorialCargoLink)
        UpdatePlayerOutpostAliases(akReference)
    endif
EndEvent

Event Actor.OnOutpostPlaced(Actor akSource, ObjectReference akOutpostBeacon)
    debug.trace(self + " OnOutpostPlaced " + akOutpostBeacon)
    UpdatePlayerOutpostAliases(akOutpostBeacon)
endEvent