;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ206B_002583F2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()
MQ204.SetStage(620)

PlayerREF.AddPerk(TraitRaisedUniversal)
PlayerREF.AddPerk(TraitRaisedEnlightened)
PlayerREF.AddPerk(TraitSerpentsEmbrace)
PlayerREF.moveto(LodgeStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()

SetStage(100)
SetStage(130)
SetStage(140)
SetStage(200)

PlayerREF.AddPerk(TraitRaisedUniversal)
PlayerREF.AddPerk(TraitRaisedEnlightened)
PlayerREF.AddPerk(TraitSerpentsEmbrace)

PlayerREF.moveto(MQ206B_Quickstart1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()

SetStage(500)
SetStage(600)
SetStage(670)
SetStage(680)

Game.GetPlayer().moveto(LC134Start)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().moveto(MQ206B_Hyla_PlayerMarker)
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;enable Varuun prisoner
Alias_Mirza.GetActorRef().Enable()

;enable scorpius puzzle
MQ206BPuzzleEnableMarker.Enable()

;enable scorpius map marker
ScorpiusPuzzleMapMarkerREF.Enable()

;enable pilgrim rest map marker
PilgrimsRestMapMarkerREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_MatteoKhatri.GetActorREf().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_MatteoKhatri.GetActorREf().moveto(MQ206B_MatteoMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;complete the previous quest
MQ204.SetStage(1000)

;complete the NA state change from MQ204
MQ204_NA_StateChangeHandler.SetStageNoWait(100)

SetObjectiveDisplayed(10)

Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
MatteoREF.EvaluatePackage()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
City_NA_Aquilus01.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

Actor KeeperAquilusREF = Alias_KeeperAquilus.GetActorRef()
Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
KeeperAquilusREF.EvaluatePackage()
MatteoREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

Actor KeeperAquilusREF = Alias_KeeperAquilus.GetActorRef()
Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
KeeperAquilusREF.moveto(MQ206B_AquilusTravelMarker01)
MatteoREF.moveto(MQ206B_MatteoTravelMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
MQ206B_004_Inside.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
SetObjectiveDisplayed(50)

;matteo stops following

MQ206B_004b_Matteo.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Game.GetPlayer().additem(MQ206B_UniversalGift)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
Game.GetPlayer().additem(MQ206B_EnlightenedGift)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
Game.GetPlayer().Additem(MQ206B_VaruunGift)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)

If GetStageDone(400)
  SetStage(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)

If GetStageDone(300)
  SetStage(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(60)

;move Matteo back
Alias_MatteoKhatri.GetActorRef().moveto(LodgeStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0655_Item_00
Function Fragment_Stage_0655_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
SetObjectiveCompleted(74)
SetObjectiveCompleted(75)
SetObjectiveDisplayed(77)

ObjectReference PilgrimDoorREF = Alias_PilgrimDoor.GetRef()
PilgrimDoorREF.Lock(False)
PilgrimDoorREF.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0670_Item_00
Function Fragment_Stage_0670_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveCompleted(70)
SetObjectiveDisplayed(72)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN CODE
SetObjectiveCompleted(72)
SetObjectiveDisplayed(74)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
SetObjectiveCompleted(77)
SetObjectiveDisplayed(79)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetStage(690) ;make sure you're considered to have picked the book up

SetObjectiveCompleted(79)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
Alias_HylaBoss.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(80, abForce=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)

;MQ207 starts up in the background so that ships are enabled
MQ207.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(90)

;MQ207 starts up in the background so that ships are enabled
MQ207.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
MQ207.SetStage(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3000_Item_00
Function Fragment_Stage_3000_Item_00()
;BEGIN CODE
;disable Varuun prisoner
Alias_Mirza.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ206B_001_IntroScene Auto Const Mandatory

Scene Property MQ206B_003_KeeperAquilus Auto Const Mandatory

ObjectReference Property LodgeStartMarker Auto Const Mandatory

ReferenceAlias Property Alias_MatteoKhatri Auto Const Mandatory

Quest Property SQ_Companions Auto Const Mandatory

ReferenceAlias Property Alias_KeeperAquilus Auto Const Mandatory

ObjectReference Property MQ206B_AquilusTravelMarker01 Auto Const Mandatory

ObjectReference Property MQ206B_MatteoTravelMarker01 Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

Scene Property MQ206B_002_AquilusMatteoScene Auto Const Mandatory

Quest Property MQ204 Auto Const Mandatory

Quest Property SQ_Followers Auto Const Mandatory

Scene Property MQ206B_004b_Matteo Auto Const Mandatory

ObjectReference Property MQ206B_MatteoMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_Mirza Auto Const Mandatory

Quest Property MQ207 Auto Const Mandatory

ReferenceAlias Property Alias_PilgrimDoor Auto Const Mandatory

ObjectReference Property MQ206B_Quickstart1 Auto Const Mandatory

ObjectReference Property LC134Start Auto Const Mandatory

Perk Property TraitRaisedUniversal Auto Const Mandatory

Perk Property TraitRaisedEnlightened Auto Const Mandatory

Perk Property TraitSerpentsEmbrace Auto Const Mandatory

Quest Property City_NA_Aquilus01 Auto Const Mandatory

LeveledItem Property MQ206B_UniversalGift Auto Const Mandatory

LeveledItem Property MQ206B_EnlightenedGift Auto Const Mandatory

LeveledItem Property MQ206B_VaruunGift Auto Const Mandatory

ObjectReference Property MQ206B_Hyla_PlayerMarker Auto Const Mandatory

ReferenceAlias Property Alias_HylaBoss Auto Const Mandatory

ObjectReference Property MQ206BPuzzleEnableMarker Auto Const Mandatory

Scene Property MQ206B_004_Inside Auto Const Mandatory

ObjectReference Property ScorpiusPuzzleMapMarkerREF Auto Const Mandatory

ObjectReference Property PilgrimsRestMapMarkerREF Auto Const Mandatory

Quest Property MQ204_NA_StateChangeHandler Auto Const Mandatory
