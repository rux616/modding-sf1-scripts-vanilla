Scriptname City_Neon_Drug02_Script extends Quest

City_Neon_DrugGameScript Property City_Neon_Drug_Game Auto Const Mandatory

Location Property CityNeonLegrandesLiquorsLocation Auto Const Mandatory
Cell Property CityNeonLegrandesLiquors Auto Const Mandatory

Int Property iStageToMoveBayu Auto Const Mandatory
Int Property iStageDoneWithBayu Auto Const Mandatory

ReferenceAlias Property BenjaminBayu Auto Const Mandatory
ReferenceAlias Property BayuFurniture Auto Const Mandatory
ReferenceAlias Property LegrandesLoadDoor Auto Const Mandatory
ReferenceAlias Property Alias_IngredientHopper Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ActorValue Property Assistance Auto Const Mandatory

int property maxRefills = 3 auto Const
{ how many "refills" will player get on retries, per round }

Function ReplayGame()
; The minigame can't restart itself
    debug.trace(self + " ReplayGame")
    City_Neon_Drug_Game.Stop()
    City_Neon_Drug_Game.Reset()
    City_Neon_Drug_Game.Start()
EndFunction

Function AddItemsToHopper()
    ; Add the right items to the hopper
    ObjectReference hopperRef = Alias_IngredientHopper.GetRef()
    int i = 0
    while i < City_Neon_Drug_Game.HopperItems.Length
        City_Neon_DrugGameScript:HopperItem theHopperItem = City_Neon_Drug_Game.HopperItems[i]
        hopperRef.AddItem(theHopperItem.hopperIngredient, theHopperItem.countGiven)
        i += 1
    EndWhile
EndFunction

Event OnQuestInit()
	; Register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
; Handling for player being on Drug02 and CF06 at the same time.
; Whenever the player enters Legrande's on the designated step, move Bayu, lock the doors, and disable fast travel.
Debug.Trace(Self + " OnLocationChange Event Fired: " + aksender + " From: " + akOldLoc + " To: " + akNewLoc)

    If akSender == Game.GetPlayer()
    Debug.Trace(Self + " DRUG02: akSender is the player")
        If GetStageDone(iStageToMoveBayu) && !GetStageDone(iStageDoneWithBayu)
        Debug.Trace(Self + " DRUG02: Conditions passed to lock down Legrande's")
            If akNewLoc == CityNeonLegrandesLiquorsLocation
            Debug.Trace(Self + " DRUG02: OnLocationChange event fired. Player ENTERED Legrande's")

                Actor BayuRef = BenjaminBayu.GetActorRef()
                BayuRef.MoveTo(BayuFurniture.GetRef())
                BayuRef.SetValue(Assistance, 0)

                ObjectReference DoorRef = LegrandesLoadDoor.GetRef()
                DoorRef.SetFactionOwner(PlayerFaction)
                DoorRef.Lock(True)
                DoorRef.SetLockLevel(254) ; Inaccessible

                CityNeonLegrandesLiquors.EnableFastTravel(False)
            EndIf

            If akOldLoc == CityNeonLegrandesLiquorsLocation
            ; If player somehow leaves Legrande's release the player so they can re-enter the space. 
            ; If this happens, it's most likely due to being arrested for a crime.
            Debug.Trace(Self + " DRUG02: OnLocationChange event fired. Player LEFT Legrande's")
                ReleasePlayer()
            EndIf
        EndIf
    EndIf

EndEvent

Function ReleasePlayer()
; Player is done speaking to Bayu, so unlock doors and re-enable fast travel.
Debug.Trace(Self + " DRUG02: ReleasePlayer function called")
    ObjectReference DoorRef = LegrandesLoadDoor.GetRef()
    DoorRef.Lock(False)
    DoorRef.SetFactionOwner(None)
    CityNeonLegrandesLiquors.EnableFastTravel(True)
    BenjaminBayu.GetActorRef().SetValue(Assistance, 1)
EndFunction
