;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Akila_Ashta03_00212B4E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_Keoni.GetReference().MoveTo(Alias_PlayerStartMarker.GetReference())
Alias_Keoni.GetActorReference().EvaluatePackage()
Game.GetPlayer().MoveTo(Alias_PlayerStartMarker.GetReference())
SetStage(5)
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Enable Keoni - mainly for debugging - she should already be enabled
Actor aTarg = Alias_Keoni.GetActorRef()
aTarg.Enable()

; Make it so the Bailey city life scene is now closed off
; (Technically this isn't required, but it's much easy for playtest)
DialogueFCAkilaCity.SetStage(2015)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE City_Akila_Ashta02_Script
Quest __temp = self as Quest
City_Akila_Ashta02_Script kmyQuest = __temp as City_Akila_Ashta02_Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(5)

; Use the function to track time for 24 hours
kmyQuest.Wait24()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveCompleted(7)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(20)
  SetObjectiveCompleted(20)
else
  SetObjectiveCompleted(10)
endif

SetObjectiveDisplayed(30)
Alias_Davis.GetActorReference().EvaluatePackage()
DavisPatrolScene1.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
Alias_Davis.GetActorReference().EvaluatePackage()
DavisPatrolScene2.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
; So if Davis is given a premonition warning from the player
;   he's more cautious, which means he'll live no matter what.
Alias_Davis.GetActorRef().SetEssential(TRUE)

; Then flag the quest to proceed
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
; Shake the camera a lot - things are about to get real
Game.ShakeCamera(afStrength = 0.85, afDuration = 2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(100)
SetObjectiveDisplayed(110)
Alias_AlphaAshta.GetReference().Enable()
Alias_AlphaAshta.GetActorRef().StartCombat(Game.GetPlayer())

; Flag Davis as being unessential
if ( !GetStageDone(35) )   ; Only if he didn't get premonition
  Alias_Davis.GetActorRef().SetEssential(FALSE)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveFailed(110)

; Flag that Davis has died - for NewGame+
Game.GetPlayer().SetValue(Ashta03_Foreknowledge_DavisDiesAV, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)

if ( GetStageDone(110) )
  ; This is the Davis is dead branch
  SetObjectiveDisplayed(160)  
else
  ; Flag Davis as being essential again
  Alias_Davis.GetActorRef().SetEssential(TRUE) 

  ; Flag that Davis has survived
  SetObjectiveCompleted(110)
  SetObjectiveDisplayed(150)

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(160)
Alias_Davis.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
Alias_Keoni.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;Show the message that the ashta head is available
City_Akila_Ashta_03_BuildRewardMsg.Show()

; Flag that the player has done this quest for New Game+
Game.GetPlayer().SetValue(Ashta03_Foreknowledge_CompletedQuestAV, 1.0)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_AlphaAshta Auto Const Mandatory

ReferenceAlias Property Alias_Davis Auto Const Mandatory

Scene Property DavisPatrolScene1 Auto Const

Scene Property DavisPatrolScene2 Auto Const

ReferenceAlias Property Alias_Keoni Auto Const Mandatory

ReferenceAlias Property Alias_PlayerStartMarker Auto Const Mandatory

Keyword Property AnimArchetypeDepressed Auto Const Mandatory

ActorValue Property Ashta03_Foreknowledge_DavisDiesAV Auto Const Mandatory

ActorValue Property Ashta03_Foreknowledge_CompletedQuestAV Auto Const Mandatory

Quest Property DialogueFCAkilaCity Auto Const Mandatory

Message Property City_Akila_Ashta_03_BuildRewardMsg Auto Const Mandatory
