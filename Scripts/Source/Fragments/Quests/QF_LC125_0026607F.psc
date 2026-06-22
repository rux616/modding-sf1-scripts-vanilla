;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC125_0026607F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_BossEnableMarker.getref().enable()
WWiseEvent_QST_LC125_BipedA_SkinC_SizeL.Play(Alias_BossRoarAudio.getref())
utility.wait(0.5)
Alias_BossAlias.getactorref().EvaluatePackage()
Alias_BossSupport02.getactorref().EvaluatePackage()
LC125SpawnBossScene.start()
LC125SpawnSopport02Scene.start()
Alias_BossAlias.getactorref().EvaluatePackage()
Alias_BossSupport02.getactorref().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Alias_BossAlias.getactorref().EvaluatePackage()
Alias_BossAlias.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
Alias_BossSupport02.getactorref().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Alias_BossAlias.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_AllCreatures.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BossAlias Auto Const Mandatory

Scene Property LC125SpawnBossScene Auto Const

ReferenceAlias Property Alias_BossEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_BossSupport01 Auto Const Mandatory

ReferenceAlias Property Alias_BossSupport02 Auto Const Mandatory

Scene Property LC125SpawnSopport01Scene Auto Const

Scene Property LC125SpawnSopport02Scene Auto Const

WwiseEvent Property WWiseEvent_QST_LC125_BipedA_SkinC_SizeL Auto Const

ReferenceAlias Property Alias_BossRoarAudio Auto Const Mandatory

RefCollectionAlias Property Alias_AllCreatures Auto Const Mandatory
