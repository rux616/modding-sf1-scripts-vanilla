;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NA_Aquilus01_0007BDBF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;If player is within reasonable distance to Aquilus when scene ends, and MQ206b isn't running, pop misc objective to talk to him
If Alias_Aquilus.GetReference().GetDistance(Game.GetPlayer()) < (Settlement_Convo_NPC_Distance.GetValue())
if MQ206B.IsRunning() == 0
City_NA_Aquilus01Misc.Start()
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Alias_Terrance.GetReference().Disable()
Alias_Andreas.GetReference().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property City_NA_Aquilus01Misc Auto Const Mandatory

ReferenceAlias Property Alias_Target_Book Auto Const Mandatory

GlobalVariable Property Settlement_Convo_NPC_Distance Auto Const Mandatory

ReferenceAlias Property Alias_Aquilus Auto Const Mandatory

Quest Property MQ206B Auto Const Mandatory

ReferenceAlias Property Alias_Marcus Auto Const Mandatory

ReferenceAlias Property Alias_Terrance Auto Const Mandatory

ReferenceAlias Property Alias_Catherine Auto Const Mandatory

ReferenceAlias Property Alias_Andreas Auto Const Mandatory
