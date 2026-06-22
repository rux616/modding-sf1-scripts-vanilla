;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueNeonConvo_Securit_0034D426 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
if Alias_ScanSceneEnabler.GetRef().IsDisabled() == true
 Alias_ScanSceneEnabler.GetRef().Enable()
 Alias_CheckpointController.GetRef().Enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DialogueNeonConvo_SecurityCheckpoint.Start()

;SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueNeonConvo_SecurityCheckpoint Auto Const Mandatory

ReferenceAlias Property Alias_ScanSceneEnabler Auto Const Mandatory

ReferenceAlias Property Alias_CheckpointController Auto Const Mandatory
