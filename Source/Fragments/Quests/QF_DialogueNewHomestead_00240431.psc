;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueNewHomestead_00240431 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_Bill.GetRef().MoveTo(Alias_BillIntroMarker.GetRef())
Alias_Giuliana.GetRef().MoveTo(Alias_GiulianaIntroMarker.GetRef())
DialogueNewHomestead_EstablishingScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
FFNewHomesteadR04MiscQuestStartKeyword.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DialogueNewHomestead_GreeterGuard_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
FFNewHomesteadZ00Misc.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.MoveTo(Alias_Bill.GetRef())
DialogueNewHomestead_EstablishingScene01.Stop()
SetStage(15)
SetStage(20)
myPlayer.AddItem(Credits, 10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
If !FFNewHomesteadZ01.IsRunning() && !FFNewHomesteadZ01.IsCompleted()
	FFNewHomesteadZ01Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
If !GetStageDone(120)
	myPlayer.RemoveItem(Credits, FFNewHomesteadZ01_TourPrice.GetValue() as Int)
EndIf
FFNewHomesteadZ01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
DialogueNewHomestead_EstablishingScene01.Stop()
Game.GetPlayer().MoveTo(Alias_Giuliana.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
If !FFNewHomesteadR02.IsRunning() && !FFNewHomesteadR02.IsCompleted()
	FFNewHomesteadR02Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0202_Item_00
Function Fragment_Stage_0202_Item_00()
;BEGIN CODE
FFNewHomesteadR02QuestStartKeyword.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Joyce.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN CODE
If !FFNewHomesteadR04.IsRunning() && !FFNewHomesteadR04.IsCompleted()
	FFNewHomesteadR04Misc.SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0402_Item_00
Function Fragment_Stage_0402_Item_00()
;BEGIN CODE
FFNewHomesteadR04QuestStartKeyword.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0411_Item_00
Function Fragment_Stage_0411_Item_00()
;BEGIN CODE
FFNewHomesteadR04QuestStartKeyword.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0413_Item_00
Function Fragment_Stage_0413_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Cutter)
FFNewHomesteadR04QuestStartKeyword.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Luthor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0501_Item_00
Function Fragment_Stage_0501_Item_00()
;BEGIN CODE
If !FFNewHomesteadR05.IsRunning() && !FFNewHomesteadR05.IsCompleted()
	FFNewHomesteadR05Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0502_Item_00
Function Fragment_Stage_0502_Item_00()
;BEGIN CODE
FFNewHomesteadR05QuestStartKeyword.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0599_Item_00
Function Fragment_Stage_0599_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(FFNewHomesteadR05_Foreknowledge_AV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1610_Item_00
Function Fragment_Stage_1610_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(NH_SouvenirSlate, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1711_Item_00
Function Fragment_Stage_1711_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NH_AdrianCredits.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DialogueNewHomestead_EstablishingScene01 Auto Const Mandatory

ReferenceAlias Property Alias_Bill Auto Const Mandatory

ReferenceAlias Property Alias_Giuliana Auto Const Mandatory

ReferenceAlias Property Alias_BillIntroMarker Auto Const Mandatory

ReferenceAlias Property Alias_GiulianaIntroMarker Auto Const Mandatory

Quest Property FFNewHomesteadR04 Auto Const Mandatory

ReferenceAlias Property Alias_Joyce Auto Const Mandatory

ReferenceAlias Property Alias_Luthor Auto Const Mandatory

Quest Property FFNewHomesteadR02Misc Auto Const Mandatory

Quest Property FFNewHomesteadR02 Auto Const Mandatory

Quest Property FFNewHomesteadR04Misc Auto Const Mandatory

Quest Property FFNewHomesteadR05Misc Auto Const Mandatory

Quest Property FFNewHomesteadR05 Auto Const Mandatory

Keyword Property FFNewHomesteadR02QuestStartKeyword Auto Const Mandatory

Keyword Property FFNewHomesteadR04QuestStartKeyword Auto Const Mandatory

Keyword Property FFNewHomesteadR05QuestStartKeyword Auto Const Mandatory

Weapon Property Cutter Auto Const Mandatory

ActorValue Property FFNewHomesteadR05_Foreknowledge_AV Auto Const Mandatory

Quest Property FFNewHomesteadZ01Misc Auto Const Mandatory

Quest Property FFNewHomesteadZ01 Auto Const Mandatory

Keyword Property FFNewHomesteadZ01QuestStartKeyword Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property FFNewHomesteadZ01_TourPrice Auto Const Mandatory

Quest Property FFNewHomesteadZ00Misc Auto Const Mandatory

Scene Property DialogueNewHomestead_GreeterGuard_IntroScene Auto Const Mandatory

Book Property NH_SouvenirSlate Auto Const Mandatory

Keyword Property FFNewHomesteadR04MiscQuestStartKeyword Auto Const Mandatory

GlobalVariable Property NH_AdrianCredits Auto Const Mandatory
