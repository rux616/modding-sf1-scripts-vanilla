;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNewAtlantis06_00089F4E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
City_NewAtlantis_Z_TheKindnessOfStrangers.SetStage(100)
City_NewAtlantis_Z_TheKindnessOfStrangers.SetStage(200)
FFNewAtlantis02.Stop()
SetStage(1)
Game.GetPlayer().MoveTo(Alias_SergeantYumi.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
If GetStageDone(4)
    SetObjectiveCompleted(88)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
If GetStageDone(3)
    SetObjectiveCompleted(88)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
FFNewAtlantis02Misc.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_Markkanen.GetRef().EnableNoWait()
Alias_NATenableMarker.GetRef().EnableNoWait()

ObjectReference SweepMarkerREF = Alias_OfficerSweepMarker.GetRef()
SweepMarkerREF.SetActorOwner(None)
Alias_OfficerSweep.GetActorRef().SnapIntoInteraction(SweepMarkerREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
SetObjectiveCompleted(89)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
FFNewAtlantis06_StartingScene01.Start()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SQ_Followers.SetRoleActive(Alias_Markkanen.GetActorRef())
Alias_Chair.GetRef().SetFactionOwner(FFNewAtlantis06Faction)
Alias_MastMarker.GetRef().EnableNoWait()
Alias_Book.GetRef().EnableNoWait()
Alias_Trucker.GetRef().EnableNoWait()
SetObjectiveCompleted(20)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
Alias_Vandal.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0046_Item_00
Function Fragment_Stage_0046_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(45)
Alias_Vandal.GetActorRef().EvaluatePackage()
Alias_Terminal.GetRef().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(45)
SetObjectiveDisplayed(50)
Alias_Vandal.GetRef().MoveTo(Alias_SergeantYumi.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)

Alias_TahirVala.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
Alias_SergeantYumi.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE DefaultFollowerToggleQuestScript
Quest __temp = self as Quest
DefaultFollowerToggleQuestScript kmyQuest = __temp as DefaultFollowerToggleQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(70)
FFNewAtlantis06_SpeechChallengeQuest.Start()

ObjectReference Gershon = Alias_Vandal.GetRef()
ObjectReference Marker = Alias_FunctionaryEndMarker.GetRef()

if Gershon.GetDistance(Marker) > 5
   Gershon.MoveTo(Marker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(90)
Alias_SuspectArrested.ForceRefTo(Alias_TahirVala.GetRef())
FFNewAtlantis06_Greet_TahirValaNoCamera.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0078_Item_00
Function Fragment_Stage_0078_Item_00()
;BEGIN CODE
FFNewAtlantis06_080_TL_Mark_Stage80.Stop()
FFNewAtlantis06_085_SC_TahirValaNoCameraEND.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0079_Item_00
Function Fragment_Stage_0079_Item_00()
;BEGIN CODE
ObjectReference PrisonDoorRef = Alias_PrisonDoor.GetRef()

PrisonDoorRef.SetOpen(False)
PrisonDoorRef.Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SQ_Followers.SetRoleInactive(Alias_Markkanen.GetActorRef())
FFNewAtlantis06_TL_Mark_Stage80.Start()
Alias_NATenableMarker.GetRef().DisableNoWait()
Alias_OfficerSweepMarker.GetRef().SetActorOwner(UC_NA_DonnaRain)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
Alias_TahirVala.GetActorRef().EvaluatePackage()
Alias_Markkanen.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0088_Item_00
Function Fragment_Stage_0088_Item_00()
;BEGIN CODE
If !GetStageDone(3) || !GetStageDone(4)
    SetObjectiveDisplayed(88)
else
    SetObjectiveDisplayed(89)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0089_Item_00
Function Fragment_Stage_0089_Item_00()
;BEGIN CODE
Actor VandalRef = Alias_Vandal.GetActorRef()
Actor MarkRef = Alias_Markkanen.GetActorRef()

SQ_Followers.SetRoleInactive(MarkRef)
Alias_SuspectArrested.ForceRefTo(VandalRef)
VandalRef.EvaluatePackage()
MarkRef.EvaluatePackage()
Alias_NATenableMarker.GetRef().DisableNoWait()
Alias_OfficerSweepMarker.GetRef().SetActorOwner(UC_NA_DonnaRain)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
Alias_Vandal.GetActorRef().SnapIntoInteraction(Alias_PrisonFunctionary.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Alias_Chair.GetRef().SetFactionOwner(None)
Alias_NATenableMarker.GetRef().DisableNoWait()
FFNewAtlantis06_SpeechChallengeQuest.Stop()
Alias_Trucker.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_Markkanen.GetRef().DisableNoWait()
Alias_TahirVala.GetRef().DisableNoWait()
Alias_Vandal.GetRef().DisableNoWait()
Alias_MastMarker.GetRef().DisableNoWait()
ObjectReference PrisonDoorRef = Alias_PrisonDoor.GetRef()
PrisonDoorRef.Lock(false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property FFNewAtlantis06_StartingScene01 Auto Const Mandatory

sq_followersscript Property SQ_Followers Auto Const Mandatory

ReferenceAlias Property Alias_Markkanen Auto Const Mandatory

ReferenceAlias Property Alias_NATenableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Chair Auto Const Mandatory

ReferenceAlias Property Alias_Vandal Auto Const Mandatory

Faction Property FFNewAtlantis06Faction Auto Const Mandatory

ReferenceAlias Property Alias_Terminal Auto Const Mandatory

Scene Property FFNewAtlantis06_TL_Functionary_Greet Auto Const Mandatory

ReferenceAlias Property Alias_MASTMarker Auto Const Mandatory

Quest Property City_NewAtlantis_Z_TheKindnessOfStrangers Auto Const Mandatory

ReferenceAlias Property Alias_TahirVala Auto Const Mandatory

Scene Property FFNewAtlantis06_TL_Mark_Stage60 Auto Const Mandatory

Scene Property FFNewAtlantis06_TL_Mark_Stage80 Auto Const Mandatory

ReferenceAlias Property Alias_OfficerSweepMarker Auto Const Mandatory

ActorBase Property UC_NA_DonnaRain Auto Const Mandatory

ReferenceAlias Property Alias_SergeantYumi Auto Const Mandatory

Scene Property FFNewAtlantis06_Greet_TahirValaNoCamera Auto Const Mandatory

Quest Property FFNewAtlantis06_SpeechChallengeQuest Auto Const Mandatory

ReferenceAlias Property Alias_SuspectArrested Auto Const Mandatory

ReferenceAlias Property Alias_OfficerSweep Auto Const Mandatory

ReferenceAlias Property Alias_Trucker Auto Const Mandatory

ReferenceAlias Property Alias_PrisonFunctionary Auto Const Mandatory

Quest Property FFNewAtlantis02Misc Auto Const Mandatory

Quest Property FFNewAtlantis02 Auto Const Mandatory

ReferenceAlias Property Alias_PrisonDoor Auto Const Mandatory

ReferenceAlias Property Alias_FunctionaryEndMarker Auto Const Mandatory

ReferenceAlias Property Alias_MarkannenMarker Auto Const Mandatory

ReferenceAlias Property Alias_Book Auto Const Mandatory

Scene Property FFNewAtlantis06_085_SC_TahirValaNoCameraEND Auto Const Mandatory

Scene Property FFNewAtlantis06_080_TL_Mark_Stage80 Auto Const Mandatory
