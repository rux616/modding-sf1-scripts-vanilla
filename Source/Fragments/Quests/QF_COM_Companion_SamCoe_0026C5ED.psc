;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COM_Companion_SamCoe_0026C5ED Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0605_Item_00
Function Fragment_Stage_0605_Item_00()
;BEGIN CODE
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0615_Item_00
Function Fragment_Stage_0615_Item_00()
;BEGIN CODE
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(798) == 1
SetObjectiveCompleted(798)
endif
COM_Quest_SamCoe_Q01.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
; Finish up his personal quest
COM_Quest_SamCoe_Q01.SetStage(1600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0798_Item_00
Function Fragment_Stage_0798_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(798)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0799_Item_00
Function Fragment_Stage_0799_Item_00()
;BEGIN CODE
SetObjectiveCompleted(798)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0801_Item_00
Function Fragment_Stage_0801_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(801)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0802_Item_00
Function Fragment_Stage_0802_Item_00()
;BEGIN CODE
SetObjectiveCompleted(801)
SetObjectiveDisplayed(802)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
SetObjectiveCompleted(802)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0825_Item_00
Function Fragment_Stage_0825_Item_00()
;BEGIN AUTOCAST TYPE com_companionquestscript
Quest __temp = self as Quest
com_companionquestscript kmyQuest = __temp as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
SetStage(820)

; Spin up the Commitment quest (no duh)
SetObjectiveCompleted(802)
kmyQuest.StartCommitmentQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property COM_Quest_SamCoe_Q01 Auto Const Mandatory

Quest Property COM_Quest_SamCoe_Commitment Auto Const Mandatory

Perk Property Crew_Geology Auto Const Mandatory

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

Perk Property CREW_Ship_Piloting Auto Const Mandatory

Perk Property Crew_RifleCertification Auto Const Mandatory
