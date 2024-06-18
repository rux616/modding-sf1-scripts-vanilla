;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestDialogueSystem2_000031B4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;use the special transition doors to move the player to the other cell
MQ101MagicDoortoVecteraExt.Activate(Game.GetPlayer(), True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;test affinity event
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

AffinityEvent Property TestWillAffinityEvent Auto Const Mandatory

ReferenceAlias Property Alias_TestTeller Auto Const Mandatory

ReferenceAlias Property Alias_TestOutsideScene Auto Const Mandatory

ObjectReference Property MQ101MagicDoortoVecteraExt Auto Const Mandatory
