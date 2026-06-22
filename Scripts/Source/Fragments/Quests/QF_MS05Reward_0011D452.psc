;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS05Reward_0011D452 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;If MS05ShipDesign is a positive value, give the player the Sensible ship
;If it's a negative value, give the player the Ridiculous ship 
If MS05ShipDesign.GetValue() >= 0
	SetStage(100)
Else
	SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SpaceshipReference myShip = Alias_SensibleShip.GetShipRef()
myShip.SetValue(SpaceshipCrew, 0)
myShip.SetValue(SpaceshipRegistration, 1)
myShip.Enable()

; TEMP until we get the event: GEN-527399
SQ_PlayerShipScript SQ_PlayerShip = Game.GetForm(0x000174a2) as SQ_PlayerShipScript
SQ_PlayerShip.AddPlayerOwnedShip(myShip)
; once bug is fixed, can return to using:
;Game.AddPlayerOwnedShip(myShip)

SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SpaceshipReference myShip = Alias_RidiculousShip.GetShipRef()
myShip.SetValue(SpaceshipCrew, 0)
myShip.SetValue(SpaceshipRegistration, 1)
myShip.Enable()

; TEMP until we get the event: GEN-527399
SQ_PlayerShipScript SQ_PlayerShip = Game.GetForm(0x000174a2) as SQ_PlayerShipScript
SQ_PlayerShip.AddPlayerOwnedShip(myShip)
; once bug is fixed, can return to using:
;Game.AddPlayerOwnedShip(myShip)

SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;pop tutorial about home ships
MQ_TutorialQuest.SetStage(300)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1001_Item_00
Function Fragment_Stage_1001_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MS05ShipDesign Auto Const Mandatory

ReferenceAlias Property Alias_SensibleShip Auto Const Mandatory

ReferenceAlias Property Alias_RidiculousShip Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

Quest Property MQ_TutorialQuest Auto Const Mandatory

ActorValue Property SpaceshipRegistration Auto Const Mandatory
