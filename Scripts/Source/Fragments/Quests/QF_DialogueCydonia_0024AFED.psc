;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueCydonia_0024AFED Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Move Trevor, set a stage to bypass the establishing scene and 
;start his package, then move the player to Trevor
Actor myPlayer = Game.GetPlayer()
ObjectReference myTrevor = TrevorPetyarre.GetRef()
ObjectReference myTrevorMarker = Alias_TrevorMarker.GetRef()

SetStage(11)

myPlayer.MoveTo(myTrevorMarker)
myPlayer.AddPerk(TRAIT_Extrovert)
myPlayer.AddPerk(BackgroundIndustrialist)

myTrevor.MoveTo(myTrevorMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(DenisAverin.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(DenisAverin.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.MoveTo(MitchBenjamin.GetRef())
myPlayer.AddItem(Credits, 10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(ReneeShelby.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Completes the prerequisite quest
City_CY_RedTape03.SetStage(1000)

Game.GetPlayer().MoveTo(RivkahOvadia.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_GillySeong.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_JaneWeller.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
;Completes the prerequisite quest
City_CY_RedTape03.SetStage(1000)

Game.GetPlayer().MoveTo(Alias_LaylahPulaski.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_TrackerAgent.GetRef())

;Completes the prerequisite quest
RAD04.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Don't play this scene if the player is using debug stage 0
If !GetStageDone(0)
	DialogueCydonia_EstablishingScene01.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
TrevorPetyarre.GetActorRef().EvaluatePackage()
DialogueCydonia_EstablishingScene02.Start()
City_CY_RedTape01_Misc.Start()

DialogueCydonia_Detonation_Helper.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
TrevorPetyarre.GetRef().MoveTo(Alias_SupervisorIntroMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
If !City_CY_Runaway01.IsRunning() && !City_CY_Runaway01.IsCompleted()
	City_CY_Runaway01_Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
If CY_DetonationCountConditionForm.IsTrue()
	DialogueCydoniaDetonationQuestStartKeyword.SendStoryEventAndWait()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_SaoirseBowden.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DialogueCydonia_RedEyes.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;The topic checks for the credits amount before displaying 
;it as an option to make sure the player has enough.
Game.GetPlayer().RemoveItem(Credits, CY_Anna_CreditsAmount.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0212_Item_00
Function Fragment_Stage_0212_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, CY_Hurst_Donation.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(City_CY_RedTape02_HurstNote)
City_CY_RedTape02_Blackmail.SetStage(1000)

;Hurst will be disabled when the player unloads, per 
;DialogueCydoniaHurstAliasScript.
;This will also set CY_HurstGone to 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0801_Item_00
Function Fragment_Stage_0801_Item_00()
;BEGIN CODE
UC_PlayerKnows_RedDevils.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
FFCydoniaZ04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0902_Item_00
Function Fragment_Stage_0902_Item_00()
;BEGIN CODE
If !FFCydoniaZ04.IsRunning() && !FFCydoniaZ04.IsCompleted()
	FFCydoniaZ04Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1002_Item_00
Function Fragment_Stage_1002_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(FFCydoniaR03_Foreknowledge_BooksAV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
City_CY_RedTape01_Misc.SetStage(1000)
City_CY_RedTape01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1130_Item_00
Function Fragment_Stage_1130_Item_00()
;BEGIN AUTOCAST TYPE DialogueCydoniaQuestScript
Quest __temp = self as Quest
DialogueCydoniaQuestScript kmyQuest = __temp as DialogueCydoniaQuestScript
;END AUTOCAST
;BEGIN CODE
Alias_OldMiningEquipment.DisableAll()
kmyQuest.SwapCutters()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
FFCydoniaZ01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
City_CY_Runaway01_Misc.SetStage(1000)
City_CY_Runaway01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1302_Item_00
Function Fragment_Stage_1302_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Aid_MedPack, 1, false, RivkahOvadia.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(City_CY_Runaway01_Foreknowledge_RivkahSickAV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1320_Item_00
Function Fragment_Stage_1320_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(City_CY_Runaway01_Whiskey, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1321_Item_00
Function Fragment_Stage_1321_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(City_CY_Runaway01_Whiskey, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
City_CY_Psych01.Start()
Game.GetPlayer().SetValue(City_CY_Psych01_Foreknowledge_AV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1402_Item_00
Function Fragment_Stage_1402_Item_00()
;BEGIN CODE
If !City_CY_Psych01Misc.IsRunning() && !City_CY_Psych01.IsRunning() && !City_CY_Psych01Misc.IsCompleted() && !City_CY_Psych01.IsRunning()
	City_CY_Psych01Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
City_CY_StartUp01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1501_Item_00
Function Fragment_Stage_1501_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1550_Item_00
Function Fragment_Stage_1550_Item_00()
;BEGIN CODE
DialogueCydonia_ErickJane_NoShip.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1700_Item_00
Function Fragment_Stage_1700_Item_00()
;BEGIN CODE
RAD03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1800_Item_00
Function Fragment_Stage_1800_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2301_Item_00
Function Fragment_Stage_2301_Item_00()
;BEGIN CODE
UC_PlayerKnows_RedDevils.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2400_Item_00
Function Fragment_Stage_2400_Item_00()
;BEGIN CODE
FFCydoniaZ07Misc.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2405_Item_00
Function Fragment_Stage_2405_Item_00()
;BEGIN CODE
If !FFCydoniaZ07.IsRunning() && !FFCydoniaZ07.IsCompleted()
	FFCydoniaZ07Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2410_Item_00
Function Fragment_Stage_2410_Item_00()
;BEGIN CODE
FFCydoniaZ07.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2500_Item_00
Function Fragment_Stage_2500_Item_00()
;BEGIN CODE
If !FFCydoniaZ08.IsRunning() && !FFCydoniaZ08.IsCompleted()
	FFCydoniaZ08Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2510_Item_00
Function Fragment_Stage_2510_Item_00()
;BEGIN CODE
FFCydoniaZ08.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2600_Item_00
Function Fragment_Stage_2600_Item_00()
;BEGIN CODE
Utility.Wait(1)
TrevorPetyarre.GetRef().Say(DialogueCydonia_Trevor_City_CY_Runaway01_Topic)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property CY_Anna_CreditsAmount Auto Const Mandatory

LeveledItem Property LL_CY_HorusGift Auto Const Mandatory

Scene Property DialogueCydonia_EstablishingScene01 Auto Const Mandatory

Quest Property FFCydoniaZ04 Auto Const Mandatory

ReferenceAlias Property ReneeShelby Auto Const Mandatory

ReferenceAlias Property MitchBenjamin Auto Const Mandatory

Quest Property City_CY_RedTape01 Auto Const Mandatory

ReferenceAlias Property TrevorPetyarre Auto Const Mandatory

Book Property City_CY_RedTape02_HurstNote Auto Const Mandatory

GlobalVariable Property CY_HurstGone Auto Const Mandatory

ReferenceAlias Property DenisAverin Auto Const Mandatory

Quest Property FFCydoniaZ01 Auto Const Mandatory

ReferenceAlias Property RivkahOvadia Auto Const Mandatory

Quest Property City_CY_Runaway01 Auto Const Mandatory

ReferenceAlias Property Alias_GillySeong Auto Const Mandatory

Quest Property City_CY_Psych01 Auto Const Mandatory

ReferenceAlias Property Alias_JaneWeller Auto Const Mandatory

Quest Property City_CY_StartUp01 Auto Const Mandatory

GlobalVariable Property DialogueCydonia_RedEyes Auto Const Mandatory

ReferenceAlias Property Alias_SupervisorIntroMarker Auto Const Mandatory

GlobalVariable Property CY_Hurst_Donation Auto Const Mandatory

Potion Property Aid_MedPack Auto Const Mandatory

Quest Property City_CY_Psych01Misc Auto Const Mandatory

ReferenceAlias Property Alias_TrevorMarker Auto Const Mandatory

MiscObject Property City_CY_Runaway01_Whiskey Auto Const Mandatory

Scene Property DialogueCydonia_Rivkah_Greeting_CityCYRunaway01_Start Auto Const Mandatory

Quest Property City_CY_RedTape03 Auto Const Mandatory

Quest Property FFCydoniaZ04Misc Auto Const Mandatory

Quest Property RAD03 Auto Const Mandatory

ReferenceAlias Property Alias_SaoirseBowden Auto Const Mandatory

Scene Property DialogueCydonia_EstablishingScene02 Auto Const Mandatory

Quest Property City_CY_RedTape01_Misc Auto Const Mandatory

Perk Property TRAIT_Extrovert Auto Const Mandatory

Perk Property BackgroundIndustrialist Auto Const Mandatory

Quest Property City_CY_RedTape02_Blackmail Auto Const Mandatory

ReferenceAlias Property Alias_TiaWu Auto Const Mandatory

Topic Property DialogueCydonia_Psych01_Tia_OverhearTopic Auto Const Mandatory

Quest Property City_CY_Runaway01_Misc Auto Const Mandatory

ActorValue Property City_CY_Runaway01_Foreknowledge_RivkahSickAV Auto Const Mandatory

ActorValue Property FFCydoniaR03_Foreknowledge_BooksAV Auto Const Mandatory

Scene Property DialogueCydonia_ErickJane_NoShip Auto Const Mandatory

GlobalVariable Property UC_PlayerKnows_RedDevils Auto Const Mandatory

ActorValue Property City_CY_Psych01_Foreknowledge_AV Auto Const Mandatory

ReferenceAlias Property Alias_LaylahPulaski Auto Const Mandatory

Quest Property FFCydoniaZ07 Auto Const Mandatory

Quest Property FFCydoniaZ07Misc Auto Const Mandatory

Quest Property FFCydoniaZ08Misc Auto Const Mandatory

Quest Property FFCydoniaZ08 Auto Const Mandatory

Quest Property RAD04 Auto Const Mandatory

ReferenceAlias Property Alias_TrackerAgent Auto Const Mandatory

RefCollectionAlias Property Alias_OldMiningEquipment Auto Const Mandatory

Keyword Property DialogueCydoniaDetonationQuestStartKeyword Auto Const Mandatory

ConditionForm Property CY_DetonationCountConditionForm Auto Const Mandatory

Quest Property DialogueCydonia_Detonation_Helper Auto Const Mandatory

RefCollectionAlias Property Alias_AllMiners Auto Const Mandatory

Topic Property DialogueCydonia_Trevor_City_CY_Runaway01_Topic Auto Const Mandatory
