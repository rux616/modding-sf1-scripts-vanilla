Scriptname CF06QuestScript extends Quest

Function StartGetOffPlanetTimer()
    StartTimerGameTime(2)
Endfunction

Event OnTimerGameTime(int aiTimerID)
    SetStage(450)
EndEvent

Function CallNeonCrime()
    CrimeFactionNeon.ModCrimeGold(10000)
EndFunction


Event OnQuestInit()
	; Register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
; Handling for player being on Drug02 and CF06 at the same time.
; Whenever the player enters the Astral Lounge on the designated step, move Bayu, lock the doors, and disable fast travel.
Debug.Trace(Self + " OnLocationChange Event Fired: " + aksender + " From: " + akOldLoc + " To: " + akNewLoc)

    If akSender == Game.GetPlayer()
    Debug.Trace(Self + " CF06: akSender is the player")
        If GetStageDone(iStageToMoveBayu) && !GetStageDone(iStageDoneWithBayu)
        Debug.Trace(Self + " CF06: Conditions passed")
            If akNewLoc == CityNeonTradeTowerAstralLoungeLocation
            Debug.Trace(Self + " CF06: OnLocationChange event fired. Player ENTERED Astral Lounge")
            
                Actor BayuRef = CF06_BenjaminBayu.GetActorRef()
                BayuRef.MoveTo(CF06_AstralLoungeBayuMarker.GetRef())
                BayuRef.SetValue(Assistance, 0)
                BayuRef.SetValue(Confidence, 0)

                ObjectReference DoorRef = CF06_AstralLoungeLoadDoor.GetRef()
                DoorRef.SetFactionOwner(PlayerFaction)
                DoorRef.Lock(True)
                Debug.Trace(Self + "Is Door Locked: " + DoorRef.IsLocked())
                DoorRef.SetLockLevel(254) ; Inaccessible

                CityNeonTradeTowerAstralLounge.EnableFastTravel(False)
            EndIf
            If akOldLoc == CityNeonTradeTowerAstralLoungeLocation
            ; If player somehow leaves the Astral Lounge release them so they can re-enter the space. 
            ; If this happens, it's most likely due to being arrested for a crime.            
            Debug.Trace(Self + " CF06: OnLocationChange event fired. Player LEFT Astral Lounge")
                ReleasePlayer()
            EndIf
        EndIf
    EndIf
EndEvent

Function ReleasePlayer()
; Player is done speaking to Bayu, so unlock doors and re-enable fast travel.
Debug.Trace(Self + " CF06: ReleasePlayer function called")
    ObjectReference DoorRef = CF06_AstralLoungeLoadDoor.GetRef()
    DoorRef.Lock(False)
    DoorRef.SetFactionOwner(None)
    CityNeonTradeTowerAstralLounge.EnableFastTravel(True)
    CF06_BenjaminBayu.GetActorRef().SetValue(Assistance, 1)
    CF06_BenjaminBayu.GetActorRef().SetValue(Confidence, 2)
EndFunction


Faction Property CrimeFactionNeon Auto Const Mandatory
Faction Property PlayerFaction Auto Const Mandatory

Location Property CityNeonTradeTowerAstralLoungeLocation Auto Const Mandatory

Cell Property CityNeonTradeTowerAstralLounge Auto Const Mandatory

Int Property iStageToMoveBayu Auto Const Mandatory
Int Property iStageDoneWithBayu Auto Const Mandatory

ReferenceAlias Property CF06_BenjaminBayu Auto Const Mandatory
ReferenceAlias Property CF06_AstralLoungeBayuMarker Auto Const Mandatory
ReferenceAlias Property CF06_AstralLoungeLoadDoor Auto Const Mandatory

ActorValue Property Assistance Auto Const Mandatory
ActorValue Property Confidence Auto Const Mandatory