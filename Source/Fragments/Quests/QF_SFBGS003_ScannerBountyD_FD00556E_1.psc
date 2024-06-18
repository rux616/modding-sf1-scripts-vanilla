;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SFBGS003_ScannerBountyD_FD00556E_1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
LR01Bounty.SetValue(Utility.RandomInt(LR01BountyLowerLimit.GetValue() as Int,LR01BountyUpperLimit.GetValue() as Int))
UpdateCurrentInstanceGlobal(LR01Bounty)
Game.GetPlayer().AddPerk(LR01BountyTagPromptPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0029_Item_00
Function Fragment_Stage_0029_Item_00()
;BEGIN CODE
Alias_SurrenderFurnitureAlias.GetRef().EnableNoWait()
Alias_SurrenderFurnitureAlias.GetRef().MoveTo(Alias_BountyTargetAlias.GetRef())
(Alias_BountyTargetAlias.GetRef() as Actor).SetLinkedRef(Alias_SurrenderFurnitureAlias.GetRef())
(Alias_BountyTargetAlias.GetRef() as Actor).EvaluatePackage()
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
(Alias_BountyTargetAlias.GetRef() as Actor).AddToFaction(PlayerEnemyFaction)
(Alias_BountyTargetAlias.GetRef() as Actor).StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
(Alias_BountyTargetAlias.GetRef() as Actor).RemoveFromFaction(PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().AddItem(Credits, (LR01Bounty.GetValue() as int))
Alias_GuardAlias.RefillAlias()
(Alias_BountyTargetAlias.GetRef() as Actor).StopCombat()
(Alias_GuardAlias.GetRef() as Actor).EvaluatePackage()
(Alias_BountyTargetAlias.GetRef() as Actor).SetCrimeFaction((Alias_GuardAlias.GetRef() as Actor).GetCrimeFaction())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if(Alias_BountyTargetAlias.GetRef().GetValue(LR01_BountyWantedAliveAV) == 1)
LR01Bounty.SetValue((LR01Bounty.GetValue() as Int)/2)
UpdateCurrentInstanceGlobal(LR01Bounty)
endif
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property LR01Bounty Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_BountyTargetAlias Auto Const Mandatory

Perk Property LR01BountyTagPromptPerk Auto Const Mandatory

Furniture Property NPCKneelSurrender Auto Const Mandatory

ReferenceAlias Property Alias_SurrenderFurnitureAlias Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_GuardAlias Auto Const Mandatory

GlobalVariable Property LR01BountyLowerLimit Auto Const Mandatory

GlobalVariable Property LR01BountyUpperLimit Auto Const Mandatory

ActorValue Property LR01_BountyWantedAliveAV Auto Const Mandatory
