Scriptname SFBGS00D:SFFL_MS03_QuestScript extends Quest

RefCollectionAlias Property Captors Auto Const Mandatory
Faction Property PlayerEnemyFaction Auto Const Mandatory
ActorValue Property Aggression Auto Const Mandatory

Group MillHandling
    LocationAlias Property Location_PlayerShip Auto Const Mandatory
    LocationAlias Property Location_MuphridSurface Auto Const Mandatory
    LocationAlias Property Location_AtkasHouse Auto Const Mandatory
    LocationAlias Property Location_MaintenanceGarage Auto Const Mandatory
    ReferenceAlias Property MilliHouseWaitingMarker Auto Const Mandatory
    ReferenceAlias Property Milli Auto Const Mandatory
    Int Property iMillStartFollowStage = 1310 Auto Const Mandatory
    Int Property iMilliStopFollowStage = 3010 Auto Const Mandatory
EndGroup

Struct CaptorDatum
    ReferenceAlias CaptorAlias
    ReferenceAlias CaptorFurniture
EndStruct

Struct PlantDatum
    ReferenceAlias PlantHealthy
    ReferenceAlias PlantUnhealthy
    ReferenceAlias PlantDead
    Int iPlantWateredStage
EndStruct

CaptorDatum[] Property CaptorData Auto Const Mandatory
PlantDatum[] Property PlantData Auto Const Mandatory

Function SetCaptors()

        Int i = 0
        While i < CaptorData.Length
            Actor ChosenCaptor = CaptorData[i].CaptorAlias.GetActorRef()
            ChosenCaptor.MoveToFurniture(CaptorData[i].CaptorFurniture.GetRef())
            ChosenCaptor.EvaluatePackage()
            i += 1
        EndWhile

EndFunction

Function SetHostile()
    Int i = 0
    While i < Captors.GetCount()
        Actor ChosenCaptor = Captors.GetAt(i) as Actor
        ChosenCaptor.AddToFaction(PlayerEnemyFaction)
        ChosenCaptor.SetValue(Aggression, 2)
        i += 1
    EndWhile
EndFunction

Function CheckPlants()
    Int i = 0
    While i < PlantData.Length
        PlantData[i].PlantUnhealthy.GetRef().Disable()
        If GetStageDone(PlantData[i].iPlantWateredStage)
            PlantData[i].PlantHealthy.GetRef().Enable()
        Else
            PlantData[i].PlantDead.GetRef().Enable()
        EndIf
        i += 1
    EndWhile
EndFunction

Function TrackPlayer()
    RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    Debug.Trace(Self + "SFFL_MS03: OnLocationChanged. akOldLoc = " + akOldLoc + " akNewLoc = " + akNewLoc)
    Actor PlayerRef = Game.GetPlayer()
    Actor MilliRef = Milli.GetActorRef()
    If akSender == PlayerRef && GetStageDone(iMillStartFollowStage) && !GetStageDone(iMilliStopFollowStage)
        If akOldLoc == Location_PlayerShip.GetLocation() && (PlayerRef.IsInLocation(Location_MuphridSurface.GetLocation()) || PlayerRef.IsInLocation(Location_AtkasHouse.GetLocation()) || PlayerRef.IsInLocation(Location_MaintenanceGarage.GetLocation()))
            Debug.Trace(Self + "SFFL_MS03: OnLocationChanged: New location passed Muphrid.")
            MilliRef.MoveTo(PlayerRef)
            MilliRef.EvaluatePackage()
        EndIf
    EndIf
EndEvent

