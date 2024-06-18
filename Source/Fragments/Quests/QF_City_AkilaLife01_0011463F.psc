;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_AkilaLife01_0011463F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Teleport the player to right area
Game.GetPlayer().MoveTo(AkilaLife01_StartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Move the girls to their start location
ObjectReference oTarg = Alias_AnnieWilcox.GetActorRef()
oTarg.MoveTo(oTarg.GetLinkedRef(AkilaLife01_Keyword))

oTarg = Alias_EmilyCartwright.GetActorRef()
oTarg.MoveTo(oTarg.GetLinkedRef(AkilaLife01_Keyword))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
City_AkilaLife01_050_KidTalk.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(200)

; Spawn the thief and have him sneak
Actor ThiefRef = Alias_Thief.GetActorRef()

ThiefRef.Enable()
ThiefRef.EvaluatePackage()
ThiefRef.AllowBleedoutDialogue(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
utility.wait(0.3)
Alias_Thief.GetActorReference().StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
; Start up her scene
City_AkilaLife01_200b_SecurityShowsUp.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Spawn security
Alias_Security.GetActorRef().Enable()
Alias_Security.GetActorRef().EvaluatePackage()

; Start up her scene
City_AkilaLife01_175_GuardBarks.Start()

; Move Annie to her mother
Alias_AnnieWilcox.GetRef().MoveTo(Alias_EmmaWilcox.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

; Make the thief stop crouching
Alias_Thief.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Disable the thief
Alias_Thief.GetActorRef().Disable()

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

ReferenceAlias Property Alias_AnnieWilcox Auto Const Mandatory

ReferenceAlias Property Alias_EmilyCartwright Auto Const Mandatory

Scene Property City_AkilaLife01_050_KidTalk Auto Const Mandatory

ObjectReference Property AkilaLife01_StartMarker Auto Const Mandatory

Keyword Property AkilaLife01_Keyword Auto Const Mandatory

ReferenceAlias Property Alias_Thief Auto Const Mandatory

ReferenceAlias Property Alias_Security Auto Const Mandatory

Scene Property City_AkilaLife01_200b_SecurityShowsUp Auto Const Mandatory

Scene Property City_AkilaLife01_175_GuardBarks Auto Const Mandatory

ReferenceAlias Property Alias_EmmaWilcox Auto Const Mandatory
