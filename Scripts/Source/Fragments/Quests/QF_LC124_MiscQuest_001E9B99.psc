;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC124_MiscQuest_001E9B99 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Update objective in COM_Quest_SamCoe_Q01
COM_Quest_SamCoe_Q01.SetStage(1200)

;Start the ambush
alias_EnemyShip1.GetReference().Enable()
utility.wait(2)
alias_EnemyShip2.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
alias_EnemyShip3.GetReference().Enable()
utility.wait(3)
alias_EnemyShip4.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
alias_EnemyShip5.GetReference().Enable()
utility.wait(3)
alias_EnemyShip6.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;All enemies are dead and accounted for
;Let SamCoe_Q01 know all is done.
COM_Quest_SamCoe_Q01.SetStage(1300)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_EnemyShip1 Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip2 Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip3 Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip4 Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip5 Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip6 Auto Const Mandatory

RefCollectionAlias Property Alias_LC124_Enemies_Total Auto Const Mandatory

Quest Property COM_Quest_SamCoe_Q01 Auto Const
