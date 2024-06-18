Scriptname SQ_OutpostCargoLinkScript extends Quest
{script to handle outpost cargo links}

Keyword property LinkOutpostCargoLandingMarker auto const mandatory
{ get linked ref for landing marker }

Keyword property LinkOutpostCargoOutgoing auto const mandatory
{ get linked ref for outgoing container }

Keyword property LinkOutpostCargoIncoming auto const mandatory
{ get linked ref for incoming container }

Keyword property LinkOutpostCargoLinkActive auto const mandatory
{ used to link cargo link refs to each other }

Keyword property LinkOutpostCargoLinkShip auto const mandatory
{ used to link primary cargo link ref to the ship }

Keyword property OutpostCargoLinkKeyword auto const mandatory
{ keyword used to find cargo links }

Keyword property OutpostCargoLinkMission auto const mandatory
{ keyword to identify supply mission cargo links }

Keyword property OutpostProductionHalted auto const mandatory
{ used to halt production }

ReferenceAlias property LinkedOutpost auto const mandatory
{ used for text replacement in cargo link messages }

SQ_PlayerShipScript property SQ_PlayerShip auto const mandatory
{ to put inventory into when a cargo link is deleted }

Message property OutpostCargoLinkFailureMessage auto const mandatory
{ message in case unable to create a link (this should only be possible to happen at a "mission" cargo link) }

group cargoLinkAchivementData
    RefCollectionAlias property CargoLinks auto const mandatory
    { used to count linked outposts for cargo link achievement }

    int property CargoLinkAchievement = 24 auto Const

    int property CargoLinkOutpostCountRequired = 5 auto const
    { min linked outposts to get achievement }
EndGroup

int cargoLinkCreationTimerID = 1 Const
float cargoLinkCreationTimer = 1.0 Const
bool cargoLinkAchievementDone = false 

group cargoshipLinks
    Keyword property LinkOutpostCargoShipIncoming01 auto const mandatory
    Keyword property LinkOutpostCargoShipIncoming02 auto const mandatory

    Keyword property LinkOutpostCargoShipOutgoing01 auto const mandatory
    Keyword property LinkOutpostCargoShipOutgoing02 auto const mandatory

    Keyword property LinkOutpostCargoShipLandingMarker01 auto const mandatory
    Keyword property LinkOutpostCargoShipLandingMarker02 auto const mandatory

    Keyword property LinkOutpostCargoShipCargoLink01 auto const mandatory
    Keyword property LinkOutpostCargoShipCargoLink02 auto const mandatory

    Keyword property LinkOutpostCargoShipLandingMarkerCurrent auto const mandatory
endGroup

SpaceshipBase property OutpostCargoLinkShip01 auto const mandatory
{ spaceship base for cargo ship }

ActorValue property OutpostCargoLinkShipDestination auto const mandatory
{ use to condition packages }

struct animData
    int stateID
    String lightColorEvent
    String lightStateEvent
    String description ; text description for documentation
endStruct

animData[] property animationStates auto Const
{ array of animations to play at different states }

int property stateEnum00_unlinked = 0 auto const hidden
int property stateEnum01_linked = 1 auto const hidden
int property stateEnum02_landing = 2 auto const hidden
int property stateEnum03_landed = 3 auto const hidden

CustomEvent SQ_OutpostCargoLinkUnloadCargo
CustomEvent SQ_OutpostCargoLinkLoadCargo

CustomEvent SQ_OutpostCargoLinkChanged ; sent when a cargo link changes to a new target

Event OnQuestInit()
    debug.trace(self + " OnQuestInit")
EndEvent

function ShipLanding(SpaceshipReference cargoShipRef, bool atOutpost01, int animState)
    debug.trace(self + " ShipLanding cargoShipRef=" + cargoShipRef + " atOutpost01=" + atOutpost01)
    
    OutpostCargoLinkMarkerScript cargolinkMarker    
    if atOutpost01
        cargolinkMarker = cargoShipRef.GetLinkedRef(LinkOutpostCargoShipCargoLink01) as OutpostCargoLinkMarkerScript
    Else
        cargolinkMarker = cargoShipRef.GetLinkedRef(LinkOutpostCargoShipCargoLink02) as OutpostCargoLinkMarkerScript
    endif
    SetAnimationState(cargoLinkMarker, animState)
EndFunction

; return value: TRUE if cargo link can produce, FALSE if it can't
bool function TransferCargo(SQ_OutpostCargoLinkShipScript cargoShipRef, bool atOutpost01, bool bUnloadCargo)
    debug.trace(self + " Transferring inventory atOutpost01=" + atOutpost01 + " bUnloadCargo=" + bUnloadCargo)
    
    Keyword outgoingKeyword
    Keyword incomingKeyword

    if atOutpost01
        outgoingKeyword = LinkOutpostCargoShipOutgoing01
        incomingKeyword = LinkOutpostCargoShipIncoming01
    Else
        outgoingKeyword = LinkOutpostCargoShipOutgoing02
        incomingKeyword = LinkOutpostCargoShipIncoming02
    endif
    bool canProduce = true
    ; get cargo links - check for supply mission data
    OutpostCargoLinkMarkerScript cargolinkMarker = cargoShipRef.GetLinkedRef(LinkOutpostCargoShipCargoLink01) as OutpostCargoLinkMarkerScript
    OutpostCargoLinkMarkerScript cargolinkMarker2 = cargoShipRef.GetLinkedRef(LinkOutpostCargoShipCargoLink02) as OutpostCargoLinkMarkerScript

    if bUnloadCargo
        ; move inventory from ship to outpost incoming
        ObjectReference incomingRef = cargoShipRef.GetLinkedRef(incomingKeyword)

        if cargolinkMarker && cargolinkMarker.SpecificCargo
            debug.trace(self + " unloading specific cargo " + cargolinkMarker.SpecificCargo + " into incoming container " + incomingRef + "; adding " + cargoShipRef.GetItemCount(cargolinkMarker.SpecificCargo))
            ; only try to move specific cargo
            cargoShipRef.RemoveItemByComponent(cargolinkMarker.SpecificCargo, cargolinkMarker.SpecificCargoMax, akOtherContainer=incomingRef)
        elseif cargolinkMarker2 && cargolinkMarker2.SpecificCargo
            debug.trace(self + " unloading specific cargo " + cargolinkMarker2.SpecificCargo + " into incoming container " + incomingRef + "; adding " + cargoShipRef.GetItemCount(cargolinkMarker2.SpecificCargo))
            ; only try to move specific cargo
            cargoShipRef.RemoveItemByComponent(cargolinkMarker2.SpecificCargo, cargolinkMarker2.SpecificCargoMax, akOtherContainer=incomingRef)
        else
            debug.trace(self + " unloading cargo into incoming container " + incomingRef + "; adding " + cargoShipRef.GetWeightInContainer())
            ; move everything on ship
            cargoShipRef.RemoveAllItems(incomingRef, abRespectTargetCapacity=true)
        endif
        debug.trace(self + " calling MoveContainerContentToUnfilledContainers on incoming container " + incomingRef)
        incomingRef.MoveContainerContentToUnfilledContainers()
        canProduce = CargoLinkCanProduce(cargoShipRef, atOutpost01)
        debug.trace(self + " incoming container canProduce=" + canProduce + " total inventory weight=" + incomingRef.GetWeightInContainer())
        SendOutpostCargoLinkUnloadCargoEvent(incomingRef, cargoShipRef)
    Else
        ; from outpost outgoing to ship
        ObjectReference outgoingRef = cargoShipRef.GetLinkedRef(outgoingKeyword)
        debug.trace(self + " calling MoveContainerContentToUnfilledContainers on outgoing container " + outgoingRef)
        outgoingRef.MoveContainerContentToUnfilledContainers()
        bool bDoneLoading = false
        int totalLoaded = 0 ; for when we're loading a specific amount
        while bDoneLoading == false
            ; refill outgoing container to make room in linked containers
            outgoingRef.MoveContainerContentToUnfilledContainers()
            int itemCountBeforeLoading = outgoingRef.GetItemCount() ; count before loading
            if cargolinkMarker && cargolinkMarker.SpecificCargo
                ; only try to move specific cargo
                debug.trace(self + " loading specific cargo " + cargolinkMarker.SpecificCargo + " from outgoing container " + outgoingRef + "; trying to add " + cargolinkMarker.SpecificCargoMax)
                totalLoaded += outgoingRef.RemoveItemByComponent(cargolinkMarker.SpecificCargo, cargolinkMarker.SpecificCargoMax, akOtherContainer=cargoShipRef)
            elseif cargolinkMarker2 && cargolinkMarker2.SpecificCargo
                ; only try to move specific cargo
                debug.trace(self + " loading specific cargo " + cargolinkMarker2.SpecificCargo + " from outgoing container " + outgoingRef + "; trying to add " + cargolinkMarker2.SpecificCargoMax)
                totalLoaded += outgoingRef.RemoveItemByComponent(cargolinkMarker2.SpecificCargo, cargolinkMarker2.SpecificCargoMax, akOtherContainer=cargoShipRef)
            else
                debug.trace(self + " loading cargo from outgoing container " + outgoingRef + "; adding " + outgoingRef.GetWeightInContainer())
                ; move everything
                outgoingRef.RemoveAllItems(cargoShipRef, abRespectTargetCapacity=true)
            endif
            bDoneLoading = (itemCountBeforeLoading == outgoingRef.GetItemCount())
            if bDoneLoading== false && cargolinkMarker && cargolinkMarker.SpecificCargo
                ; if loading a specific amount, check if we have it already - if so, stop loading
                bDoneLoading = (totalLoaded >= cargolinkMarker.SpecificCargoMax)
            endif
            debug.trace(self + " itemCountBeforeLoading=" + itemCountBeforeLoading + " bDoneLoading=" + bDoneLoading)
        endWhile
        SendOutpostCargoLinkLoadCargoEvent(outgoingRef, cargoShipRef)
    endif
    return canProduce
endFunction

Guard cargoLinkGuard ProtectsFunctionLogic

bool function CreateCargoLink(ObjectReference cargoLink01Ref, ObjectReference cargoLink02Ref)
    debug.trace(self + "CreateCargoLink between " + cargoLink01Ref + " and " + cargoLink02Ref)
    bool success = false
    LockGuard cargoLinkGuard

        debug.trace(self + " " + cargoLink01Ref + " HasKeyword(LinkOutpostCargoLinkActive)= " + cargoLink01Ref.HasKeyword(LinkOutpostCargoLinkActive))
        debug.trace(self + " " + cargoLink02Ref + " HasKeyword(LinkOutpostCargoLinkActive)= " + cargoLink02Ref.HasKeyword(LinkOutpostCargoLinkActive))

        debug.trace(self + " " + cargoLink01Ref + " GetLinkedRef(LinkOutpostCargoLinkActive)= " + cargoLink01Ref.GetLinkedRef(LinkOutpostCargoLinkActive))
        debug.trace(self + " " + cargoLink02Ref + " GetLinkedRef(LinkOutpostCargoLinkActive)= " + cargoLink02Ref.GetLinkedRef(LinkOutpostCargoLinkActive))

        ; get refs needed for cargo ship
        ObjectReference cargoLink01LandingMarker = CargoLink01Ref.GetLinkedRef(LinkOutpostCargoLandingMarker)
        ObjectReference cargoLink02LandingMarker = CargoLink02Ref.GetLinkedRef(LinkOutpostCargoLandingMarker)
        
        ObjectReference cargoLink01Outgoing = CargoLink01Ref.GetLinkedRef(LinkOutpostCargoOutgoing)
        ObjectReference cargoLink02Outgoing = CargoLink02Ref.GetLinkedRef(LinkOutpostCargoOutgoing)

        ObjectReference cargoLink01Incoming = CargoLink01Ref.GetLinkedRef(LinkOutpostCargoIncoming)
        ObjectReference cargoLink02Incoming = CargoLink02Ref.GetLinkedRef(LinkOutpostCargoIncoming)

        debug.trace(self + " landing markers: " + cargoLink01LandingMarker + " " + cargoLink02LandingMarker)
        debug.trace(self + " incoming: " + cargoLink01Incoming + " " + cargoLink02Incoming)
        debug.trace(self + " outgoing: " + cargoLink01Outgoing + " " + cargoLink02Outgoing)

        ; create ship
        SpaceshipBase cargoLinkShipBase = OutpostCargoLinkShip01
        OutpostCargoLinkMarkerScript cargolinkMarker = cargoLink01Ref as OutpostCargoLinkMarkerScript
        bool CreateShipAtCargoLink01 = true
        if cargolinkMarker
            CreateShipAtCargoLink01 = cargolinkMarker.CreateShipAtCargoLink01
        endif
        if cargolinkMarker && cargolinkMarker.OutpostCargoLinkShip
            cargoLinkShipBase = cargolinkMarker.OutpostCargoLinkShip
        endif
        SpaceshipReference cargoShipRef
        int failsafeCount = 0
        while cargoShipRef == None && failsafeCount < 30
            if CreateShipAtCargoLink01
                cargoShipRef = cargoLink01LandingMarker.PlaceShipAtMe(cargoLinkShipBase)
            Else
                cargoShipRef = cargoLink02LandingMarker.PlaceShipAtMe(cargoLinkShipBase)
            endif
            ; if can't create cargo ship right now because landing marker is busy, wait until it isn't
            ; GEN-383898
            if cargoShipRef == None
                failsafeCount += 1
                utility.wait(1.0)
            endif
        endWhile

        if cargoShipRef
            success = true
            debug.trace(self + " cargoship: " + cargoShipRef)
            if cargolinkMarker
                ; set fuel requirement from cargo link setting
                (cargoShipRef as SQ_OutpostCargoLinkShipScript).RequiresFuel = cargolinkMarker.RequiresFuel
            endif

            cargoLink01Ref.SetLinkedRef(cargoShipRef, LinkOutpostCargoLinkShip)
            cargoLink02Ref.SetLinkedRef(cargoShipRef, LinkOutpostCargoLinkShip)

            ; link to landing markers
            cargoShipRef.SetLinkedRef(cargoLink01LandingMarker, LinkOutpostCargoShipLandingMarker01)
            cargoShipRef.SetLinkedRef(cargoLink02LandingMarker, LinkOutpostCargoShipLandingMarker02)

            ; link to current landing marker
            if CreateShipAtCargoLink01
                cargoShipRef.SetLinkedRef(cargoLink01LandingMarker, LinkOutpostCargoShipLandingMarkerCurrent)
                SetAnimationState(cargoLink01Ref, stateEnum02_landing)     
                SetAnimationState(cargoLink02Ref, stateEnum01_linked)
            Else
                cargoShipRef.SetLinkedRef(cargoLink02LandingMarker, LinkOutpostCargoShipLandingMarkerCurrent)
                cargoShipRef.SetValue(OutpostCargoLinkShipDestination, 1)
                SetAnimationState(cargoLink02Ref, stateEnum02_landing)     
                SetAnimationState(cargoLink01Ref, stateEnum01_linked)
            endif

            ; link to cargo containers
            cargoShipRef.SetLinkedRef(cargoLink01Outgoing, LinkOutpostCargoShipOutgoing01)
            cargoShipRef.SetLinkedRef(cargoLink02Outgoing, LinkOutpostCargoShipOutgoing02)

            cargoShipRef.SetLinkedRef(cargoLink01Incoming, LinkOutpostCargoShipIncoming01)
            cargoShipRef.SetLinkedRef(cargoLink02Incoming, LinkOutpostCargoShipIncoming02)

            ; link to cargo link refs
            cargoShipRef.SetLinkedRef(cargoLink01Ref, LinkOutpostCargoShipCargoLink01)
            cargoShipRef.SetLinkedRef(cargoLink02Ref, LinkOutpostCargoShipCargoLink02)

            LinkedOutpost.ForceRefTo(cargoLink02Ref.GetWorkshop())

            ; clear keyword - so they start to consume resources
            cargoLink01Ref.RemoveKeyword(OutpostProductionHalted)
            cargoLink02Ref.RemoveKeyword(OutpostProductionHalted)
        endif

        if success == false
            OutpostCargoLinkFailureMessage.Show()
        Else
            (cargoLink01Ref as OutpostCargoLinkMarkerScript).isLinked = true
            (cargoLink02Ref as OutpostCargoLinkMarkerScript).isLinked = true
            ; check for achievement
            if cargoLinkAchievementDone == false
                StartTimer(cargoLinkCreationTimer, cargoLinkCreationTimerID)
            endif
        endif
    EndLockGuard
    return success
endFunction

function ClearCargoLink(ObjectReference cargoLink01Ref, ObjectReference cargoLink02Ref)
    debug.trace(self + " ClearCargoLink " + cargoLink01Ref + " " + cargoLink02Ref)

    LockGuard cargoLinkGuard
        SQ_OutpostCargoLinkShipScript cargoShipRef = cargoLink01Ref.GetLinkedRef(LinkOutpostCargoLinkShip) as SQ_OutpostCargoLinkShipScript
        if cargoShipRef
            ; move cargo ship inventory to player ship before deleting it
            ObjectReference playerShip = SQ_PlayerShip.HomeShip.GetRef()
            if playerShip
                debug.trace(self + " moving cargo ship inventory to player ship " + playerShip)
                cargoShipRef.RemoveAllItems(playerShip, abRespectTargetCapacity=true)
            endif
            ; move anything remaining to player
            cargoShipRef.RemoveAllItems(Game.GetPlayer())
        endif

        ; if cargoLink02Ref not specified, means the call is coming from deleting the cargo link - get cargolink02
        if cargoLink02Ref == None
            cargoLink02Ref = cargoLink01Ref.GetLinkedRef(LinkOutpostCargoLinkActive)    
            debug.trace(self + " cargoLink02Ref not specified:  cargoLink01Ref.GetLinkedRef(LinkOutpostCargoLinkActive)=" + cargoLink02Ref)
        EndIf

        ClearCargoLinkRef(cargolink01Ref as OutpostCargoLinkMarkerScript)
        ClearCargoLinkRef(cargolink02Ref as OutpostCargoLinkMarkerScript)

        ; delete ship
        debug.trace(self + " ClearCargoLink: deleting ship " + cargoShipRef)
        if cargoShipRef
            ; Clear any linked refs on the ship
            cargoShipRef.SetLinkedRef(NONE, LinkOutpostCargoShipLandingMarker01)
            cargoShipRef.SetLinkedRef(NONE, LinkOutpostCargoShipLandingMarker02)
            
            cargoShipRef.SetLinkedRef(NONE, LinkOutpostCargoShipLandingMarkerCurrent)

            cargoShipRef.SetLinkedRef(NONE, LinkOutpostCargoShipOutgoing01)
            cargoShipRef.SetLinkedRef(NONE, LinkOutpostCargoShipOutgoing02)

            cargoShipRef.SetLinkedRef(NONE, LinkOutpostCargoShipIncoming01)
            cargoShipRef.SetLinkedRef(NONE, LinkOutpostCargoShipIncoming02)

            cargoShipRef.SetLinkedRef(NONE, LinkOutpostCargoShipCargoLink01)
            cargoShipRef.SetLinkedRef(NONE, LinkOutpostCargoShipCargoLink02)

            ; if not landed, just disable
            if cargoShipRef.IsLanded() == false
                debug.trace(self + " ClearCargoLink: has no interaction link, OR isn't landed - just disable")
                cargoShipRef.DisableNoWait()
            else
            ; otherwise, disable after taking off
                debug.trace(self + " ClearCargoLink: disable with takeoff")
                cargoShipRef.DisableWithTakeOffOrLandingNoWait()
            endif
            cargoShipRef.CancelTimers()
            cargoShipRef = NONE
        endif

        SetAnimationState(cargoLink01Ref, stateEnum00_unlinked)        
        SetAnimationState(cargoLink02Ref, stateEnum00_unlinked)        
    EndLockGuard
endFunction

function ClearCargoLinkRef(OutpostCargoLinkMarkerScript cargoLinkRef) Private
    if cargoLinkRef
        ; halt production - so they don't consume resources
        if cargoLinkRef.RequiresFuel
            cargoLinkRef.AddKeyword(OutpostProductionHalted)
        endif
        ; clear linked refs
        cargoLinkRef.SetLinkedRef(NONE, LinkOutpostCargoLinkShip)

        ; code clears these links when a cargo link is cleared from the menu, but script needs to handle it when an object is deleted
        cargoLinkRef.SetLinkedRef(NONE, LinkOutpostCargoLinkActive)

        cargoLinkRef.isLinked = false
    endif
EndFunction

function SendOutpostCargoLinkUnloadCargoEvent(ObjectReference incomingCargoRef, SpaceshipReference cargoShipRef)
	; Send the unload cargo event
	Var[] kargs = new Var[2]
	kargs[0] = incomingCargoRef
	kargs[1] = cargoShipRef
	SendCustomEvent("SQ_OutpostCargoLinkUnloadCargo", kargs)
endFunction

function SendOutpostCargoLinkLoadCargoEvent(ObjectReference outgoingCargoRef, SpaceshipReference cargoShipRef)
	; Send the load cargo event
	Var[] kargs = new Var[2]
	kargs[0] = outgoingCargoRef
	kargs[1] = cargoShipRef
	SendCustomEvent("SQ_OutpostCargoLinkLoadCargo", kargs)
endFunction

; if either cargo link can produce, ship can move
bool function CargoLinkCanProduce(SQ_OutpostCargoLinkShipScript cargoShipRef, bool atOutpost01)

    debug.trace(self + " CargoLinkCanProduce: " + cargoShipRef + " RequiresFuel=" + cargoShipRef.RequiresFuel)

    bool canProduce = (cargoShipRef.RequiresFuel == false)
    if canProduce == false
        ObjectReference[] shipCargoLinks = cargoShipRef.GetRefsLinkedToMe(LinkOutpostCargoLinkShip)

        int i = 0
        while i < shipCargoLinks.Length && canProduce == false
            ObjectReference cargoLinkRef = shipCargoLinks[i]
            ; always require the other end of a mission cargo link to be able to produce (otherwise you wouldn't need to fuel intersystem cargo links for supply missions)
            canProduce = ( cargoLinkRef.HasKeyword(OutpostCargoLinkMission) == false && cargoLinkRef.CanProduceForWorkshop() )
            debug.trace(self + " CargoLinkCanProduce: checking " + cargoShipRef + "=" + canProduce)
            i += 1
        EndWhile
    endif
    debug.trace(self + " CargoLinkCanProduce: " + cargoShipRef + "=" + canProduce)
    return canProduce
EndFunction

; call to change animation state
function SetAnimationState(ObjectReference cargoLinkRef, int stateEnum)
    if cargoLinkRef
        OutpostCargoLinkMarkerScript cargoLinkMarkerRef = cargoLinkRef as OutpostCargoLinkMarkerScript
        if cargoLinkMarkerRef
            animData theData = GetAnimationData(stateEnum)
            if theData
                debug.trace(self + " changing to animation state " + stateEnum + ", light color=" + theData.lightColorEvent + ", light state=" + theData.lightStateEvent)
                cargoLinkMarkerRef.SetAnimationState(theData.stateID, theData)
            Else
                debug.trace(self + " WARNING: animation state " + stateEnum + " not found", 1)
            endif
        endif
    endif
endFunction

animData function GetAnimationData(int stateEnum)
    animData theData
    int stateIndex = animationStates.FindStruct("stateID", stateEnum)
    if stateIndex > -1
        theData = animationStates[stateIndex]
    endif
    return theData
endFunction

function SendOutpostCargoLinkChangedEvent(ObjectReference outpostRef, ObjectReference cargoLinkRef, ObjectReference akOldTarget, ObjectReference akNewTarget)
	debug.trace(self + "SendOutpostCargoLinkChangedEvent outpostRef=" + outpostRef + " cargoLinkRef=" + cargoLinkRef + " akOldTarget=" + akOldTarget + " akNewTarget=" + akNewTarget)
	if outpostRef && cargoLinkRef
		Var[] kargs = new Var[4]
		kargs[0] = outpostRef
		kargs[1] = cargoLinkRef
		kargs[2] = akOldTarget
		kargs[3] = akNewTarget
		SendCustomEvent("SQ_OutpostCargoLinkChanged", kargs)
	Else
		debug.trace(self + " SQ_OutpostCargoLinkChanged NOT SENT: bad parameters: outpostRef=" + outpostRef + " cargoLinkRef=" + cargoLinkRef)
	EndIf
EndFunction

; Cargo Link achievement
Event OnTimer(int aiTimerID)
	; startup timer
	if aiTimerID == cargoLinkCreationTimerID
        CountLinkedOutposts()
	endif
endEvent

guard linkedOutpostGuard ProtectsFunctionLogic

function CountLinkedOutposts()
    debug.trace(self + " CountLinkedOutposts START")
    LockGuard linkedOutpostGuard
        ; refill cargo link collection
        CargoLinks.RefillAlias()
        int cargoLinkCount = CargoLinks.GetCount()
        debug.trace(self + " cargoLinkCount=" + cargoLinkCount)
        if cargoLinkCount > 0
            ; count how many outposts are linked
            ObjectReference[] linkedOutposts = new ObjectReference[0]
            int i = 0
            while i < cargoLinkCount
                OutpostCargoLinkMarkerScript cargoLinkRef = CargoLinks.GetAt(i) as OutpostCargoLinkMarkerScript
                debug.trace(self + " i=" + i + ": cargoLinkRef=" + cargoLinkRef)
                if cargoLinkRef
                    ObjectReference myOutpostRef = cargoLinkRef.GetWorkshop()
                    debug.trace(self + "    islinked=" + cargoLinkRef.isLinked + " myOutpostRef=" + myOutpostRef)
                    if myOutpostRef && cargoLinkRef.isLinked
                        ; add outpost to list if it isn't already in it
                        int foundOutpost = linkedOutposts.Find(myOutpostRef)
                        if foundOutpost < 0
                            debug.trace(self + " adding linked outpost " + myOutpostRef)
                            linkedOutposts.Add(myOutpostRef)
                        endif
                    endif
                endif
                i += 1
            EndWhile
            debug.trace(self + " CountLinkedOutposts DONE: linkedOutposts=" + linkedOutposts.Length + " " + linkedOutposts)

            if linkedOutposts.Length >= CargoLinkOutpostCountRequired
                Game.AddAchievement(CargoLinkAchievement)
                cargoLinkAchievementDone = true
            endif
        endif
        CargoLinks.RemoveAll()
    EndLockGuard
endFunction

function debugRefillCargoLinks()
    CargoLinks.RefillAlias()
EndFunction
