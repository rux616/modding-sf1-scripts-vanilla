;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RL082_EavesdroppingSceneT_002B8950 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_DialgoueActor.getactorref().SetRestrained(true)
Alias_DialgoueActor.getactorref().SetValue(Game.GetHealthAV(), 5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_DialgoueActor.getactorref().RemoveItem(RL082StorageKey,1)
Game.getplayer().additem(RL082StorageKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
RL082_EavesdroppingScene_Explosion02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
GEN_PointGravity_LG.cast(Alias_PointGravMarker.getref())

Alias_PointGravMarker.getref().PlaceAtMe(OxygenTankExplosion01)
Game.ShakeCamera()
Alias_BreachAudio.GetRef().Enable()

utility.wait(2.0)

RL082TAwarehouse.SetGravityScale(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
Alias_BreachAudio.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveFailed(10)
SetObjectiveFailed(20)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_HavokObject Auto Const Mandatory

Explosion Property OxygenTankExplosion01 Auto Const

Cell Property RL082TAWarehouse Auto Const

ReferenceAlias Property Alias_AirlockDoor01 Auto Const Mandatory

ReferenceAlias Property Alias_AirlockDoor02 Auto Const Mandatory

ReferenceAlias Property Alias_HavokObject01 Auto Const Mandatory

SPELL Property GEN_PointGravity_LG Auto Const

ReferenceAlias Property Alias_PointGravMarker Auto Const Mandatory

Key Property RL082StorageKey Auto Const

ReferenceAlias Property Alias_DialgoueActor Auto Const Mandatory

Scene Property RL082_EavesdroppingScene_Explosion02 Auto Const

ReferenceAlias Property Alias_BreachAudio Auto Const Mandatory
