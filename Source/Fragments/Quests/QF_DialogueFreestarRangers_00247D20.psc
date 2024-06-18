;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueFreestarRangers_00247D20 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Disable the map marker at Freestar Mech Factory
Alias_FreestarMechFactoryMapMarker.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
DialogueFreestarRangers_MaryHelgaIntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
Alias_HelgaDubray.GetActorRef().EvaluatePackage()
Alias_MaryCartwright.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
DialogueFreestarRangers_AugustEmmaScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DialogueFreestarRangers_MaryHelgaIntroScene Auto Const Mandatory

Scene Property DialogueFreestarRangers_AugustEmmaScene Auto Const Mandatory

ReferenceAlias Property Alias_HelgaDubray Auto Const Mandatory

ReferenceAlias Property Alias_MaryCartwright Auto Const Mandatory

ReferenceAlias Property Alias_FreestarMechFactoryMapMarker Auto Const Mandatory
