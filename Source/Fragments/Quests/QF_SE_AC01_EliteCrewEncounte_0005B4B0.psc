;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_AC01_EliteCrewEncounte_0005B4B0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Betty.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SE_AC01_000_BettyInitialComment.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
BettyECQuest.SetStage(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE defaultquestchangelocationscript
Quest __temp = self as Quest
defaultquestchangelocationscript kmyQuest = __temp as defaultquestchangelocationscript
;END AUTOCAST
;BEGIN CODE
;Hire Betty
SetObjectiveCompleted(20)
BettyECQuest.SetStage(40)

;Set crew to 0 and make it a derelict
SpaceshipReference BettyShipRef = BettyShip.GetShipRef()
BettyShipRef.SetValue(SpaceshipCrew, 0)
SQ_Parent.SetupDamagedShip(BettyShipRef, ShouldBeDerelict = true)

if !BettyECQuest.GetStageDone(50)
    Game.GetPlayer().RemoveItem(ShipRepairKit)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;player gave Betty a repair kit and she went to the Well.
;this scene exists separately in her Elite Crew quest
BettyECQuest.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;script on the player alias is setting this stage
;fires if Betty is going to be hired in the Well

BettyShip.GetShipRef().SetValue(DockingPermission, 4)
Betty.GetActorRef().MoveTo(NewAtlantisMarker.GetRef())
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Do not grav jump unless ship has undocked

if GetStageDone(50)
    BettyShip.GetShipRef().DisableWithGravJump()
    Alias_MapMarker.GetRef().DisableNoWait()
else
    SE_AC01_LuckyLuGoodbye.Start()
endif

SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Betty.GetRef().MoveTo(NewAtlantisMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_01
Function Fragment_Stage_2000_Item_01()
;BEGIN CODE
BettyShip.GetShipRef().DisableNoWait()
Alias_OrbitLocation.GetLocation().RemoveKeyword(LocTypeSENotAllowed)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BettyHailScene Auto Const

ActorValue Property DockingPermission Auto Const

ReferenceAlias Property BettyShip Auto Const

ReferenceAlias Property Betty Auto Const

ReferenceAlias Property NewAtlantisMarker Auto Const

ReferenceAlias Property BettyShipMarker Auto Const

Quest Property BettyECQuest Auto Const

Scene Property SE_AC01_000_BettyInitialComment Auto Const Mandatory

Scene Property SE_AC01_LuckyLuGoodbye Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

SQ_ParentScript Property SQ_Parent Auto Const Mandatory

LocationAlias Property Alias_OrbitLocation Auto Const Mandatory

Keyword Property LocTypeSENotAllowed Auto Const Mandatory

Potion Property ShipRepairKit Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory
