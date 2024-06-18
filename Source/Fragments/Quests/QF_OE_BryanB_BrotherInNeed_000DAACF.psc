;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_BryanB_BrotherInNeed_000DAACF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; turn off blocking hellos so NPC can have greeting
Alias_WoundedSibling.TryToSetValue(SQ_CaptiveStateNoBlockingHellos, 1)
; remove medpacks from their inventories
Alias_WoundedSibling.GetRef().RemoveItem(Aid_MedPack, 99)
Alias_Sibling.GetRef().RemoveItem(Aid_MedPack, 99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; mark this unique quest as done
OE_BryanB_FamilyInNeedDone.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Aid_MedPack)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
; Flag the wounded person as being healed
(Alias_WoundedSibling as DefaultCaptiveWoundedAlias).HealActor()

; Get out of furniture
Alias_WoundedSibling.GetActorRef().EvaluatePackage()
Alias_WoundedSibling.GetActorRef().SetProtected(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
If !GetStageDone(215)
   Alias_WoundedSibling.TryToKill()
Else
   Alias_WoundedSibling.GetActorRef().EvaluatePackage()
EndIf

If !GetStageDone(255)
      Alias_Sibling.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
Actor sibling = Alias_Sibling.GetActorRef()
sibling.StartCombat(Game.GetPlayer())
sibling.SetValue(Game.GetAggressionAV(), 1)
sibling.AddToFaction(REPlayerEnemy)

If GetStageDone(215)
   Alias_WoundedSibling.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
OE_SiblingInNeed_Scene_CombatStarts.Start()
SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
SetStage(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9999_Item_00
Function Fragment_Stage_9999_Item_00()
;BEGIN AUTOCAST TYPE oescript
Quest __temp = self as Quest
oescript kmyQuest = __temp as oescript
;END AUTOCAST
;BEGIN CODE
;(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property OE_BryanB_BrotherInNeed_TalkToSamScene Auto Const

Scene Property OE_BryanB_BrotherInNeed_SamLivesScene Auto Const

Potion Property Aid_MedPack Auto Const Mandatory

ReferenceAlias Property Alias_Sibling Auto Const Mandatory

Faction Property REPlayerEnemy Auto Const Mandatory

ReferenceAlias Property Alias_WoundedSibling Auto Const Mandatory

GlobalVariable Property OE_BryanB_FamilyInNeedDone Auto Const Mandatory

ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const Mandatory

Scene Property OE_SiblingInNeed_Scene_CombatStarts Auto Const Mandatory

Keyword Property AnimArchetypeDepressed Auto Const Mandatory

ReferenceAlias Property Alias_SammyInjuredMarker Auto Const Mandatory

Potion Property TraumaPack Auto Const Mandatory
