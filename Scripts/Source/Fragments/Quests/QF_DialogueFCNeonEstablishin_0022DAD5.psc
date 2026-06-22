;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueFCNeonEstablishin_0022DAD5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DialogueFCNeonEstablishingScene_Main.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_NeonGuard_F02.GetActorRef().EvaluatePackage()
Alias_NeonGuard_M01.GetActorRef().EvaluatePackage()
Alias_Neshar.GetActorRef().EvaluatePackage()

; Start up the Drug Quest
City_Neon_Drug01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_Neshar.GetActorRef().Disable(true)
NeonESSceneStatus.SetValue(NeonESSceneStatus.GetValue() +1)

If NeonESSceneStatus.GetValue() >= 3
SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_NeonGuard_F02.GetActorRef().Disable(true)
NeonESSceneStatus.SetValue(NeonESSceneStatus.GetValue() +1)

If NeonESSceneStatus.GetValue() >= 3
SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Alias_NeonGuard_M01.GetActorRef().Disable(true)
NeonESSceneStatus.SetValue(NeonESSceneStatus.GetValue() +1)

If NeonESSceneStatus.GetValue() >= 3
SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DialogueFCNeonEstablishingScene_Main Auto Const Mandatory

ReferenceAlias Property Alias_NeonGuard_F02 Auto Const Mandatory

ReferenceAlias Property Alias_NeonGuard_M01 Auto Const Mandatory

ReferenceAlias Property Alias_Neshar Auto Const Mandatory

GlobalVariable Property NeonESSceneStatus Auto Const Mandatory

Quest Property City_Neon_Drug01 Auto Const Mandatory
