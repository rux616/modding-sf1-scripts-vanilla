;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_MP_AcelesDropoff_000478A2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Location Loc = Alias_OE_Location.GetLocation()
ObjectReference reward = Alias_RewardContainer.GetRef()

Alias_MapMarker.TryToEnable()

If Loc.HasKeyword(LocTypeOE_ThemeNaturalKeyword)
   SetStage(10)
ElseIf reward.HasKeyword(LocTypeOE_ThemeNaturalKeyword)
   SetStage(10)
Else
   SetStage(5)
EndIf 

SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_RewardContainer.GetRef().Lock()

If Alias_RewardKey.GetRef()
   Alias_RewardContainer.GetRef().SetLockLevel(255)
Else
   Alias_RewardContainer.GetRef().SetLockLevel(75)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_RewardContainer.GetRef().Lock(False)
Alias_RewardKey.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Alias_Terrormorph.GetActorRef().EvaluatePackage()
Alias_Terrormorph.GetRef().Disable()
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Aceles.GetRef().Enable()
Alias_Vanguard.GetRef().Enable()

Alias_Aceles.GetActorRef().EvaluatePackage()
Alias_Vanguard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Vanguard.GetActorRef().EvaluatePackage()
Alias_Aceles.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem( LL_Weapon_Ranged_Marine )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
If GetStageDone(260) && GetStageDone(270) && GetStageDone(280)
   SetStage(285)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
If GetStageDone(260) && GetStageDone(270) && GetStageDone(280)
   SetStage(285)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
If GetStageDone(260) && GetStageDone(270) && GetStageDone(280)
   SetStage(285)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0285_Item_00
Function Fragment_Stage_0285_Item_00()
;BEGIN CODE
SetStage(290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(300)

Alias_Terrormorph.GetRef().Enable()
Alias_Terrormorph.GetActorRef().EvaluatePackage()

Alias_Aceles.GetActorRef().EvaluatePackage()
Alias_Vanguard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveCompleted(300)
If !GetStageDone(700)
   SetStage(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
If !GetStageDone(700)
   SetObjectiveDisplayed(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetStage(980)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetStage(980)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0970_Item_00
Function Fragment_Stage_0970_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem( LL_Quest_Reward_Credits_Large )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0975_Item_00
Function Fragment_Stage_0975_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem( LL_Quest_Reward_Credits )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)

If !GetStageDone(700)
   SetStage(995)
Else
   SetStage(999)
EndIf
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
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

; Actors
ReferenceAlias Property Alias_TerrorMorph Auto Const Mandatory
ReferenceAlias Property Alias_Aceles Auto Const Mandatory
ReferenceAlias Property Alias_Vanguard Auto Const Mandatory

; Quest infrastructure
ReferenceAlias Property Alias_MapMarker Auto Const Mandatory
Keyword Property LocTypeOE_ThemeNaturalKeyword Auto Const Mandatory
LocationAlias Property Alias_OE_Location Auto Const Mandatory

; Rewards
LeveledItem Property LL_Ammo Auto Const Mandatory
LeveledItem Property LL_Quest_Reward_Credits Auto Const Mandatory
LeveledItem Property LL_Quest_Reward_Credits_Large Auto Const Mandatory
LeveledItem Property LL_Weapon_Ranged_Marine Auto Const Mandatory
ReferenceAlias Property Alias_RewardContainer Auto Const Mandatory
ReferenceAlias Property Alias_RewardKey Auto Const Mandatory

