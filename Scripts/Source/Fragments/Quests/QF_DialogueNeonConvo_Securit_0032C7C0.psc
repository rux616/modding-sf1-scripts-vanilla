;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueNeonConvo_Securit_0032C7C0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_ScanSceneTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DialogueNeonConvo_SecurityCheckpointScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_ScanSceneTrigger.GetRef().Disable()
Alias_ScanSceneTriggerEnabler.GetRef().Disable()
Alias_CheckpointController.GetRef().Disable()

DialogueNeonConvo_SecurityCheckpoint_Controller.SetStage(20)

Stop()
Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_ScanSceneTrigger Auto Const Mandatory

ReferenceAlias Property Alias_ScanSceneTriggerEnabler Auto Const Mandatory

ReferenceAlias Property Alias_ScanSceneTriggerDisabler Auto Const Mandatory

Scene Property DialogueNeonConvo_SecurityCheckpointScene Auto Const Mandatory

Quest Property DialogueNeonConvo_SecurityCheckpoint_Controller Auto Const Mandatory

ReferenceAlias Property Alias_CheckpointController Auto Const Mandatory
