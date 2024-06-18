;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_PredatorsVsGuard_Script Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Ambush_EasySpawn.DisableAll()
Alias_Ambush_RegularSpawn.DisableAll()
Alias_Ambush_Bonus.DisableAll()
Alias_Ambush_HardSpawn.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetStage(60) ; Setup NPC
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
ObjectReference Marker = Alias_WoundedMarker.GetRef()
Actor NPC = Alias_NPC.GetActorRef()

NPC.SetValue(SQ_WoundedState, SQ_WoundedState_1_Wounded.GetValue())
NPC.MoveTo(Marker)
NPC.EvaluatePackage()
NPC.SetValue(SQ_CaptiveStateNoBlockingHellos, 1)
NPC.SetProtected(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_NPC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_NPC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
Alias_NPC.GetActorRef().SetProtected(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0185_Item_00
Function Fragment_Stage_0185_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(MedPack, 1)
SetStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
Alias_NPC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor aNPC = Alias_NPC.GetActorRef()

SetStage(210)
aNPC.EvaluatePackage()
aNPC.SetProtected(True)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;SQ_Followers.SetRoleActive(Alias_NPC.GetActorRef())
(Alias_NPC as DefaultCaptiveWoundedAlias).HealActor()
Alias_NPC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
int EncounterPoints = 3

If GetStageDone(160) ; Player refused to help the NPC
   If !GetStageDone(200)
      EncounterPoints += 3
   Else
      EncounterPoints += 1
   EndIf 
Else 
   EncounterPoints -= 1
EndIf 

If GetStageDone(170) ; Player intimidated the NPC
   EncounterPoints += 2
Else 
   EncounterPoints -= 1
EndIf 

If Game.GetPlayer().GetLevel() > 100
   EncounterPoints += 6
ElseIf Game.GetPlayer().GetLevel() > 75
   EncounterPoints += 3
ElseIf Game.GetPlayer().GetLevel() > 50
   EncounterPoints += 2
ElseIf Game.GetPlayer().GetLevel() > 25
   EncounterPoints += 1
Else
   EncounterPoints -= 1
EndIf 

If EncounterPoints > Utility.RandomInt(5,10)
   SetStage(270)
ElseIf EncounterPoints > Utility.RandomInt(1,10)
   SetStage(265)
Else
   SetStage(260)
EndIf 

If EncounterPoints > 5
   SetStage(275)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
Alias_Ambush_EasySpawn.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0265_Item_00
Function Fragment_Stage_0265_Item_00()
;BEGIN CODE
Alias_Ambush_RegularSpawn.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
Alias_Ambush_HardSpawn.GetRef().Enable()
; also spawn Easy
setstage(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
Alias_Ambush_Bonus.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_NPC.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(100)
SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Actor aNPC = Alias_NPC.GetActorRef()
;SQ_Followers.SetRoleInactive(aNPC)
aNPC.EvaluatePackage()
aNPC.SetProtected(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_NPC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
Alias_NPC.GetActorRef().EvaluatePackage()
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN CODE
SetStage(505)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
;kmyQuest.LaunchShip(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
If !GetStageDone(600)
   kmyquest.LaunchShip(0)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetStage(995)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
If !GetStageDone(600)
   SetStage(810)
Else
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
setstage(820)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
If GetStageDone(300) 
   SetStage(990) 
Else
   SetStage(995)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
bool NPCisAlive = !GetStageDone(600)
bool PlayerNeedsReward = !GetStageDone(800)

If PlayerNeedsReward && NPCisAlive
   SetStage(800)
EndIf

SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0995_Item_00
Function Fragment_Stage_0995_Item_00()
;BEGIN CODE
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
SQ_Followers.SetRoleInActive(Alias_NPC.GetActorRef())

CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE OE_AustinF_PvG_Script
Quest __temp = self as Quest
OE_AustinF_PvG_Script kmyQuest = __temp as OE_AustinF_PvG_Script
;END AUTOCAST
;BEGIN CODE
;/
SpaceshipReference Ship = Alias_Ship.GetShipRef()
ObjectReference Cockpit = NONE
ObjectReference oDoor = Alias_Ship_Door.GetRef()
Actor NPC = Alias_NPC.GetActorRef()

If kmyquest.PVGBE.ModuleCockpit.GetRef() 
   Cockpit = kmyquest.PVGBE.ModuleCockpit.GetRef()
   NPC.SetLinkedRef(Cockpit)
Else
   NPC.SetLinkedRef(Cockpit)
EndIf 

kmyquest.PVGBE.EmbarkActor(NPC)
kmyquest.PVGBE.TakeOffWhenable()
Alias_Ship.RefillDependentAliases()
/;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

; Ship Setup
ReferenceAlias Property Alias_Ship Auto Const Mandatory
ReferenceAlias Property Alias_Ship_Door Auto Const Mandatory

; Quest Support
MiscObject Property Credits Auto Const
Potion Property Aid_MedPack Auto Const Mandatory
Potion Property MedPack Auto Const Mandatory

; Actors
ReferenceAlias Property Alias_NPC Auto Const Mandatory

; Predators
ReferenceAlias Property Alias_Ambush_HardSpawn Auto Const Mandatory
RefCollectionAlias Property Alias_Ambush_RegularSpawn Auto Const Mandatory
RefCollectionAlias Property Alias_Ambush_EasySpawn Auto Const Mandatory
RefCollectionAlias Property Alias_Ambush_Bonus Auto Const Mandatory

; Follower Support
SQ_FollowersScript Property SQ_Followers Auto Const Mandatory
GlobalVariable Property SQ_WoundedState_0_Unset Auto Const Mandatory
GlobalVariable Property SQ_WoundedState_1_Wounded Auto Const Mandatory
GlobalVariable Property SQ_WoundedState_2_Healed Auto Const Mandatory
ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const Mandatory
ReferenceAlias Property Alias_WoundedMarker Auto Const Mandatory
ActorValue Property SQ_WoundedState Auto Const Mandatory
ActorValue Property RQ_AV_Hello Auto Const Mandatory
