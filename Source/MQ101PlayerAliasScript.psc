Scriptname MQ101PlayerAliasScript extends ReferenceAlias

ReferenceAlias Property BarrettShip Auto
ReferenceAlias Property BarrettShipPilotChair Auto
ReferenceAlias Property Vasco Auto
MiscObject Property MineralType Auto
Location Property SystemNarionPlanetAnselonMoonNexumSurface Auto
Int MineralCount = 5
Keyword Property ArmorTypeHelmet Auto
ReferenceAlias Property VascoStartMarker Auto
ReferenceAlias Property MedBench Auto
Location Property NewAtlantisLocation Auto
Weapon Property Cutter Auto
ActorValue Property Health Mandatory Const Auto
Int Property PlayerLowHealthStage=240 Const Auto
ReferenceAlias Property PlayerShip Const Auto

Event OnAliasInit()
	AddInventoryEventFilter(MineralType)
	AddInventoryEventFilter(Cutter)
EndEvent

Function PirateCombatStarts()
    ;we want to know if the Player is ever at low health
    Actor PlayerREF = Game.GetPlayer()
    Float iLowHealth = PlayerREF.GetValue(Health) / 2
    RegisterForActorValueLessThanEvent(PlayerREF, Health, iLowHealth)
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    Actor PlayerREF = Game.GetPlayer()

	;don't trigger this in menus or when piloting a ship
	If Utility.IsGameMenuPaused() || (PlayerREF.GetSpaceship() != None)
		;do nothing
	Else
    	GetOwningQuest().SetStage(PlayerLowHealthStage)
	EndIf
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
	Quest myQuest = GetOwningQuest()
	;advance MQ101 if the player picks up enough minerals
	Actor PlayerREF = Game.GetPlayer()
	If (akBaseItem == MineralType) && (PlayerRef.GetItemCount(MineralType) >= MineralCount)
		myQuest.SetStage(25)
		RemoveInventoryEventFilter(MineralType)
	EndIf

	If (akBaseItem == Cutter)
		myQuest.SetStage(20)
	EndIf
EndEvent

Event OnEnterShipInterior(ObjectReference akShip)
	Quest MyQuest = GetOwningQuest()
	if akShip == BarrettShip.GetRef()
		If MyQuest.GetStageDone(320) == 0 && MyQuest.GetStage() < 500
			MyQuest.SetStage(320)
		EndIf
	EndIf

	If akShip == PlayerShip.GetRef()
		If MyQuest.GetStageDone(900) == 1 && MyQuest.GetStageDone(1000) == 0
			MyQuest.SetStage(1000)
		EndIf
	EndIf

EndEvent

Event OnExitShipInterior(ObjectReference akShip)
	Quest MyQuest = GetOwningQuest()
	;trigger music when the player exits out into New Atlantis for the first time
	If Self.GetRef().IsInLocation(NewAtlantisLocation)
		MyQuest.SetStage(1320)
	EndIf

	If myQuest.GetStageDone(900) == 1
		myQuest.SetStage(1000)
	EndIf
endEvent

Event OnSit(ObjectReference akFurniture)
	debug.trace(self + "OnSit akFurniture=" + akFurniture)
	Quest myQuest = GetOwningQuest()
	If akFurniture == BarrettShipPilotChair.GetRef()
		If myQuest.GetStageDone(340) == 0 && MyQuest.GetStage() < 500
			myQuest.SetStage(340)
		EndIf
	EndIf

	If akFurniture == MedBench.GetRef()
		MyQuest.SetStage(100)
	EndIf
EndEvent

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
	If akBaseObject.HasKeyword(ArmorTypeHelmet)
		Quest myQuest = GetOwningQuest()
		If myQuest.GetStageDone(155)
			If myQuest.GetStageDone(165)			
				myQuest.SetStage(168)
			Else
				myQuest.SetStage(169)
			EndIf
		EndIf
	EndIf
EndEvent