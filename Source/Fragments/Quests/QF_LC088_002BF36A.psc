;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC088_002BF36A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE LC088QuestScript
Quest __temp = self as Quest
LC088QuestScript kmyQuest = __temp as LC088QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quickstart
;Space Combat Testing Quickstart.

;Jump to the CF08 Fleet space battle and skip the dialogue.
kMyQuest.QuickstartSpace(33)
LC088_Space.SetStage(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Startup Stage

;To simplify testing:
;Set the standard Vigilance Quickstart stage.
LC082.SetStage(11)
if (!CF_Main.GetStageDone(300))
     CF_Main.SetStage(20)
EndIf

;Make sure CF01-06 have shut down so we don't fight over actors.
CF01.Stop()
CF02.Stop()
CF03.Stop()
CF04.Stop()
CF05.Stop()
CF06.Stop()

;Reset the Vigilance, the Key, and their space cells.
LC082VigilanceCF07Location.Reset()
LC082VigilanceLocation.Reset()
StationTheKeyParentLocation.Reset()
StationTheKeyInteriorLocation.Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;Stop stage.

;Stop the subquests.
LC088_Space.SetStage(2000)
if (LC088_Vigilance.IsRunning())
     LC088_Vigilance.SetStage(2000)
EndIf
if (LC088_Key.IsRunning())
     LC088_Key.SetStage(2000)
EndIf

;Then stop this quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LC082_VigilanceQuestScript Property LC082 Auto Const Mandatory

Quest Property CF01 Auto Const Mandatory

Quest Property CF02 Auto Const Mandatory

Quest Property LC088_Space Auto Const Mandatory

Quest Property LC088_Vigilance Auto Const Mandatory

Quest Property LC088_Key Auto Const Mandatory

Quest Property CF03 Auto Const Mandatory

Quest Property CF04 Auto Const Mandatory

Quest Property CF05 Auto Const Mandatory

Quest Property CF06 Auto Const Mandatory

Location property LC082VigilanceCF07Location Auto Const Mandatory
Location property LC082VigilanceLocation Auto Const Mandatory
Location property StationTheKeyParentLocation Auto Const Mandatory
Location property StationTheKeyInteriorLocation Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory
