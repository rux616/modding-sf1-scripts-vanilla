;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestE3VideoQuest_00019467 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Frontier_ModularREF.Disable()
Utility.Wait(0.25)
Frontier_ModularREF.moveto(MQ101KreetShipLandingMarkerREF005)
Frontier_ModularREF.setlinkedref(MQ101KreetShipLandingMarkerREF005, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
MQ101KreetShipLandingMarkerREF005.addKeyword(AnimLandingKreet)
Utility.Wait(0.1)

Frontier_ModularREF.moveto(MQ101KreetShipLandingMarkerREF005)
Frontier_ModularREF.setlinkedref(MQ101KreetShipLandingMarkerREF005, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)
TestE3VideoGlobal.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(670)
Utility.Wait(0.1)
MQ101.SetStage(690)
Game.GetPlayer().moveto(TestKreetRoof)
LC003_RoofMarker001.Enable()
KreetLandingMarker02.addkeyword(AnimLandingKreetPirates)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
KreetPirateShip02.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_VigilanceActor01.GetRef().EnableNoWait()
Alias_VigilanceActor02.GetRef().EnableNoWait()
Alias_VigilanceActor03.GetRef().EnableNoWait()
Alias_VigilanceActor04.GetRef().EnableNoWait()
Alias_VigilanceActor05.GetRef().EnableNoWait()
Alias_VigilancePatrolMarker01.GetRef().EnableNoWait()
Alias_VigilancePatrolMarker02.GetRef().EnableNoWait()
Actor VigRef = Alias_VigilanceActor07.GetActorRef()
VigRef.MoveTo(Alias_VigilanceActor07Marker.GetRef())
VigRef.Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Story14Actor.GetRef().Enable()
E3Story14.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
E3Ending11.Stop()

ObjectReference LandingMarkerREF

If Alias_Ending11LandingPad.GetRef() == None
  LandingMarkerREF = Game.GetPlayer().PlaceAtMe(ShipLandingMarker_80m_Large)
  LandingMarkerREF.addkeyword(AnimTakeOffE3)
  Alias_Ending11LandingPad.ForceRefTo(LandingMarkerREF)
Else
  LandingMarkerREF = Alias_Ending11LandingPad.GetRef()
EndIf

TestE3TakeoffGlobal.SetValueInt(1)

Utility.Wait(1.0)

SpaceshipReference FrontierShipREF = LandingMarkerREF.PlaceShipAtMe(Constellation_Frontier)
Alias_Frontier.ForceRefTo(FrontierShipREF)

Utility.Wait(1.0)

E3Ending11.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
ObjectReference LandingMarkerREF

LandingMarkerREF = Game.GetPlayer().PlaceAtMe(ShipLandingMarker_80m_Large)
LandingMarkerREF.addkeyword(AnimTakeOffE3)
Alias_Ending11LandingPad.ForceRefTo(LandingMarkerREF)

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_Frontier.GetRef().Disable()
Alias_Frontier.GetRef().Delete()
Alias_Frontier.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SpaceshipReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property MQ101KreetShipLandingMarkerREF005 Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

GlobalVariable Property TestE3VideoGlobal Auto Const Mandatory

ObjectReference Property NewGameShipMarkerREF Auto Const Mandatory

Keyword Property AnimLandingKreet Auto Const Mandatory

ObjectReference Property TestKreetRoof Auto Const Mandatory

ObjectReference Property LC003_RoofMarker001 Auto Const Mandatory

ObjectReference Property KreetPirateShip02 Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Faction Property LC003PirateBossFaction Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

ObjectReference Property KreetLandingMarker02 Auto Const Mandatory

Keyword Property AnimLandingKreetPirates Auto Const Mandatory

ReferenceAlias Property Alias_VigilanceActor01 Auto Const Mandatory

ReferenceAlias Property Alias_VigilanceActor02 Auto Const Mandatory

ReferenceAlias Property Alias_VigilanceActor03 Auto Const Mandatory

ReferenceAlias Property Alias_VigilanceActor04 Auto Const Mandatory

ReferenceAlias Property Alias_VigilanceActor05 Auto Const Mandatory

ReferenceAlias Property Alias_VigilancePatrolMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_VigilancePatrolMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_Story14Actor Auto Const Mandatory

Scene Property E3Story14 Auto Const Mandatory

Scene Property TestE3Story14 Auto Const Mandatory

Furniture Property ShipLandingMarker_80m_Large Auto Const Mandatory

Keyword Property AnimTakeOffE3 Auto Const Mandatory

GlobalVariable Property TestE3TakeoffGlobal Auto Const Mandatory

Scene Property E3Ending11 Auto Const Mandatory

ReferenceAlias Property Alias_Ending11LandingPad Auto Const Mandatory

ReferenceAlias Property Alias_VigilanceActor07 Auto Const Mandatory

ReferenceAlias Property Alias_VigilanceActor07Marker Auto Const Mandatory

ReferenceAlias Property Alias_LandingPad Auto Const Mandatory

ReferenceAlias Property Alias_Frontier Auto Const Mandatory

Form Property Constellation_Frontier Auto Const
