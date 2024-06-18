;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SQ_GuardShips_Toliman_001C54EB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
if pUC08_TolimanGuardShipsSceneOnce.GetValue() < 1
  pUC08_TolimanGuardShipsSceneOnce.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
if pUC08_TolimanGuardShipsSceneOnce.GetValue() < 1
  pUC08_TolimanGuardShipsSceneOnce.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
UC08.SetStage(155)
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

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

ReferenceAlias Property Alias_Ship01 Auto Const Mandatory

GlobalVariable Property pUC08_TolimanGuardShipsSceneOnce Auto Const Mandatory

Quest Property UC08 Auto Const Mandatory
