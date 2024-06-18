Scriptname MS05RewardScript extends Quest

SQ_PlayerShipScript Property SQ_PlayerShip Mandatory Const Auto
ReferenceAlias Property RidiculousShip Mandatory Const Auto
ReferenceAlias Property SensibleShip Mandatory Const Auto
Int Property SellShipStage = 1001 Const Auto



Event OnQuestInit()
    RegisterForCustomEvent(SQ_PlayerShip, "SQ_PlayerSellShip")
EndEvent

;If the player sells the ship before claiming it by sitting int he pilot's seat, we complete the quest.
;To do this, we set Stage 1001, which does the same thing as Stage 1000, but excludes the tutorial message pop-up. 
Event SQ_PlayerShipScript.SQ_PlayerSellShip(SQ_PlayerShipScript akSender, Var[] akArgs)
	SpaceshipReference PlayerShipToSell = akArgs[0] as SpaceshipReference
    debug.trace(self + " PlayerShipToSell=" + PlayerShipToSell)

    If PlayerShipToSell == RidiculousShip.GetShipRef() || PlayerShipToSell == SensibleShip.GetShipRef()
        SetStage(SellShipStage)
    EndIf
EndEvent
