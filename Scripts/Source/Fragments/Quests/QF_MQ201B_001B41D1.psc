;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ201B_001B41D1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ101.CompleteQuest()
MQ102.CompleteQuest()
MQ104B.CompleteQuest()

Game.GetPlayer().AddPerk(StarshipEngineering)
Game.GetPlayer().AddPerk(Scanning)

Game.GetPlayer().MoveTo(LodgeStartMarker)
Alias_Vladimir.GetActorRef().moveto(MQ106_VladimirMarker01)

;player can now board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

MQ201.SetStage(120)
MQ201.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MQ201BScript
Quest __temp = self as Quest
MQ201BScript kmyQuest = __temp as MQ201BScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)
MQ201B_Eye_EnableMarker.Enable()

;check which companions are at risk
kmyquest.SetCompanionsAtRisk()

;set companion home link
kmyquest.SetCompanionsHomeLink()

;make sure the NG Plus quest variant options are also running
MQ404.Start()

SetActive()

Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()

;Constellation followers unavailable
(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(ActorToUpdate=AndrejaREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(ActorToUpdate=BarrettREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(ActorToUpdate=SamCoeREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(ActorToUpdate=SarahMorganREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)

(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=AndrejaREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=BarrettREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=SamCoeREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=SarahMorganREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)

DismissedCrew.RemoveRef(AndrejaREF)
DismissedCrew.RemoveRef(BarrettREF)
DismissedCrew.RemoveRef(SamCoeREF)
DismissedCrew.RemoveRef(SarahMorganREF)
DisembarkingCrew.RemoveRef(AndrejaREF)
DisembarkingCrew.RemoveRef(BarrettREF)
DisembarkingCrew.RemoveRef(SamCoeREF)
DisembarkingCrew.RemoveRef(SarahMorganREF)

;SF-13797 - remove COM objectives if active
if COM_Companion_Andreja.IsObjectiveDisplayed(10)
	COM_Companion_Andreja.SetObjectiveDisplayed(10, false)
endif
if COM_Companion_Barrett.IsObjectiveDisplayed(900)
	COM_Companion_Barrett.SetObjectiveDisplayed(900, false)
endif

if COM_Companion_SamCoe.IsObjectiveDisplayed(10)
	COM_Companion_SamCoe.SetObjectiveDisplayed(10, false)
endif
if COM_Companion_SamCoe.IsObjectiveDisplayed(798)
	COM_Companion_SamCoe.SetObjectiveDisplayed(798, false)
endif
if COM_Companion_SarahMorgan.IsObjectiveDisplayed(10)
	COM_Companion_SarahMorgan.SetObjectiveDisplayed(10, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(100)

;dismiss follower
Actor CompanionREF = Alias_Companion.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleInActive(Alias_Companion.GetActorRef())
Utility.Wait(0.1)
DismissedCrew.RemoveRef(CompanionREF)

Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
Actor VladimirREF= Alias_Vladimir.GetActorRef()

;move people if needed
If !AndrejaREF.IsInLocation(MQ201B_Marker_Andreja.GetCurrentLocation())
  AndrejaREF.moveto(MQ201B_Marker_Andreja)
EndIf

If !BarrettREF.IsInLocation(MQ201BMarker_Barrett.GetCurrentLocation())
  BarrettREF.moveto(MQ201BMarker_Barrett)
EndIf

If !SamCoeREF.IsInLocation(MQ201BMarker_Sam.GetCurrentLocation())
  SamCoeREF.moveto(MQ201BMarker_Sam)
EndIf

If !CoraCoeREF.IsInLocation(MQ201BMarker_Cora.GetCurrentLocation())
  CoraCoeREF.moveto(MQ201BMarker_Cora)
EndIf

If !SarahMorganREF.IsInLocation(MQ201B_Marker_Sarah.GetCurrentLocation())
  SarahMorganREF.moveto(MQ201B_Marker_Sarah)
EndIf

If !VladimirREF.IsInLocation(EyeVladimirMarker.GetCurrentLocation())
  VladimirREF.moveto(EyeVladimirMarker)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
MQ201B_01_AndrejaScene.Start()
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_BoxTrigger.GetRef().BlockActivation(True, True)
WwiseEvent_QST_MQ201_TextBox_ScannerRepair.Play(Game.GetPlayer())

MQ201B_BoxMSGSuccess.Show()
Utility.Wait(0.1)
MQ201B_02a_AndrejaScene_Success.Start()

SetObjectiveCompleted(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_01
Function Fragment_Stage_0030_Item_01()
;BEGIN CODE
Alias_BoxTrigger.GetRef().BlockActivation(True, True)
WwiseEvent_QST_MQ201_TextBox_ScannerRepair.Play(Game.GetPlayer())

MQ201B_BoxMSGFail.Show()
Utility.Wait(0.1)
MQ201B_02b_AndrejaScene_Fail.Start()

MQ201BSparksEnableMarker_Andreja.Enable()

;hide other objectives
SetObjectiveDisplayed(120, abdisplayed=False)
SetObjectiveDisplayed(130, abdisplayed=False)
SetObjectiveDisplayed(140, abdisplayed=False)
SetObjectiveDisplayed(150, abdisplayed=False)

SetObjectiveCompleted(100)
SetObjectiveCompleted(110)
SetObjectiveDisplayed(200)

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0042_Item_00
Function Fragment_Stage_0042_Item_00()
;BEGIN CODE
MQ201B_01_BarrettScene.Start()
SetObjectiveDisplayed(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
MQ201B_02a_BarrettScene_Success.Start()

SetObjectiveCompleted(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN CODE
MQ201B_02b_BarrettScene_Fail.Start()

MQ201BSparksEnableMarker_Barrett.Enable()

;hide other objectives
SetObjectiveDisplayed(120, abdisplayed=False)
SetObjectiveDisplayed(110, abdisplayed=False)
SetObjectiveDisplayed(140, abdisplayed=False)
SetObjectiveDisplayed(150, abdisplayed=False)

SetObjectiveCompleted(100)
SetObjectiveCompleted(130)
SetObjectiveDisplayed(200)

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
MQ201B_01_SamScene.Start()
SetObjectiveDisplayed(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_WelderTrigger.GetRef().BlockActivation(True, True)
WwiseEvent_QST_MQ201_TextBox_Welding.Play(Game.GetPlayer())
MQ201B_WelderingMSGSuccess.Show()
Utility.Wait(0.1)
MQ201B_02a_SamScene_Success.Start()
SetObjectiveCompleted(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_01
Function Fragment_Stage_0060_Item_01()
;BEGIN CODE
Alias_WelderTrigger.GetRef().BlockActivation(True, True)
WwiseEvent_QST_MQ201_TextBox_Welding.Play(Game.GetPlayer())
MQ201B_WelderingMSGFail.Show()
Utility.Wait(0.1)
MQ201B_02b_SamScene_Fail.Start()

MQ201BSparksEnableMarker_Sam.Enable()

;hide other objectives
SetObjectiveDisplayed(120, abdisplayed=False)
SetObjectiveDisplayed(130, abdisplayed=False)
SetObjectiveDisplayed(110, abdisplayed=False)
SetObjectiveDisplayed(150, abdisplayed=False)

SetObjectiveCompleted(100)
SetObjectiveCompleted(140)
SetObjectiveDisplayed(200)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0062_Item_00
Function Fragment_Stage_0062_Item_00()
;BEGIN CODE
MQ201B_01_SarahScene.Start()
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Alias_WrenchTrigger.GetRef().BlockActivation(True, True)
WwiseEvent_QST_MQ201_TextBox_WrenchSparks.Play(Game.GetPlayer())
MQ201B_WrenchMSGSuccess.Show()
Utility.Wait(0.1)
MQ201B_02a_SarahScene_Success.Start()
SetObjectiveCompleted(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_01
Function Fragment_Stage_0070_Item_01()
;BEGIN CODE
Alias_WrenchTrigger.GetRef().BlockActivation(True, True)
WwiseEvent_QST_MQ201_TextBox_WrenchSparks.Play(Game.GetPlayer())
MQ201B_WrenchMSGFail.Show()
Utility.Wait(0.1)
MQ201B_02b_SarahScene_Fail.Start()

MQ201BSparksEnableMarker_Sarah.Enable()

;hide other objectives
SetObjectiveDisplayed(120, abdisplayed=False)
SetObjectiveDisplayed(130, abdisplayed=False)
SetObjectiveDisplayed(140, abdisplayed=False)
SetObjectiveDisplayed(110, abdisplayed=False)

SetObjectiveCompleted(100)
SetObjectiveCompleted(150)
SetObjectiveDisplayed(200)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MQ00_CompanionAtEye.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE MQ201BScript
Quest __temp = self as Quest
MQ201BScript kmyQuest = __temp as MQ201BScript
;END AUTOCAST
;BEGIN CODE
Game.StopDialogueCamera()

CompleteAllObjectives()

MQ202.SetStage(10)

;reset companion home links
kmyquest.ResetCompanionsHomeLink()

;if any committment quests are active, locked in companion must re-follow
Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()

If COM_Quest_Andreja_Commitment.IsRunning() || COM_Quest_Andreja_Q01.IsRunning()
  (SQ_Companions as SQ_CompanionsScript).SetRoleActive(AndrejaREF)
  AndrejaREF.EvaluatePackage()
ElseIf COM_Quest_Barrett_Commitment.IsRunning() || COM_Quest_Barrett_Q01.IsRunning() || COM_Quest_Barrett_Q02.IsRunning()
  (SQ_Companions as SQ_CompanionsScript).SetRoleActive(BarrettREF)
  BarrettREF.EvaluatePackage()
ElseIf COM_Quest_SamCoe_Commitment.IsRunning() || COM_Quest_SamCoe_Q01.IsRunning()
  (SQ_Companions as SQ_CompanionsScript).SetRoleActive(SamCoeREF)
  SamCoeREF.EvaluatePackage()
ElseIf COM_Quest_SarahMorgan_Commitment.IsRunning() || COM_Quest_SarahMorgan_Q01.IsRunning()
  (SQ_Companions as SQ_CompanionsScript).SetRoleActive(SarahMorganREF)
  SarahMorganREF.EvaluatePackage()
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE MQ201BScript
Quest __temp = self as Quest
MQ201BScript kmyQuest = __temp as MQ201BScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

;reset companion home links
kmyquest.ResetCompanionsHomeLink()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MQ201B_Eye_EnableMarker Auto Const Mandatory

Scene Property MQ201B_01_SamScene Auto Const Mandatory

ReferenceAlias Property Alias_WelderTrigger Auto Const Mandatory

Scene Property MQ201B_01_BarrettScene Auto Const Mandatory

GlobalVariable Property COM_CompanionID_Andreja Auto Const Mandatory

GlobalVariable Property COM_CompanionID_Barrett Auto Const Mandatory

GlobalVariable Property COM_CompanionID_SamCoe Auto Const Mandatory

GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const Mandatory

GlobalVariable Property MQ_CompanionAtEye Auto Const Mandatory

Message Property MQ201B_BoxMSGSuccess Auto Const Mandatory

Message Property MQ201B_BoxMSGFail Auto Const Mandatory

Scene Property MQ201B_02a_AndrejaScene_Success Auto Const Mandatory

Scene Property MQ201B_02b_AndrejaScene_Fail Auto Const Mandatory

Scene Property MQ201B_01_SarahScene Auto Const Mandatory

Scene Property MQ201B_02a_SarahScene_Success Auto Const Mandatory

Scene Property MQ201B_02b_SarahScene_Fail Auto Const Mandatory

Message Property MQ201B_WrenchMSGFail Auto Const Mandatory

Message Property MQ201B_WrenchMSGSuccess Auto Const Mandatory

ReferenceAlias Property Alias_BoxTrigger Auto Const Mandatory

ReferenceAlias Property Alias_Computer Auto Const Mandatory

Scene Property MQ201B_02a_BarrettScene_Success Auto Const Mandatory

Scene Property MQ201B_02b_BarrettScene_Fail Auto Const Mandatory

Scene Property MQ201B_01_AndrejaScene Auto Const Mandatory

Message Property MQ201B_WelderingMSGSuccess Auto Const Mandatory

Scene Property MQ201B_02a_SamScene_Success Auto Const Mandatory

Message Property MQ201B_WelderingMSGFail Auto Const Mandatory

Scene Property MQ201B_02b_SamScene_Fail Auto Const Mandatory

ReferenceAlias Property Alias_WrenchTrigger Auto Const Mandatory

ReferenceAlias Property MQ00_CompanionAtEye Auto Const

ReferenceAlias Property Alias_Vladimir Auto Const Mandatory

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

ReferenceAlias Property Alias_CoraCoe Auto Const Mandatory

ReferenceAlias Property Alias_SarahMorgan Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const

ObjectReference Property MQ201B_Marker_Andreja Auto Const Mandatory

ObjectReference Property MQ201BMarker_Barrett Auto Const Mandatory

ObjectReference Property MQ201BMarker_Sam Auto Const Mandatory

ObjectReference Property MQ201BMarker_Cora Auto Const Mandatory

ObjectReference Property MQ201B_Marker_Sarah Auto Const Mandatory

Quest Property MQ202 Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

ObjectReference Property LodgeStartMarker Auto Const Mandatory

ObjectReference Property MQ106_VladimirMarker01 Auto Const Mandatory

Quest Property MQ201 Auto Const Mandatory

Perk Property Scanning Auto Const Mandatory

Perk Property StarshipEngineering Auto Const Mandatory

ObjectReference Property EyeVladimirMarker Auto Const Mandatory

ReferenceAlias Property MQ00_CompanionAtLodge Auto Const

GlobalVariable Property MQ_CompanionAtLodge Auto Const Mandatory

ReferenceAlias Property Alias_ResearchBench Auto Const Mandatory

Message Property MQ201B_ResearchMSGSuccess Auto Const Mandatory

Message Property MQ201B_ResearchMSGFail Auto Const Mandatory

Faction Property AvailableCompanionFaction Auto Const Mandatory

Faction Property EyeBoardingFaction Auto Const Mandatory

Quest Property MQ404 Auto Const Mandatory

Quest Property MQ104B Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

Quest Property SQ_Companions Auto Const Mandatory

ObjectReference Property MQ201BSparksEnableMarker_Andreja Auto Const Mandatory

ObjectReference Property MQ201BSparksEnableMarker_Barrett Auto Const Mandatory

ObjectReference Property MQ201BSparksEnableMarker_Sam Auto Const Mandatory

ObjectReference Property MQ201BSparksEnableMarker_Sarah Auto Const Mandatory

ReferenceAlias Property Alias_MQ00_CompanionAtEye Auto Const Mandatory

RefCollectionAlias Property DismissedCrew Auto Const

Quest Property SQ_Crew Auto Const Mandatory

RefCollectionAlias Property DisembarkingCrew Auto Const

Quest Property COM_Quest_Andreja_Commitment Auto Const Mandatory

Quest Property COM_Quest_Barrett_Commitment Auto Const Mandatory

Quest Property COM_Quest_SamCoe_Commitment Auto Const Mandatory

Quest Property COM_Quest_SarahMorgan_Commitment Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_MQ201_TextBox_ScannerRepair Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_MQ201_TextBox_Welding Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_MQ201_TextBox_WrenchSparks Auto Const Mandatory

Quest Property COM_Quest_Barrett_Q01 Auto Const Mandatory

Quest Property COM_Quest_Andreja_Q01 Auto Const Mandatory

Quest Property COM_Quest_SamCoe_Q01 Auto Const Mandatory

Quest Property COM_Quest_SarahMorgan_Q01 Auto Const Mandatory

Quest Property COM_Quest_Barrett_Q02 Auto Const Mandatory

Quest Property COM_Companion_Andreja Auto Const Mandatory

Quest Property Com_Companion_Barrett Auto Const Mandatory

Quest Property COM_Companion_SamCoe Auto Const Mandatory

Quest Property COM_Companion_SarahMorgan Auto Const Mandatory
