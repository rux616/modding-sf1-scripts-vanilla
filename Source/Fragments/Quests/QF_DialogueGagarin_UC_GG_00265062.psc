;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueGagarin_UC_GG_00265062 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().AddPerk(BackgroundHunter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().AddPerk(BackgroundExplorer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DialogueGagarin_GG_IntroScene_TakeTwo.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Dalitso.GetActorRef().EvaluatePackage()
Utility.Wait(1.0)
Alias_Lawan.GetActorRef().EvaluatePackage()
Utility.Wait(0.5)
Alias_Bonifac.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
UC_GG_Bet_PlayerNegotiatedBonus.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(UC_GG_Bet_Liquor, 1)
SetStage(220)
City_GG_Bet.SetStage(100)
Utility.Wait(1.0)
City_GG_Bet.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
if DialogueGagarin_GG_IntroScene_TakeTwo.IsPlaying()
  DialogueGagarin_GG_IntroScene_TakeTwo.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1101_Item_00
Function Fragment_Stage_1101_Item_00()
;BEGIN CODE
SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1102_Item_00
Function Fragment_Stage_1102_Item_00()
;BEGIN CODE
SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1103_Item_00
Function Fragment_Stage_1103_Item_00()
;BEGIN CODE
SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1205_Item_00
Function Fragment_Stage_1205_Item_00()
;BEGIN CODE
Alias_DalitsoPoster.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1215_Item_00
Function Fragment_Stage_1215_Item_00()
;BEGIN CODE
Alias_KealaPoster.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1225_Item_00
Function Fragment_Stage_1225_Item_00()
;BEGIN CODE
Alias_LizziePoster.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DialogueGagarin_GG_IntroScene_TakeTwo Auto Const Mandatory

ReferenceAlias Property Alias_Dalitso Auto Const Mandatory

ReferenceAlias Property Alias_Bonifac Auto Const Mandatory

ReferenceAlias Property Alias_Lawan Auto Const Mandatory

Perk Property BackgroundHunter Auto Const Mandatory

GlobalVariable Property UC_GG_Bet_PlayerNegotiatedBonus Auto Const Mandatory

Quest Property City_GG_Bet Auto Const Mandatory

MiscObject Property UC_GG_Bet_Liquor Auto Const Mandatory

Perk Property BackgroundExplorer Auto Const Mandatory

ReferenceAlias Property Alias_DalitsoPoster Auto Const Mandatory

ReferenceAlias Property Alias_EllieYankton Auto Const Mandatory

ReferenceAlias Property Alias_KealaPoster Auto Const Mandatory

ReferenceAlias Property Alias_LizziePoster Auto Const Mandatory
