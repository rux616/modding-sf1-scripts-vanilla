;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FavorTemplate04_0001C5A1 Extends Quest Hidden Const

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

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;update objectives unless the player is doing this early
If GetStageDone(10) == 1
  SetObjectiveCompleted(10)
  SetObjectiveDisplayed(20)
EndIf

;ambush NPCs are enabled
Alias_AmbushEncounter.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
FavorTemplate04_002_Ambush.Start()

;update objectives unless the player is doing this early
If GetStageDone(10) == 1
  SetObjectiveDisplayed(20, abDisplayed=False)
  SetObjectiveDisplayed(30)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;make sure all ambushers are now hostile
Alias_AmbushEncounter.SetValue(Aggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
;combat starts
SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;ambush has been dealt with
SetStage(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
;update objectives unless the player is doing this early
If GetStageDone(10) == 1
  SetObjectiveCompleted(30)
  SetObjectiveDisplayed(20, abDisplayed=True)
EndIf
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

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Make sure enemies are reset to be hostile
Alias_AmbushEncounter.SetValue(Aggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_AmbushEncounter Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Scene Property FavorTemplate04_002_Ambush Auto Const Mandatory
