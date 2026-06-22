;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_Austinf_EggThief_00006E52 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
int chance = Utility.RandomInt(1,5)

If chance == 1 
   SetStage(210)
ElseIf chance == 2
   SetStage(220)
ElseIf chance == 3
   SetStage(230)
ElseIf chance == 4
   SetStage(240)
Else
   SetStage(250)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Alias_Terrormorph_Spawn.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
Alias_Predator_Apex.GetRef().RemoveKeyword(OE_PackageCheck_Keyword)
(Alias_Predator_Apex.GetRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
ObjectReference Creature 
int index = 0

While index < Alias_Predators_GroupFormation.GetCount()
   Creature = Alias_Predators_GroupFormation.GetAt(index)
   If Creature
      Creature.RemoveKeyword(OE_PackageCheck_Keyword)
      (Creature as Actor).EvaluatePackage()
   EndIf 
   index += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.LaunchAllShips(True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Corpse_Creature_00 Auto Const Mandatory

ReferenceAlias Property Alias_Corpse_Creature_01 Auto Const Mandatory

ReferenceAlias Property Alias_Terrormorph_Spawn Auto Const Mandatory

ReferenceAlias Property Alias_Predator_Apex Auto Const Mandatory

RefCollectionAlias Property Alias_Predators_GroupFormation Auto Const Mandatory

Keyword Property OE_PackageCheck_Keyword Auto Const Mandatory
