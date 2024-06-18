Scriptname COM_Quest_Andreja_Q01_PlayerScript extends ReferenceAlias

ReferenceAlias Property PlayerShip Auto Const Mandatory
Int PlayerInShipStage = 210
Int ReadyForShipStage = 175


Event OnEnterShipInterior(ObjectReference akShip)
    Quest myCOM_Andreja_Quest = GetOwningQuest()
    SpaceshipReference PlayerShipREF = PlayerShip.GetShipReference()
    If akShip == PlayerShipREF
        If myCOM_Andreja_Quest.GetStageDone(ReadyForShipStage)
            myCOM_Andreja_Quest.SetStage(PlayerInShipStage)
        EndIf  
    EndIf
EndEvent