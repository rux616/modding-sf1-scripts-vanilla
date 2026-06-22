Scriptname RI07_PlayerAliasScript extends ReferenceAlias

MiscObject Property RI07_Prototype Auto Const Mandatory
ReferenceAlias Property Prototype Auto Const Mandatory
RefCollectionAlias Property RDEngineers Auto Const Mandatory
Faction Property LC051InfinityLTDPEnemyFaction Auto Const Mandatory

ReferenceAlias Property David Auto Const
Location Property CityNewAtlantisLocation Auto Const

Int Property DavidStartStage Auto Const
Int Property DavidDoneStage Auto Const


Event OnAliasInit()
	AddInventoryEventFilter(RI07_Prototype)
EndEvent


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
Debug.Trace(Self + "RI07: OnItemAdded event fired")
    ; Swap item for a non-stolen version to prevent this from being taken from the player.
    If akBaseItem == RI07_Prototype
        RemoveInventoryEventFilter(RI07_Prototype)
        Game.GetPlayer().AddAliasedItem(RI07_Prototype, Prototype)
    EndIf

    ; Check nearby NPCs for LOS.
    Int iCurrentCount = 0
    Int iTotalCount = RDEngineers.GetCount()

    While iCurrentCount < iTotalCount
    Debug.Trace(Self + "RI07: Start While Loop checks. iCurrentCount: " + iCurrentCount + " iTotalCount: " + iTotalCount) 
        Actor EngineerRef = (RDEngineers.GetAt(iCurrentCount) as Actor)
        Actor PlayerRef = Game.GetPlayer()

        If EngineerRef.HasDetectionLOS(PlayerRef) 
        Debug.Trace(Self + "RI07: NPC Has detection LOS: " + EngineerRef + " Add player to enemy faction.")
            PlayerRef.AddToFaction(LC051InfinityLTDPEnemyFaction)
        Else
        Debug.Trace(Self + "RI07: " + EngineerRef + " does NOT have LOS. Increment counter.")
            iCurrentCount += 1
        EndIf

    EndWhile

EndEvent

; added as a failsafe for David Barron getting moved outside of New Atlantis
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Quest RI07 = GetOwningQuest()

	if RI07.GetStageDone(DavidStartStage) && !RI07.GetStageDone(DavidDoneStage)

	       if akNewLoc == CityNewAtlantisLocation
			Actor DavidRef = David.GetActorRef()

			if DavidRef.GetCurrentLocation() != CityNewAtlantisLocation
				DavidRef.MoveTo(Game.GetPlayer())
				DavidRef.MoveToNearestNavmeshLocation()
			endif

		endif
	endif
endEvent


