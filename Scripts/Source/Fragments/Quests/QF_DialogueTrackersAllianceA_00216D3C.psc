;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueTrackersAllianceA_00216D3C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_TrackersAllianceAgent.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_TrackersAllianceAgentNeon.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_TrackersAllianceAgentCydonia.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_TrackersAllianceAgentNewAtlantis.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
RAD04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
Alias_TrackersAllianceAgent.GetRef().SetValue(RAD04_TrackerGaveQuest, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0202_Item_00
Function Fragment_Stage_0202_Item_00()
;BEGIN CODE
Alias_TrackersAllianceAgentNeon.GetRef().SetValue(RAD04_TrackerGaveQuest, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0203_Item_00
Function Fragment_Stage_0203_Item_00()
;BEGIN CODE
Alias_TrackersAllianceAgentCydonia.GetRef().SetValue(RAD04_TrackerGaveQuest, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0204_Item_00
Function Fragment_Stage_0204_Item_00()
;BEGIN CODE
Alias_TrackersAllianceAgentNewAtlantis.GetRef().SetValue(RAD04_TrackerGaveQuest, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0211_Item_00
Function Fragment_Stage_0211_Item_00()
;BEGIN CODE
Alias_TrackersAllianceAgent.GetRef().SetValue(RAD04_TrackerGaveQuest, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0212_Item_00
Function Fragment_Stage_0212_Item_00()
;BEGIN CODE
Alias_TrackersAllianceAgentNeon.GetRef().SetValue(RAD04_TrackerGaveQuest, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0213_Item_00
Function Fragment_Stage_0213_Item_00()
;BEGIN CODE
Alias_TrackersAllianceAgentCydonia.GetRef().SetValue(RAD04_TrackerGaveQuest, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0214_Item_00
Function Fragment_Stage_0214_Item_00()
;BEGIN CODE
Alias_TrackersAllianceAgentNewAtlantis.GetRef().SetValue(RAD04_TrackerGaveQuest, 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TrackersAllianceAgent Auto Const Mandatory

Quest Property RAD04 Auto Const Mandatory

ReferenceAlias Property Alias_TrackersAllianceAgentNeon Auto Const Mandatory

ReferenceAlias Property Alias_TrackersAllianceAgentNewAtlantis Auto Const Mandatory

ReferenceAlias Property Alias_TrackersAllianceAgentCydonia Auto Const Mandatory

ActorValue Property RAD04_TrackerGaveQuest Auto Const Mandatory
