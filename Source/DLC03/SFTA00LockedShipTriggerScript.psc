Scriptname DLC03:SFTA00LockedShipTriggerScript extends ReferenceAlias

ReferenceAlias Property Roach Mandatory Const Auto
Scene Property SFTA00_1300_Roach_ShipLocked Mandatory Const Auto
Int Property EncounterShipStage = 1200 Const Auto
Int Property UnlockedShipStage = 1425 Const Auto

;If the player or Roach triggers the volume, then set a stage.
;This event can play the scene multiple times. Each line is flagged to play only once, 
;and the player could trigger this more than once, with new dialogue player depending on what other stages are set.
Event OnTriggerEnter(ObjectReference akActionRef)
    Actor myPlayer = Game.GetPlayer()
    Actor myRoach = Roach.GetActorRef()
    If (akActionRef == myPlayer || akActionRef == myRoach)
        GetOwningQuest().SetStage(EncounterShipStage)
        If !myRoach.IsInScene()
            SFTA00_1300_Roach_ShipLocked.Start()
        EndIf
    EndIf
EndEvent