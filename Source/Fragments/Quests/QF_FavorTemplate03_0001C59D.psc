;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FavorTemplate03_0001C59D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;pop objective unless the player has already completed it
If GetStageDone(100) == 0
  SetObjectiveDisplayed(10)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;pop objective if we haven't already
If GetStageDone(10) == 0
  SetObjectiveDisplayed(10)
EndIf

;Autopsy activator no longer needed
Alias_AutopsyTarget.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;pop objective if we haven't already
If GetStageDone(10) == 0
  SetObjectiveDisplayed(10)
EndIf

;Autopsy activator no longer needed
Alias_AutopsyTarget.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;disable activation trigger for clue
Alias_RedHerring01.GetRef().Disable()

;start comment scene
FavorTemplate02_002_RedHerring01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;disable activation trigger for clue
Alias_RedHerring02.GetRef().Disable()

;start comment scene
FavorTemplate02_003_RedHerring02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;disable activation trigger for clue
Alias_KeyClue.GetRef().Disable()

;start comment scene
FavorTemplate02_004_KeyClue.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;pop objective unless the player has already completed it
If GetStageDone(100) == 0
  SetObjectiveCompleted(10)
  SetObjectiveDisplayed(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;update objectives
If GetStageDone(10) == 1
  SetObjectiveCompleted(20)
  SetObjectiveDisplayed(30)
Else
  ;if player is doing this early, pop different objective
  SetObjectiveCompleted(20)
  SetObjectiveDisplayed(35)
EndIf

;disable clues if we haven't already
Alias_RedHerring01.GetRef().Disable()
Alias_RedHerring02.GetRef().Disable()
Alias_KeyClue.GetRef().Disable()
Alias_AutopsyTarget.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RedHerring01 Auto Const Mandatory

Scene Property FavorTemplate02_002_RedHerring01 Auto Const Mandatory

ReferenceAlias Property Alias_RedHerring02 Auto Const Mandatory

Scene Property FavorTemplate02_003_RedHerring02 Auto Const Mandatory

ReferenceAlias Property Alias_KeyClue Auto Const Mandatory

Scene Property FavorTemplate02_004_KeyClue Auto Const Mandatory

ReferenceAlias Property Alias_AutopsyTarget Auto Const Mandatory
