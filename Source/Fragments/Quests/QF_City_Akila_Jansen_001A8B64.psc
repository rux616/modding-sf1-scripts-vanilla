;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Akila_Jansen_001A8B64 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
if ( !GetStageDone(100) )
  SetObjectiveDisplayed(25)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(25)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Set up an encounter with Milena
City_Akila_Jansen_MilenaSpace.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(300)
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
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

; Change Simone and Elias to be happy now
Alias_MarkoJensan.GetActorRef().ChangeAnimArchetype(AnimArchetypeFriendly)
Alias_SimoneJansen.GetActorRef().ChangeAnimArchetype(AnimArchetypeFriendly)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
SetStage(500)

; Pay Tom his bribe
Game.GetPlayer().RemoveItem(Credits, 1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
CompleteAllObjectives()

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

Quest Property City_Akila_Jansen_MilenaSpace Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_MarkoJensan Auto Const Mandatory

ReferenceAlias Property Alias_SimoneJansen Auto Const Mandatory

Keyword Property AnimArchetypeFriendly Auto Const Mandatory

Keyword Property AnimArchetypeDepressed Auto Const Mandatory
