;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Neon_Gang_Dialogue_002111FE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Queue up the quest
City_Neon_Gang01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
; Once you learn enough about the situation you can start the gang quest
City_Neon_Gang01.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property City_Neon_Gang01 Auto Const Mandatory
