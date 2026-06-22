;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueCydonia_Announcem_0033802E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
DialogueCydonia_Announcement01_Scene.Stop()
DialogueCydonia_Announcement01_Scene_Int02.Stop()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CY_DetonationCount Auto Const Mandatory

Scene Property DialogueCydonia_Announcement01_Scene Auto Const Mandatory

ReferenceAlias Property Alias_AnnouncementMarker Auto Const Mandatory

ReferenceAlias Property Alias_AnnouncementMarkerInt02 Auto Const Mandatory

Scene Property DialogueCydonia_Announcement01_Scene_Int02 Auto Const Mandatory
