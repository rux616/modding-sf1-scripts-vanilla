Scriptname MissionRescueQuestScript extends MissionQuestScript

group RescueMissionData
	SQ_ParentScript property SQ_Parent auto const Mandatory

    ReferenceAlias property Prisoner auto const mandatory
    { prisoner to rescue }

    Faction property EnemyShipFaction auto const mandatory
    { faction to remove from target ship after rescue }

    Faction property CaptiveFaction auto const mandatory
    { remove this from prisoner after rescue }

    RefCollectionAlias property Enemies auto const mandatory
    { filled with enemies on the target ship (after BE quest starts) }

    ActorValue property Suspicious auto const mandatory
    { clear on hostage so won't have }

    Faction property ShipOwnerFaction auto const
    { optional - if set, ship interior will be set with this ownership }

    Keyword property SpaceshipLinkedInterior Auto Const Mandatory
    { to get ship interior cell }
EndGroup

Function MissionAccepted(bool bAccepted)
	debug.trace(self + " MissionAccepted")
    Parent.MissionAccepted(bAccepted)

    if bAccepted
        ; register for boarding encounter events
        RegisterForCustomEvent(SQ_Parent, "SQ_BEStarted")

        ; enable target ship
        SpaceshipReference targetShip = PrimaryRef.GetShipRef()
        targetShip.Enable()
        targetShip.SetValue(Game.GetAggressionAV(), 1) ; make aggressive - or could do this with a custom LVL if you end up making one
        Actor prisonerRef = Prisoner.GetActorRef()
        prisonerRef.IgnoreFriendlyHits(true)

        ; set ownership on ship interior
        if ShipOwnerFaction
            Cell shipInterior = targetShip.GetLinkedCell(SpaceshipLinkedInterior)
            if shipInterior
                shipInterior.SetFactionOwner(ShipOwnerFaction)
                shipInterior.SetPublic(true) ; anything that is player-accessible should not trigger trespassing
            endif
        endif
    endif
endFunction

Function MissionComplete()
	; handle prisoner being rescued
	HandleRescuePrisoner()
	Parent.MissionComplete()
endFunction

function HandleRescuePrisoner()
    debug.trace(self + " HandleRescuePrisoner")

    ; remove prisoner from captive faction
    Prisoner.TryToRemoveFromFaction(CaptiveFaction)
    
    ; remove ship from enemy faction
    PrimaryRef.TryToRemoveFromFaction(EnemyShipFaction)

    Actor prisonerRef = Prisoner.GetActorRef()
    prisonerRef.IgnoreFriendlyHits(false)
    prisonerRef.SetValue(Suspicious, 0)
endFunction

Event SQ_ParentScript.SQ_BEStarted(SQ_ParentScript akSource, Var[] akArgs)
    SpaceshipReference boardedShip = akArgs[0] as SpaceshipReference
    SpaceshipReference targetShip = PrimaryRef.GetShipRef()
    debug.trace(self + " SQ_BEStarted boardedShip=" + boardedShip)
    if boardedShip == targetShip
        ; this is our ship - get the enemies from the BE quest
        BEScript boardingQuest = akArgs[1] as BEScript
        debug.trace(self + " SQ_BEStarted boardingQuest=" + boardingQuest)
        if boardingQuest
            Enemies.AddRefCollection(boardingQuest.AllCrew)
            debug.trace(self + " Enemies created: " + Enemies)
        EndIf
    endif
EndEvent
