;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RAD02_0029EF60 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Teleport the player to Nadia
Actor aTarg = Alias_NadiaMuffaz.GetActorRef()
Game.GetPlayer().MoveTo(aTarg)

; For testing only! This stage is normally set by MQ101
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; If you've met Nadia - then no need for Tommy to do anything
if ( !GetStageDone(50) )
  Alias_TommyBitlow.GetRef().Enable()
  Alias_TommyBitlow.GetActorRef().EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_TommyBitlow.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(25)
SetObjectiveDisplayed(50)

; Now do a long check to see if you've already found some stories
if ( GetStageDone(100) )
  SetObjectiveDisplayed(100)
endif
if ( GetStageDone(200) )
  SetObjectiveDisplayed(200)
endif
if ( GetStageDone(300) )
  SetObjectiveDisplayed(300)
endif
if ( GetStageDone(400) )
  SetObjectiveDisplayed(400)
endif
if ( GetStageDone(500) )
  SetObjectiveDisplayed(500)
endif
if ( GetStageDone(600) || GetStageDone(700) )
  SetObjectiveDisplayed(600)
endif

; Make Tommy Bitlow go away forever 
; You'll get a full time gig one day, Tommy! I believe in you!

; The power of belief wins again! Tommy endures! LONG LIVE TOMMY!
; Alias_TommyBitlow.GetActorRef().Disable()

;Start Primary Sources Z Quest
City_NewAtlantis_Z_PrimarySources.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Do you know about Nadia's offer - if so objective
if ( GetStageDone(50) )
  SetObjectiveDisplayed(100)
else
  SetStage(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0199_Item_00
Function Fragment_Stage_0199_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)

; Increment her interview counter
RAD02_InterviewCount.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Do you know about Nadia's offer - if so objective
if ( GetStageDone(50) )
  SetObjectiveDisplayed(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0299_Item_00
Function Fragment_Stage_0299_Item_00()
;BEGIN AUTOCAST TYPE RAD02Script
Quest __temp = self as Quest
RAD02Script kmyQuest = __temp as RAD02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(200)

; See if all the interviews have been done
kmyQuest.StoryCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Do you know about Nadia's offer - if so objective
if ( GetStageDone(50) )
  SetObjectiveDisplayed(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0399_Item_00
Function Fragment_Stage_0399_Item_00()
;BEGIN AUTOCAST TYPE RAD02Script
Quest __temp = self as Quest
RAD02Script kmyQuest = __temp as RAD02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(300)

; See if all the interviews have been done
kmyQuest.StoryCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Do you know about Nadia's offer - if so objective
if ( GetStageDone(50) )
  SetObjectiveDisplayed(400)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0499_Item_00
Function Fragment_Stage_0499_Item_00()
;BEGIN AUTOCAST TYPE RAD02Script
Quest __temp = self as Quest
RAD02Script kmyQuest = __temp as RAD02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(400)

; See if all the interviews have been done
kmyQuest.StoryCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Do you know about Nadia's offer - if so objective
if ( GetStageDone(50) )
  SetObjectiveDisplayed(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
; If Ron Hope wasn't killed - there is no news story
; So increment the Story Counter
if ( !GetStageDone(500) )
  RAD02_InterviewCount.Mod(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0599_Item_00
Function Fragment_Stage_0599_Item_00()
;BEGIN AUTOCAST TYPE RAD02Script
Quest __temp = self as Quest
RAD02Script kmyQuest = __temp as RAD02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(500)

; See if all the interviews have been done
kmyQuest.StoryCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Do you know about Nadia's offer - if so objective
if ( GetStageDone(50) )
  SetObjectiveDisplayed(600)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0699_Item_00
Function Fragment_Stage_0699_Item_00()
;BEGIN AUTOCAST TYPE RAD02Script
Quest __temp = self as Quest
RAD02Script kmyQuest = __temp as RAD02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(600)

; See if all the interviews have been done
kmyQuest.StoryCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Do you know about Nadia's offer - if so objective
if ( GetStageDone(50) )
  SetObjectiveDisplayed(600)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0799_Item_00
Function Fragment_Stage_0799_Item_00()
;BEGIN AUTOCAST TYPE RAD02Script
Quest __temp = self as Quest
RAD02Script kmyQuest = __temp as RAD02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(600)

; See if all the interviews have been done
kmyQuest.StoryCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8000_Item_00
Function Fragment_Stage_8000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(8000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8100_Item_00
Function Fragment_Stage_8100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
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

ReferenceAlias Property Alias_NadiaMuffaz Auto Const Mandatory

ReferenceAlias Property Alias_TommyBitlow Auto Const Mandatory

GlobalVariable Property RAD02_InterviewCount Auto Const Mandatory

Scene Property RAD02_0010_TommyWave Auto Const Mandatory

Quest Property City_NewAtlantis_Z_PrimarySources Auto Const Mandatory
