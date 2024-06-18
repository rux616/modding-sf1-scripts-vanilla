;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_MP_Creatures05_00067FD0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE defaultgroupspawnquestscript
Quest __temp = self as Quest
defaultgroupspawnquestscript kmyQuest = __temp as defaultgroupspawnquestscript
;END AUTOCAST
;BEGIN CODE
int Chance = Utility.RandomInt(1,4)

If Chance == 4
   Alias_Corpse.GetRef().AddItem(BonusLoot)
ElseIf Chance == 3
   Alias_Corpse.GetRef().AddItem(Creature_Egg)
ElseIf Chance == 2
   Alias_Nest.GetRef().AddItem(Creature_Egg)
Else
   Alias_Nest.GetRef().AddItem(BonusLoot)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor AttackerA1 = Alias_AttackerA1.GetActorRef()
Actor AttackerA3 = Alias_AttackerA3.GetActorRef()

AttackerA1.Enable()
AttackerA3.Enable()
AttackerA1.EvaluatePackage()
AttackerA3.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Actor AttackerB1 = Alias_AttackerB1.GetActorRef()
Actor AttackerB3 = Alias_AttackerB3.GetActorRef()

AttackerB1.Enable()
AttackerB3.Enable()
AttackerB1.EvaluatePackage()
AttackerB3.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
If !GetStageDone(300)
   SetStage(300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
If !GetStageDone(300)
   SetStage(300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ReferenceAlias Property Alias_AttackerA1 Auto Const Mandatory

ReferenceAlias Property Alias_AttackerA3 Auto Const Mandatory

ReferenceAlias Property Alias_AttackerB1 Auto Const Mandatory

ReferenceAlias Property Alias_AttackerB3 Auto Const Mandatory

ReferenceAlias Property Alias_Corpse Auto Const Mandatory

MiscObject Property Creature_Egg Auto Const Mandatory

LeveledItem Property BonusLoot Auto Const Mandatory

ReferenceAlias Property Alias_Nest Auto Const Mandatory
