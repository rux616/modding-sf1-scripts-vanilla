Scriptname SFBGS003MiscPointerQuestScript extends Quest

GlobalVariable Property SFBGS003_MiscPointer_MoveValue Mandatory Const Auto
Float Property PlayerGameTimeHoursLength = 5.0 Const Auto
Int Property InevitableSpokenToStage = 200 Const Auto
Int Property LeaveCurrentLocationStage = 300 Const Auto
Int Property PlayerTookTimeStage = 999 Const Auto
LocationAlias Property Akila Mandatory Const Auto

Location[] Property InevitableLocs Mandatory Const Auto
ReferenceAlias[] Property AllMarkerAliases Mandatory Const Auto

SQ_PlayerShipScript property SQ_PlayerShip auto const mandatory
ReferenceAlias Property Inevitable Mandatory Const Auto
ReferenceAlias Property InevitableCurrentMarker Mandatory Const Auto
ReferenceAlias Property InevitableFurnitureStand Mandatory Const Auto
ReferenceAlias Property InevitableTAHQIntMarker Mandatory Const Auto
ReferenceAlias Property Player Mandatory Const Auto
RefCollectionAlias Property AllMarkers Mandatory Const Auto

;Fill the AllMarkers RefCollection so we can use it when refilling the InevitableCurrentMarker Alias more quickly.
Function FillAllMarkers()
    Int i
    Int iCount = AllMarkerAliases.Length
    While i < iCount
        AllMarkers.AddRef(AllMarkerAliases[i].GetRef())
        i += 1
    EndWhile
EndFunction


;Moves Inevitable's Furniture to the nearest valid marker for her, and increments a value to track how many times she has moved so she can 
;say some dialogue about it.
Function MoveInevitable()
    InevitableCurrentMarker.RefillAlias()
    If InevitableCurrentMarker != None
        ObjectReference myNewMarker = InevitableCurrentMarker.GetRef()
        ObjectReference myFurniture = InevitableFurnitureStand.GetRef()
        Actor myInevitable = Inevitable.GetActorRef()
        myFurniture.MoveTo(myNewMarker)
        myInevitable.MoveToFurniture(myFurniture)
        SFBGS003_MiscPointer_MoveValue.Mod(1)
    EndIf
EndFunction

Function MoveChecks(ObjectReference akSender, Location akNewLoc)
    If !GetStageDone(LeaveCurrentLocationStage)
        ;Watch for the player changing locations. If they're in a location where Inevitable can show up, run the function to move her.
        If !GetStageDone(InevitableSpokenToStage)    
            ObjectReference myOldMarker = InevitableCurrentMarker.GetRef()
            If !myOldMarker.GetCurrentLocation().IsSameLocation(akSender.GetCurrentLocation())
                If InevitableLocs.Find(akNewLoc) >= 0
                    MoveInevitable()
                EndIf
            EndIf
        Else
            ;Move Inevitable after the player speaks with her and leaves their current location, if they are not currently in Akila City.
            Location myCurrentLoc = Game.GetPlayer().GetCurrentLocation()
            If myCurrentLoc != Akila.GetLocation()
                SetStage(LeaveCurrentLocationStage)
                Inevitable.GetActorRef().MoveTo(InevitableTAHQIntMarker.GetRef())
            EndIf
        EndIf
   EndIf
EndFunction


;After the player speaks with Inevitable, start a timer. If the player exceeds the timer, they'll get some different dialogue when speaking to Agent No. 1
Function TrackTime()
    StartTimerGameTime(PlayerGameTimeHoursLength)
EndFunction


Event OnQuestInit()
    RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
    RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip, "OnLocationChange")
    FillAllMarkers()
    InevitableFurnitureStand.GetRef().SetActorRefOwner(Inevitable.GetActorRef(), True)
EndEvent


Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    If akSender == Game.GetPlayer()
        MoveChecks(akSender as ObjectReference, akNewLoc)
    EndIf
EndEvent    


;Watch for the player's ship changing locations. If it's in a location where Inevitable can show up, run the function to move her.
Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
    ObjectReference myShip = akSender.GetRef()
    If myShip == SQ_PlayerShip.PlayerShip.GetRef()
        MoveChecks(myShip, akNewLoc)
    EndIf
EndEvent


Event OnTimerGameTime(int aiTimerID)
    SetStage(PlayerTookTimeStage)
EndEvent