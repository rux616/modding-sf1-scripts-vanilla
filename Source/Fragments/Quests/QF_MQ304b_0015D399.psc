;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ304b_0015D399 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

Alias_KeeperAquilus.GetActorRef().SetEssential(false)

;make sure player can board the scorpius
Game.GetPlayer().addtoFaction(MQScorpiusBoardingFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
Actor AquilusREF = Alias_KeeperAquilus.GetActorRef()

AquilusREF.SendAssaultAlarm()
AquilusREF.AddtoFaction(PlayerEnemyFaction)
AquilusREF.SetValue(Aggression, 1)
AquilusREF.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetStage(40)

MQ304_002c_CompanionReaction_AquilusDead.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetStage(40)

MQ304_002c_CompanionReaction_AquilusLives.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0037_Item_00
Function Fragment_Stage_0037_Item_00()
;BEGIN CODE
Alias_KeeperAquilus.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;make sure Hunter is available
SpaceshipReference ScorpiusREF = Alias_HunterShip.GetShipRef()

ScorpiusREF.MoveTo(HelixOborumMarker)
ScorpiusREF.Enable()

;move the Hunter onboard
Alias_Hunter.GetActorRef().moveto(MQ207_HunterMarker01)

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If GetStageDone(42)
  SetStage(1100)
ElseIf GetStageDone(44)
  SetStage(1200)
Else
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_KeeperAquilus Auto Const Mandatory

Scene Property MQ304_002c_CompanionReaction_AquilusDead Auto Const Mandatory

Scene Property MQ304_002c_CompanionReaction_AquilusLives Auto Const Mandatory

ReferenceAlias Property Alias_Hunter Auto Const Mandatory

ReferenceAlias Property Alias_HunterShip Auto Const Mandatory

ObjectReference Property HelixOborumMarker Auto Const Mandatory

ObjectReference Property MQ207_HunterMarker01 Auto Const Mandatory

Faction Property MQScorpiusBoardingFaction Auto Const Mandatory

Quest Property City_NA_Aquilus01 Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory
