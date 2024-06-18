;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Akila_Ashta02_00212B4F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; End Ashta01
City_Akila_Ashta01.Stop()

; Teleport the player to the temp start location
Game.GetPlayer().MoveTo(Alias_PlayerStartMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor aTarg = Alias_Keoni.GetActorRef()
aTarg.Enable()

if GetStageDone(0)
Alias_Keoni.GetReference().MoveTo(Alias_PlayerStartMarker.GetReference())
endif

; Make it so the Bailey city life scene is now closed off
; (Technically this isn't required, but it's much easy for playtest)
DialogueFCAkilaCity.SetStage(2015)

;temp
SetStage(5)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_Keoni.GetActorReference().EvaluatePackage()
Alias_Davis.GetActorReference().EvaluatePackage()
Alias_Bailey.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE City_Akila_Ashta02_Script
Quest __temp = self as Quest
City_Akila_Ashta02_Script kmyQuest = __temp as City_Akila_Ashta02_Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)

; Use the function to track time for 24 hours
kmyQuest.Wait24()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

; Get him to move pronto
Alias_Davis.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveCompleted(35)
SetObjectiveDisplayed(40)
Alias_Davis.GetActorReference().EvaluatePackage()

; Now spawn the destroyed robot
Alias_DeadRobot.GetRef().Enable()
Alias_DeadRobot.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Davis.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_Davis.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Alias_Creature01.GetReference().Enable()
;Alias_Creature02.GetReference().Enable()
;Alias_Creature03.GetReference().Enable()

;Trigger Ashta ambush.
(Alias_AmbushTrigger.GetRef() as DefaultRefAmbushTrigger2).TriggerAmbush()

SetObjectiveCompleted(40)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0081_Item_00
Function Fragment_Stage_0081_Item_00()
;BEGIN CODE
if GetStageDone(82) && GetStageDone(83)
SetStage(85)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0082_Item_00
Function Fragment_Stage_0082_Item_00()
;BEGIN CODE
if GetStageDone(81) && GetStageDone(83)
SetStage(85)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0083_Item_00
Function Fragment_Stage_0083_Item_00()
;BEGIN CODE
if GetStageDone(81) && GetStageDone(82)
SetStage(85)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(85)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0121_Item_00
Function Fragment_Stage_0121_Item_00()
;BEGIN CODE
SetStage(120)

; Here's your bribe greedy player
Game.GetPlayer().AddItem(Credits, 275)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Start up the next quest
City_Akila_Ashta03.SetStage(5)
City_Akila_Ashta03.SetActive()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Davis Auto Const Mandatory

ReferenceAlias Property Alias_Keoni Auto Const Mandatory

ReferenceAlias Property Alias_Bailey Auto Const Mandatory

ReferenceAlias Property Alias_PlayerStartMarker Auto Const Mandatory

ReferenceAlias Property Alias_Creature01 Auto Const Mandatory

ReferenceAlias Property Alias_Creature02 Auto Const Mandatory

ReferenceAlias Property Alias_Creature03 Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_DeadRobot Auto Const Mandatory

Quest Property City_Akila_Ashta01 Auto Const Mandatory

Quest Property City_Akila_Ashta03 Auto Const Mandatory

Quest Property DialogueFCAkilaCity Auto Const Mandatory

ReferenceAlias Property Alias_AmbushTrigger Auto Const Mandatory
