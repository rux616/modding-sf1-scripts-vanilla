;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNewAtlantis01_0024C3A1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor ChisolmRef = Alias_RepresentativeChisolm.GetActorRef()
Actor GuardRef = Alias_Guard01.GetActorRef()

ChisolmRef.EnableNoWait()
GuardRef.MoveTo(ChisolmRef)
GuardRef.EvaluatePackage()
Alias_OfficerWilkes.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
ObjectReference ChisolmRef = Alias_RepresentativeChisolm.GetRef()
ObjectReference WilkesRef = Alias_OfficerWilkes.GetRef()

if IsObjectiveDisplayed(5) || IsObjectiveDisplayed(10) || !GetStageDone(10)
    WilkesRef.DisableNoWait()
    ChisolmRef.DisableNoWait()
    Alias_Trigger.GetRef().DisableNoWait()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
ObjectReference ChisolmRef = Alias_RepresentativeChisolm.GetRef()
ObjectReference WilkesRef = Alias_OfficerWilkes.GetRef()

if IsObjectiveDisplayed(5) || IsObjectiveDisplayed(10) || !GetStageDone(10)
    WilkesRef.EnableNoWait()
    ChisolmRef.EnableNoWait()
    Alias_Trigger.GetRef().EnableNoWait()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Alias_RepresentativeChisolm.GetRef().DisableNoWait()
Alias_OfficerWilkes.GetRef().DisableNoWait()
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetObjectiveFailed(10)
Alias_RepresentativeChisolm.GetRef().DisableNoWait()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5, false)
SetObjectiveSkipped(10)
SetObjectiveDisplayed(5, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
FFNewAtlantis01_001_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_Guard01.GetActorRef().EvaluatePackage()
Alias_OfficerWilkes.GetActorRef().EvaluatePackage()

;pop misc pointer
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
FFNewAtlantis01Misc.SetStage(100)
SetObjectiveDisplayed(10)
Alias_Radcliff.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, 50)
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN CODE
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0036_Item_00
Function Fragment_Stage_0036_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, CreditsRewardMinorExtortion.GetValueInt())
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10, abDisplayed=False)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Misc_01_Small)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Alias_RepresentativeChisolm.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_RepresentativeChisolm.GetRef().MoveTo(Alias_RadcliffChairMeetingRoom.GetRef())
Alias_OfficerWilkes.GetRef().DisableNoWait()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DialogueUCNewAtlantisSpaceportIntro_001_Scene Auto Const Mandatory

Scene Property FFNewAtlantis01_001_Scene Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Quest Property FFNewAtlantis01Misc Auto Const Mandatory

ReferenceAlias Property Alias_RepresentativeChisolm Auto Const Mandatory

ReferenceAlias Property Alias_OfficerWilkes Auto Const Mandatory

ReferenceAlias Property Alias_Guard01 Auto Const Mandatory

ReferenceAlias Property Alias_Radcliff Auto Const Mandatory

Quest Property UC04 Auto Const Mandatory

ReferenceAlias Property Alias_RadcliffChairMeetingRoom Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Misc_01_Small Auto Const Mandatory

ReferenceAlias Property Alias_Trigger Auto Const Mandatory

GlobalVariable Property CreditsRewardMinorExtortion Auto Const Mandatory
