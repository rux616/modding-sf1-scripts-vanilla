;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_AustinF_DyingWish_000FC908 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Int Request = Utility.RandomInt(1,3)

If Request == 1
   SetStage(110)
ElseIf Request == 2
   SetStage(120)
Else
   SetStage(130)
EndIf
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

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(FriedPickles, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Kiffles, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Pierogis, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0245_Item_00
Function Fragment_Stage_0245_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Gazpacho, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Actor NPC = Alias_NPC.GetActorRef()

NPC.EvaluatePackage()
NPC.SetUnconscious(True)
Alias_NPC.GetActorRef().AddSpell(AbilityDamageHealthSlow)
Utility.Wait(2.5)
SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
Actor NPC = Alias_NPC.GetActorRef()
NPC.Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
Actor NPC = Alias_NPC.GetActorRef()

If GetStageDone(225)
   NPC.AddItem(FriedPickles, 1)
ElseIf GetStageDone(230) 
   NPC.AddItem(Kiffles, 1)
Else 
   NPC.AddItem(Pierogis, 1)
EndIf

SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_NPC Auto Const Mandatory
Spell Property AbilityDamageHealthSlow Auto Const

LeveledItem Property LL_Food_Homemade Auto Const Mandatory

Potion Property FriedPickles Auto Const Mandatory

Potion Property Kiffles Auto Const Mandatory

Potion Property Pierogis Auto Const Mandatory

Potion Property Gazpacho Auto Const Mandatory
