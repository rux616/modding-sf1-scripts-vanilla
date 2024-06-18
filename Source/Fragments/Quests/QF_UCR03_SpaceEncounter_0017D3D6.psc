;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UCR03_SpaceEncounter_0017D3D6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Hand the newly spawned patrol markers over to the main quest
UCR03QuestScript UCR03Obj = UCR03 as UCR03QuestScript
UCR03Obj.GeneralMarker.ForceRefTo(Alias_GeneralMarker.GetRef())

;And now tell that quest to start generating enemies!
UCR03.SetStage(210)

;Now shut down and restart
Stop()
Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property UCR03 Auto Const Mandatory

RefCollectionAlias Property Alias_PatrolMarkers Auto Const Mandatory

ReferenceAlias Property Alias_GeneralMarker Auto Const Mandatory
