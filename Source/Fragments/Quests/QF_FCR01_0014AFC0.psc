;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FCR01_0014AFC0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50)

; If this quest hasn't been done before - rename the boss
;if ( FCR01TimesCompleted.GetValue() == 0 )
;  Alias_FirstBossRename.ForceRefTo(Alias_BossRef.GetRef())
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)

; If you haven't done this quest - the first time you have a specific enemy
if ( FCR01TimesCompleted.GetValue() == 0 )
  SetStage(110)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; If this quest hasn't been done before - rename the boss
if ( FCR01TimesCompleted.GetValue() == 0 )
  Alias_FirstBossRename.ForceRefTo(Alias_BossRef.GetRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)

; If this quest hasn't been done before - alt objective
if ( FCR01TimesCompleted.GetValue() == 0 )
  SetObjectiveDisplayed(155)
else
  SetObjectiveDisplayed(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveCompleted(155)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Increment the number of times the player has done FCR01
FCR01TimesCompleted.Mod(1)

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property FCR01TimesCompleted Auto Const Mandatory

ReferenceAlias Property Alias_FirstBossRename Auto Const Mandatory

ReferenceAlias Property Alias_BossREF Auto Const Mandatory
