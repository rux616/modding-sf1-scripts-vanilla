;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ302a_00255DAB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)

Game.GetPlayer().moveto(MQ302Start)
MQ301.SetStage(400)
SetStage(10)

MQ207B.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;move ships and Actors
SpaceshipReference HunterShipREF= Alias_HunterShip.GetShipReference()
SpaceshipReference EmissaryShipREF = Alias_EmissaryShip.GetShipReference()
Actor HunterREF = Alias_Hunter.GetActorRef()
Actor EmissaryREF = Alias_Emissary.GetActorRef()

HunterShipREF.moveto(MQ302_HunterShipLanding)
EmissaryShipREF.moveto(MQ302_EmissaryShipLanding)

HunterShipREF.Enable()
EmissaryShipREF.Enable()

HunterREF.Disable()
HunterREF.EvaluatePackage()
HunterREF.moveto(MQ301EmissaryHunterMoveToMarker)
HunterREF.Enable()
EmissaryREF.Disable()
EmissaryREF.EvaluatePackage()
EmissaryREF.moveto(MQ301EmissaryHunterMoveToMarker)
EmissaryREF.Enable()

;start optional Aquilus quest
MQ304b.Start()

;add crime faction
HunterREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction)
EmissaryREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;move ships
SpaceshipReference HunterShipREF= Alias_HunterShip.GetShipReference()
SpaceshipReference EmissaryShipREF = Alias_EmissaryShip.GetShipReference()

HunterShipREF.Enable()
EmissaryShipREF.Enable()

SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
MQ302_001_EmissaryHunter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MQ302_SidedWithChoice.SetValueInt(0)
MQ301.SetStage(500)

;make sure the player can board the Helix
SpaceshipReference EmissaryShipREF = Alias_EmissaryShip.GetShipReference()
EmissaryShipREF.SetValue(DockingPermission, 1)
Game.GetPlayer().addtoFaction(MQ_EmissaryAllyFaction)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
;optional Aquilus quest advances
MQ304b.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
MQ302_SidedWithChoice.SetValueInt(1)
MQ301.SetStage(500)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Game.StopDialogueCamera()
MQ302_001_EmissaryHunter.Stop()

Actor HunterREF = Alias_Hunter.GetActorRef()
Actor EmissaryREF = Alias_Emissary.GetActorRef()
HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion)
EmissaryREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion)

HunterREF.moveto(MQ207_HunterMarker01)
EmissaryREF.moveto(MQ303EmissaryMarker01)

MQ302_SidedWithChoice.SetValueInt(2)
MQ301.SetStage(500)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SpaceshipReference HunterShipREF= Alias_HunterShip.GetShipReference()
SpaceshipReference EmissaryShipREF = Alias_EmissaryShip.GetShipReference()
Actor HunterREF = Alias_Hunter.GetActorRef()
Actor EmissaryREF = Alias_Emissary.GetActorRef()

HunterShipREF.EvaluatePackage()
EmissaryShipREF.EvaluatePackage()

;shut down the Aquilus quest if the player didn't side with the Hunter
If GetStageDone(110) == 0
  MQ304B.Stop()
EndIf

;remove crime factions
HunterREF.SetCrimeFaction(MQHunterCrimeFaction)
EmissaryREF.SetCrimeFaction(None)

HunterREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction)
EmissaryREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN CODE
SpaceshipReference HelixREF = Alias_EmissaryShip.GetShipRef()
SpaceshipReference ScorpiusREF = Alias_HunterShip.GetShipRef()

ScorpiusREF.DisableNoWait()

HelixREF.MoveTo(HelixOborumMarker)
HelixREF.Enable()

;move the Hunter and Emissary onboard
Alias_Emissary.GetActorRef().moveto(MQ207_EmissaryMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_02
Function Fragment_Stage_1000_Item_02()
;BEGIN CODE
SpaceshipReference ScorpiusREF = Alias_HunterShip.GetShipRef()
SpaceshipReference HelixREF = Alias_EmissaryShip.GetShipRef()

HelixREF.DisableNoWait()

ScorpiusREF.MoveTo(ScorpiusOborumMarker)
ScorpiusREF.Enable()

;move the Hunter onboard
Alias_Hunter.GetActorRef().moveto(MQ207_HunterMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_03
Function Fragment_Stage_1000_Item_03()
;BEGIN CODE
SpaceshipReference ScorpiusREF = Alias_HunterShip.GetShipRef()
SpaceshipReference HelixREF = Alias_EmissaryShip.GetShipRef()

ScorpiusREF.DisableNoWait()
HelixREF.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_EmissaryShip Auto Const Mandatory

ReferenceAlias Property Alias_HunterShip Auto Const Mandatory

Faction Property MQ_HunterFaction Auto Const Mandatory

Faction Property MQ_EmissaryFaction Auto Const Mandatory

GlobalVariable Property MQ_SidedWithEmissary Auto Const Mandatory

GlobalVariable Property MQ_SidedWithHunter Auto Const Mandatory

Quest Property MQ303 Auto Const Mandatory

Quest Property MQ304 Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

Faction Property MQ_HunterAllyFaction Auto Const Mandatory

Faction Property MQ_EmissaryAllyFaction Auto Const Mandatory

ObjectReference Property MQ302ScorpiusMoveMarker Auto Const Mandatory

ObjectReference Property MQ302HelixMoveMarker Auto Const Mandatory

ObjectReference Property MQ302_EmissaryShipLanding Auto Const Mandatory

ObjectReference Property MQ302_HunterShipLanding Auto Const Mandatory

ReferenceAlias Property Alias_Emissary Auto Const Mandatory

ReferenceAlias Property Alias_Hunter Auto Const Mandatory

ObjectReference Property MQ302Start Auto Const Mandatory

Quest Property MQ302b Auto Const Mandatory

Quest Property MQ304b Auto Const Mandatory

Quest Property MQ301 Auto Const Mandatory

Location Property LC165BuriedTempleSpaceLocation Auto Const Mandatory

Location Property LC165BuriedTempleLocation Auto Const Mandatory

GlobalVariable Property MQ302_SidedWithChoice Auto Const Mandatory

ObjectReference Property ScorpiusOborumMarker Auto Const Mandatory

ObjectReference Property MQ207_EmissaryMarker01 Auto Const Mandatory

ObjectReference Property HelixOborumMarker Auto Const Mandatory

ObjectReference Property MQ207_HunterMarker01 Auto Const Mandatory

Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const Mandatory

ObjectReference Property MQ303EmissaryMarker01 Auto Const Mandatory

Scene Property MQ302_001_EmissaryHunter Auto Const Mandatory

ObjectReference Property MQ301EmissaryHunterMoveToMarker Auto Const Mandatory

Quest Property MQ207B Auto Const Mandatory

Faction Property MQEmissaryHunterCrimeFaction Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

Faction Property MQHunterCrimeFaction Auto Const Mandatory
