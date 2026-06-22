Scriptname MQ102PlayerShipScript extends ReferenceAlias

ReferenceAlias Property MoaraShip Mandatory Const Auto
Int Property DockStageToSet Mandatory Const Auto
ReferenceAlias Property NovaGalacticStaryard Mandatory Const Auto
Int Property NovaDockStageToSet Mandatory Const Auto
Int Property PreReqStage = 200 Const Auto

Event OnShipDock(bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
    Quest MyQuest = GetOwningQuest()

    If akParent == MoaraShip.GetShipReference() && abComplete
        MyQuest.SetStage(DockStageToSet)
    EndIf

    If (akParent == NovaGalacticStaryard.GetShipReference()) && (abComplete) && (MyQuest.GetStageDone(PreReqStage))
        MyQuest.SetStage(NovaDockStageToSet)
    EndIf

EndEvent