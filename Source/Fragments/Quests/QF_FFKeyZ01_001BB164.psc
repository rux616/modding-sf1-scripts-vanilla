;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFKeyZ01_001BB164 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
DialogueCFTheKey.SetStage(250)
Game.GetPlayer().MoveTo(Alias_BogStartMarker.GetRef())
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
DialogueCFTheKey.SetStage(200)
SetStage(100)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
DialogueCFTheKey.SetStage(200)
SetStage(100)
SetStage(200)
Game.GetPlayer().AddItem(Alias_MadeleineRing.GetRef())
Game.GetPlayer().MoveTo(Alias_BogStartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor ClayRef = Alias_Clay.GetActorRef()
Actor SpacerClayRef = Alias_BackupClay.GetActorRef()

if Alias_BossMarker.GetActorRef().IsInFaction(SpacerFaction)
    SpacerClayRef.AddAliasedItem(FFKeyZ01_ClayLetter, Alias_ClayLetter)
    SpacerClayRef.EnableNoWait()
else
    ClayRef.AddAliasedItem(FFKeyZ01_ClayLetter, Alias_ClayLetter)
    ClayRef.EnableNoWait()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)
SetObjectiveCompleted(100)
Alias_ClayContainer.GetRef().AddItem(Alias_CFSD01Evidence.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_MadeleineRing.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BogStartMarker Auto Const Mandatory

Quest Property LC082 Auto Const Mandatory

Quest Property DialogueCFTheKey Auto Const Mandatory

ReferenceAlias Property Alias_MadeleineRing Auto Const Mandatory

Perk Property FactionCrimsonFleetPerk Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01Evidence Auto Const Mandatory

ReferenceAlias Property Alias_ClayContainer Auto Const Mandatory

ReferenceAlias Property Alias_Clay Auto Const Mandatory

ReferenceAlias Property Alias_BossMarker Auto Const Mandatory

ReferenceAlias Property Alias_BackupClay Auto Const Mandatory

ReferenceAlias Property Alias_ClayLetter Auto Const Mandatory

Faction Property SpacerFaction Auto Const Mandatory

Faction Property EclipticFaction Auto Const Mandatory

Book Property FFKeyZ01_ClayLetter Auto Const Mandatory
