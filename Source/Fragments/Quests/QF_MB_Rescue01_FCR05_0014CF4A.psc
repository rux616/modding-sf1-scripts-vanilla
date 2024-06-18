;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MB_Rescue01_FCR05_0014CF4A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

; Set stage 170 on FC02 if it's running and stage 160 was set
if FC02.IsRunning() && FC02.GetStageDone(160)
  FC02.SetStage(170)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_EnemyShipPilotSeat.GetRef().BlockActivation(True, False)

; turn off captive blocking hellos so captive can have greeting
Alias_prisoner.TryToSetValue(SQ_CaptiveStateNoBlockingHellos, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; failsafe - if no enemies, set stage 90
int enemies = Alias_Enemies.GetCount()
int enemiesDead = alias_enemies.GetCountDead()
if enemiesDead >= enemies
  setstage(90)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
; Give the player some additional credits
int nRand = Utility.RandomInt(0,20)
int nReward = 800 + nRand*50

Game.GetPlayer().AddItem(Credits, nReward)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MissionRescueQuestScript
Quest __temp = self as Quest
MissionRescueQuestScript kmyQuest = __temp as MissionRescueQuestScript
;END AUTOCAST
;BEGIN CODE
defaultcaptivealias CaptiveNPC = Alias_prisoner as defaultcaptivealias

; free the captive
CaptiveNPC.FreePrisoner()

; Set stage 180 on FC02 if it's running & stage 160 was set
if FC02.IsRunning() && FC02.GetStageDone(160)
  FC02.SetStage(180)
endif

kmyQuest.MissionComplete()
FCRQuestScript myFCRQuest = (kmyQuest as Quest) as FCRQuestScript
myFCRQuest.FCRMissionComplete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE MissionRescueQuestScript
Quest __temp = self as Quest
MissionRescueQuestScript kmyQuest = __temp as MissionRescueQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MissionComplete()
kmyQuest.MissionShutdown()
Alias_EnemyShipPilotSeat.GetRef().BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Credits Auto Const Mandatory

Quest Property FC02 Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShipPilotSeat Auto Const Mandatory

ReferenceAlias Property Alias_prisoner Auto Const Mandatory

ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const Mandatory

RefCollectionAlias Property Alias_enemies Auto Const Mandatory
