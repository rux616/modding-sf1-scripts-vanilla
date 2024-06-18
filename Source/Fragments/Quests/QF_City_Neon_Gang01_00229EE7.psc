;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Neon_Gang01_00229EE7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)

Alias_Digger.GetActorRef().EvaluatePackage()

;Disable the furniture in the bar for the Gang opening scene
Gang01_BarMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)

Alias_Digger.GetActorRef().EvaluatePackage()

;Disable the furniture in the bar for the Gang opening scene
Gang01_BarMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; This is the walk and talk scene
SetStage(210)

;Unlock Strikers door and set new lock level
Alias_StrikersDoor.GetRef().Unlock()
Alias_StrikersDoor.GetRef().SetLockLevel(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; Play the scene
Gang01_200a_AuraBriggsAmbient.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
Alias_Andrea.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

Alias_Andrea.GetActorRef().EvaluatePackage()

; Enable the bad guys at the warehouse
Alias_DiscipleEnemies.EnableAll()
;Alias_DiscipleEnemies.StartCombatAll(Game.GetPlayer())

; Get rid of Digger
Alias_Digger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Alias_Andrea.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Start up the follow up quest
City_Neon_Gang02.SetStage(100)
City_Neon_Gang02.SetActive()
Gang01_BarMarker.Enable()

; Now end the quest
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

Scene Property Gang01_200a_AuraBriggsAmbient Auto Const Mandatory

RefCollectionAlias Property Alias_DiscipleEnemies Auto Const Mandatory

Quest Property City_Neon_Gang02 Auto Const Mandatory

ReferenceAlias Property Alias_StrikersDoor Auto Const Mandatory

ReferenceAlias Property Alias_Digger Auto Const Mandatory

ObjectReference Property Gang01_BarMarker Auto Const Mandatory

ReferenceAlias Property Alias_MadameSauvage Auto Const Mandatory

ReferenceAlias Property Alias_Andrea Auto Const Mandatory
