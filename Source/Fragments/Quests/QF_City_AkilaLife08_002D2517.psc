;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_AkilaLife08_002D2517 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Check to see if the player has already talked to Amira about this
if ( !GetStageDone(100) ) 
  SetObjectiveDisplayed(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
Alias_Ashta.GetRef().Enable()
Alias_Ashta02.GetRef().Enable()
Alias_Ashta03.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)
SetObjectiveDisplayed(600)
SetObjectiveDisplayed(700)
if Alias_Ashta.GetActorRef().IsDead()==0
Alias_Ashta.GetActorRef().Disable()
endif
if Alias_Ashta02.GetActorRef().IsDead()==0
Alias_Ashta02.GetRef().Disable()
endif
if Alias_Ashta03.GetActorRef().IsDead()==0
Alias_Ashta03.GetRef().Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)

; If you've handled all the donations - progress through the quest
if ( GetStageDone(600) && GetStageDone(700) )
  SetStage(800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)

; If you've handled all the donations - progress through the quest
if ( GetStageDone(500) && GetStageDone(700) )
  SetStage(800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)

; If you've handled all the donations - progress through the quest
if ( GetStageDone(600) && GetStageDone(500) )
  SetStage(800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)

; Get the wheat delivery for the Jansens
Game.GetPlayer().AddAliasedItem(AkilaLife08_WheatJar, Alias_WheatDelivery, 1, FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Remove the shipment
Game.GetPlayer().RemoveItem(AkilaLife08_WheatJar)

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

MiscObject Property AkilaLife08_WheatJar Auto Const Mandatory

ReferenceAlias Property Alias_WheatDelivery Auto Const Mandatory

ReferenceAlias Property Alias_Ashta Auto Const Mandatory

ReferenceAlias Property Alias_Ashta02 Auto Const Mandatory

ReferenceAlias Property Alias_Ashta03 Auto Const Mandatory
